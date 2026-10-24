import os
import re
import sys
import pymysql
from PIL import Image, ImageOps

sys.stdout.reconfigure(line_buffering=True)
sys.stderr.reconfigure(line_buffering=True)

INBOX_DIR = "/var/www/vhosts/localhost/html/writable/image_inbox"
OUT_STAGING_DIR = "/var/www/vhosts/localhost/html/writable/drive_staging"
OUT_PUBLIC_DIR = "/var/www/vhosts/localhost/html/public/assets/images/products"

os.makedirs(OUT_STAGING_DIR, exist_ok=True)
os.makedirs(OUT_PUBLIC_DIR, exist_ok=True)

# Parse limit argument if provided
limit = None
for arg in sys.argv[1:]:
    if arg.startswith("--limit="):
        limit = int(arg.split("=")[1])

# Connect to database
cnx = pymysql.connect(
    user='kerf3d_user',
    password='kerf3d_secret',
    host='db',
    database='kerf3d',
    cursorclass=pymysql.cursors.DictCursor
)
cursor = cnx.cursor()

query = """
SELECT p.id, p.sku, p.name, p.slug, c.name as category_name
FROM products p
LEFT JOIN categories c ON c.id = p.category_id
WHERE p.status = 'active' AND p.sku LIKE 'K3D-MW-%'
ORDER BY p.id ASC
"""
cursor.execute(query)
products = cursor.fetchall()

# Map inbox files by 3-digit number
inbox_files = os.listdir(INBOX_DIR)
file_map = {}
for f in inbox_files:
    m = re.match(r"^(\d{3})_", f)
    if m:
        num = int(m.group(1))
        file_map[f"K3D-MW-{num:03d}"] = os.path.join(INBOX_DIR, f)

print(f"Loaded {len(products)} products, mapped {len(file_map)} source images.")

converted = 0
for p in products:
    sku = p['sku']
    if sku not in file_map:
        continue
    
    input_file = file_map[sku]
    slug = p['slug']
    cat_name = (p['category_name'] or 'General').replace('/', '-').strip()
    p_name = p['name']
    safe_p_name = re.sub(r'[/\\:?*"<>|]', '-', p_name).strip()
    safe_p_name = re.sub(r'-+', '-', safe_p_name).strip('- ')

    cat_staging_dir = os.path.join(OUT_STAGING_DIR, cat_name, f"{safe_p_name} ({slug})")
    os.makedirs(cat_staging_dir, exist_ok=True)
    staging_file = os.path.join(cat_staging_dir, "cover.webp")
    public_file = os.path.join(OUT_PUBLIC_DIR, f"{slug}.webp")

    try:
        with Image.open(input_file) as raw_img:
            # 1. Fix orientation according to EXIF (prevents sideways or upside-down images)
            img = ImageOps.exif_transpose(raw_img)

            # 2. Maintain exact aspect ratio and convert color mode cleanly
            if img.mode in ('RGBA', 'LA') or (img.mode == 'P' and 'transparency' in img.info):
                final_img = img.convert('RGBA')
            else:
                final_img = img.convert('RGB')

            # 3. Save as high-quality WebP with native dimensions (zero distortion / stretching)
            final_img.save(staging_file, "WEBP", quality=92, method=6)
            final_img.save(public_file, "WEBP", quality=92, method=6)

        converted += 1
        if converted % 50 == 0 or converted == len(products) or (limit and converted <= limit):
            w, h = final_img.size
            print(f"[{converted}] {sku} -> {slug}.webp ({w}x{h}, {cat_name})")

        if limit and converted >= limit:
            print(f"Reached limit of {limit}.")
            break

    except Exception as e:
        print(f"ERROR on {sku}: {e}")

cursor.close()
cnx.close()
print(f"DONE! Successfully converted {converted} images to WebP.")
