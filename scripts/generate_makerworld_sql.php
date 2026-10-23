<?php

$csvPath = dirname(__DIR__) . '/database/makerworld_new_products_seo.csv';
$lines = file($csvPath);
$header = str_getcsv(array_shift($lines));

$categoriesMap = [
    'Carry Gear'   => ['slug' => 'carry-gear',   'desc' => 'Everyday carry cases, carabiners, and modular EDC attachments.'],
    'Organizers'   => ['slug' => 'organizers',   'desc' => 'Desktop caddies, pen holders, and modular workstation dividers.'],
    'Keyboards'    => ['slug' => 'keyboards',    'desc' => 'Ergonomic cases, custom keycaps, and mechanical numpad enclosures.'],
    'Lamps'        => ['slug' => 'lamps',        'desc' => 'Parametric ambient lighting, diffusers, and pendant lamp shades.'],
    'Bathroom'     => ['slug' => 'bathroom',     'desc' => 'Water-draining soap trays and architectural countertop vessels.'],
    'Kitchen'      => ['slug' => 'kitchen',      'desc' => 'Precision volumetric scoops and functional culinary utensils.'],
    'Stands'       => ['slug' => 'stands',       'desc' => 'Ergonomic phone docks, multi-device stands, and laptop props.'],
    'Decor'        => ['slug' => 'decor',        'desc' => 'Sculptural vases, Japandi planters, and wabi-sabi artifacts.'],
    'Desk Setup'   => ['slug' => 'desk-setup',   'desc' => 'Workspace ergonomics, riser attachments, and wrist rests.'],
    'Trash Bins'   => ['slug' => 'trash-bins',   'desc' => 'Minimalist desktop bins with swing and magnetic lid closures.'],
    'Wall Mounts'  => ['slug' => 'wall-mounts',  'desc' => 'Modular interlocking wall tiles and drill-free LED channels.'],
    'Wrist Rests'  => ['slug' => 'wrist-rests',  'desc' => 'Hex-pattern and contoured wrist supports for mechanical typing.'],
    'Gadgets'      => ['slug' => 'gadgets',      'desc' => 'Cable strain relief wraps, adapters, and functional daily tools.'],
    'Storage'      => ['slug' => 'storage',      'desc' => 'Print-in-place hinged boxes, photo vaults, and hardware trays.'],
];

$sql = "-- ============================================================\n";
$sql .= "-- Kerf 3D Studio — 55 MakerWorld Products Seed Script\n";
$sql .= "-- ============================================================\n\n";
$sql .= "USE `kerf3d`;\n\n";
$sql .= "-- 1. Insert Missing Categories\n";

$catOrder = 10;
foreach ($categoriesMap as $name => $meta) {
    $n = addslashes($name);
    $s = addslashes($meta['slug']);
    $d = addslashes($meta['desc']);
    $catOrder++;
    $sql .= "INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)\n";
    $sql .= "VALUES ('{$n}', '{$s}', '{$d}', {$catOrder})\n";
    $sql .= "ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);\n\n";
}

$sql .= "-- 2. Insert 55 MakerWorld Products\n";
$index = 0;
foreach ($lines as $line) {
    $row = str_getcsv($line);
    if (count($row) < 3) continue;
    $prodName = trim($row[0]);
    $catName  = trim($row[1]);
    $seoDesc  = trim($row[2]);
    if (empty($prodName)) continue;
    $index++;
    $sku = sprintf('K3D-MW-%03d', $index);
    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $prodName), '-'));
    $catSlug = $categoriesMap[$catName]['slug'] ?? 'desk-studio';
    $fullDesc = $seoDesc . "\n\nManufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).";
    $tags = strtolower(preg_replace('/[^a-z0-9]+/', '', strtolower($catName))) . ',makerworld,3dprinted,dhaka,kerf3d,custom-print';
    
    $pNameEsc = addslashes($prodName);
    $slugEsc = addslashes($slug);
    $seoDescEsc = addslashes($seoDesc);
    $fullDescEsc = addslashes($fullDesc);
    $tagsEsc = addslashes($tags);
    $sortOrder = 100 + $index;

    $sql .= "INSERT INTO `products` (\n";
    $sql .= "    `sku`, `name`, `slug`, `short_description`, `description`,\n";
    $sql .= "    `category_id`, `catalog_type`, `status`, `tags`,\n";
    $sql .= "    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,\n";
    $sql .= "    `creator`, `license`, `attribution_text`, `sort_order`\n";
    $sql .= ") VALUES (\n";
    $sql .= "    '{$sku}', '{$pNameEsc}', '{$slugEsc}', '{$seoDescEsc}', '{$fullDescEsc}',\n";
    $sql .= "    (SELECT `id` FROM `categories` WHERE `slug` = '{$catSlug}' LIMIT 1), 'ready_made', 'active', '{$tagsEsc}',\n";
    $sql .= "    0.00, 0.20, 20, 1,\n";
    $sql .= "    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', {$sortOrder}\n";
    $sql .= ") ON DUPLICATE KEY UPDATE\n";
    $sql .= "    `short_description` = VALUES(`short_description`),\n";
    $sql .= "    `description` = VALUES(`description`),\n";
    $sql .= "    `status` = 'active';\n\n";
}

$outPath = dirname(__DIR__) . '/database/seed_makerworld_products.sql';
file_put_contents($outPath, $sql);
echo "Generated {$outPath} successfully with {$index} products.\n";
