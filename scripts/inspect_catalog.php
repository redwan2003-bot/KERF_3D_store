<?php

$conn = mysqli_connect('db', 'kerf3d_user', 'kerf3d_secret', 'kerf3d');
if (!$conn) die("Database connection failed: " . mysqli_connect_error());

$resTotal = mysqli_query($conn, "SELECT COUNT(*) as cnt FROM products WHERE status = 'active'");
$rowTotal = mysqli_fetch_assoc($resTotal);
echo "Total Active Products in Store: " . $rowTotal['cnt'] . "\n\n";

// Categories breakdown
$resCat = mysqli_query($conn, "
    SELECT c.name as category_name, COUNT(p.id) as cnt 
    FROM products p 
    LEFT JOIN categories c ON p.category_id = c.id 
    WHERE p.status = 'active' 
    GROUP BY p.category_id 
    ORDER BY cnt DESC
");
echo "Categories Breakdown:\n";
while ($cat = mysqli_fetch_assoc($resCat)) {
    echo "  • " . ($cat['category_name'] ?: 'Uncategorized') . ": " . $cat['cnt'] . " products\n";
}

// Pegboard & Skadis ecosystem products
$resPeg = mysqli_query($conn, "
    SELECT p.id, p.name, p.slug, c.name as category_name, p.price_bdt, p.layer_height_mm, p.print_time_minutes
    FROM products p 
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE p.status = 'active' 
      AND (
        p.name LIKE '%pegboard%' OR p.name LIKE '%skadis%' OR p.name LIKE '%tile%' OR p.name LIKE '%hook%' 
        OR p.name LIKE '%mount%' OR p.name LIKE '%organizer%' OR p.name LIKE '%tray%' OR p.name LIKE '%panel%'
        OR p.description LIKE '%pegboard%' OR p.description LIKE '%skadis%'
      )
    ORDER BY p.id DESC
");

echo "\nPegboard & Workspace Organization Products Found: " . mysqli_num_rows($resPeg) . "\n";
while ($p = mysqli_fetch_assoc($resPeg)) {
    echo "  • [#{$p['id']}] {$p['name']} | Cat: {$p['category_name']} | ৳{$p['price_bdt']} | slug: {$p['slug']}\n";
}
