import os
import re
import sys
import traceback
import pymysql
from PIL import Image
import rembg

sys.stdout.reconfigure(line_buffering=True)
sys.stderr.reconfigure(line_buffering=True)

# Parse command line args: e.g. --limit=5 or --start=1 --end=419
limit = None
for arg in sys.argv[1:]:
    if arg.startswith("--limit="):
        limit = int(arg.split("=")[1])

INBOX_DIR = "/var/www/vhosts/localhost/html/writable/image_inbox"
OUT_PRODUCTS_DIR = "/var/www/vhosts/localhost/html/public/assets/images/products"
OUT_STAGING_DIR = "/var/www/vhosts/localhost/html/writable/drive_staging"

os.makedirs(OUT_PRODUCTS_DIR, exist_ok=True)
os.makedirs(OUT_STAGING_DIR, exist_ok=True)

# Connect to database
print("Connecting to MariaDB...")
cnx = pymysql.connect(
    user='kerf3d_user',
    password='kerf3d_secret',
    host='db',
    database='kerf3d',
    cursorclass=pymysql.cursors.DictCursor
)
cursor = cnx.cursor()

# Fetch all products with their categories
query = """
SELECT p.id, p.sku, p.name, p.slug, p.drive_folder_id, c.name as category_name
FROM products p
LEFT JOIN categories c ON c.id = p.category_id
WHERE p.status = 'active' AND p.sku LIKE 'K3D-MW-%'
ORDER BY p.id ASC
"""
cursor.execute(query)
products = cursor.fetchall()
print(f"Loaded {len(products)} MakerWorld products from database.")

sku_map = {p['sku']: p for p in products}

# Map files in inbox by 3-digit prefix
inbox_files = os.listdir(INBOX_DIR)
file_map = {}
for f in inbox_files:
    m = re.match(r"^(\d{3})_", f)
    if m:
        num = int(m.group(1))
        sku = f"K3D-MW-{num:03d}"
        file_map[sku] = os.path.join(INBOX_DIR, f)

print(f"Mapped {len(file_map)} cover files from inbox.")

# Initialize AI Rembg session
print("Initializing U2-Net AI background removal model...")
session = rembg.new_session("u2net")
print("Model ready!")

BG_HEX = "#f6f3eb"
hex_val = BG_HEX.lstrip("#")
bg_rgb = tuple(int(hex_val[i:i+2], 16) for i in (0, 2, 4))
CANVAS_SIZE = 1200
PADDING_RATIO = 0.11 # 11% padding ensures comfortable margins without distortion
TARGET_BOX = int(CANVAS_SIZE * (1 - 2 * PADDING_RATIO))

processed_count = 0

for p in products:
    sku = p['sku']
    if sku not in file_map:
        continue

    input_file = file_map[sku]
    slug = p['slug']
    cat_name = p['category_name'] or 'General'
    p_name = p['name']

    out_file = os.path.join(OUT_PRODUCTS_DIR, f"{slug}.webp")
    cat_staging_dir = os.path.join(OUT_STAGING_DIR, cat_name, f"{p_name} ({slug})")
    os.makedirs(cat_staging_dir, exist_ok=True)
    staging_file = os.path.join(cat_staging_dir, "cover.webp")

    # Skip if already processed and linked in DB
    if os.path.exists(out_file) and os.path.getsize(out_file) > 1000:
        cursor.execute("SELECT id FROM product_images WHERE product_id = %s", (p['id'],))
        if cursor.fetchone():
            processed_count += 1
            continue

    try:
        # 1. Process image
        with Image.open(input_file) as raw_img:
            img = raw_img.convert("RGBA")

        # Background removal
        cutout = rembg.remove(img, session=session)

        # Bounding box & crop
        bbox = cutout.getbbox()
        if bbox:
            cutout = cutout.crop(bbox)

        w, h = cutout.size
        scale = min(TARGET_BOX / w, TARGET_BOX / h)
        new_w = max(1, int(w * scale))
        new_h = max(1, int(h * scale))
        cutout = cutout.resize((new_w, new_h), Image.Resampling.LANCZOS)

        # Canvas composition
        canvas = Image.new("RGBA", (CANVAS_SIZE, CANVAS_SIZE), bg_rgb + (255,))
        paste_x = (CANVAS_SIZE - new_w) // 2
        paste_y = (CANVAS_SIZE - new_h) // 2
        canvas.alpha_composite(cutout, (paste_x, paste_y))

        final_img = canvas.convert("RGB")
        final_img.save(out_file, "WEBP", quality=90, method=6)
        final_img.save(staging_file, "WEBP", quality=90, method=6)

        # 2. Update MySQL product_images table
        public_url = f"/assets/images/products/{slug}.webp"
        
        # Check if record exists
        cursor.execute("SELECT id FROM product_images WHERE product_id = %s", (p['id'],))
        row = cursor.fetchone()
        if row:
            update_sql = """
            UPDATE product_images 
            SET filename = %s, drive_file_id = %s, drive_url = %s, drive_thumbnail_url = %s, is_primary = 1
            WHERE id = %s
            """
            cursor.execute(update_sql, (f"{slug}.webp", f"local_{slug}", public_url, public_url, row['id']))
        else:
            insert_sql = """
            INSERT INTO product_images (product_id, filename, drive_file_id, drive_url, drive_thumbnail_url, is_primary, sort_order)
            VALUES (%s, %s, %s, %s, %s, 1, 0)
            """
            cursor.execute(insert_sql, (p['id'], f"{slug}.webp", f"local_{slug}", public_url, public_url))
        
        cnx.commit()
        processed_count += 1
        print(f"[{processed_count}] {sku} -> {slug}.webp ({cat_name})")

        if limit and processed_count >= limit:
            print(f"Reached limit of {limit} products.")
            break

    except Exception as e:
        print(f"ERROR on {sku}: {e}")
        traceback.print_exc()

cursor.close()
cnx.close()
print(f"DONE! Processed {processed_count} products.")
