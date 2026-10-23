<?php

$csvPath419 = dirname(__DIR__) . '/database/makerworld_all_419_products_seo.csv';
$csvPath55  = dirname(__DIR__) . '/database/makerworld_new_products_seo.csv';
$csvPath    = file_exists($csvPath419) ? $csvPath419 : $csvPath55;

$lines = file($csvPath);
$header = str_getcsv(array_shift($lines));

$categoriesMap = [
    'Clocks'         => ['slug' => 'clocks',         'desc' => 'Parametric, geometric, and motorized 3D printed desktop and wall timepieces.'],
    'Organizers'     => ['slug' => 'organizers',     'desc' => 'Desktop caddies, pen holders, and modular workstation dividers.'],
    'QR & Custom'    => ['slug' => 'qr-custom',      'desc' => 'Tactile scannable QR display stands and custom personalized signs.'],
    'Fans & Cooling' => ['slug' => 'fans-cooling',   'desc' => 'Blower cowls, turbine fan ducts, and cooling accessories.'],
    'Carry Gear'     => ['slug' => 'carry-gear',     'desc' => 'Everyday carry cases, carabiners, and modular EDC attachments.'],
    'Lamps'          => ['slug' => 'lamps',          'desc' => 'Parametric ambient lighting, diffusers, and pendant lamp shades.'],
    'Decor'          => ['slug' => 'decor',          'desc' => 'Sculptural vases, Japandi planters, and wabi-sabi artifacts.'],
    'Cables'         => ['slug' => 'cables',         'desc' => 'Friction-fit cable docks, strain reliefs, and channel guides.'],
    'Stands'         => ['slug' => 'stands',         'desc' => 'Ergonomic phone docks, multi-device stands, and laptop props.'],
    'Wall Mounts'    => ['slug' => 'wall-mounts',    'desc' => 'Modular interlocking wall tiles and drill-free LED channels.'],
    'Bathroom'       => ['slug' => 'bathroom',       'desc' => 'Water-draining soap trays and architectural countertop vessels.'],
    'Toys & Figures' => ['slug' => 'toys-figures',   'desc' => 'Print-in-place articulated figures, fidgets, and kinetic models.'],
    'Storage'        => ['slug' => 'storage',        'desc' => 'Print-in-place hinged boxes, photo vaults, and hardware trays.'],
    'Tools & Clips'  => ['slug' => 'tools-clips',    'desc' => 'Workshop calipers, clamp blocks, and mechanical retention clips.'],
    'Gadgets'        => ['slug' => 'gadgets',        'desc' => 'Cable strain relief wraps, adapters, and functional daily tools.'],
    'Keyboards'      => ['slug' => 'keyboards',      'desc' => 'Ergonomic cases, custom keycaps, and mechanical numpad enclosures.'],
    'Kitchen'        => ['slug' => 'kitchen',        'desc' => 'Precision volumetric scoops and functional culinary utensils.'],
    'Pegboards'      => ['slug' => 'pegboards',      'desc' => 'Modular Skadis and pegboard tool holders and storage bins.'],
    'Trash Bins'     => ['slug' => 'trash-bins',     'desc' => 'Minimalist desktop bins with swing and magnetic lid closures.'],
    'Phone Cases'    => ['slug' => 'phone-cases',    'desc' => 'Bespoke textured smartphone bumpers and clamshell cases.'],
    'Wrist Rests'    => ['slug' => 'wrist-rests',    'desc' => 'Hex-pattern and contoured wrist supports for mechanical typing.'],
    'Home Hardware'  => ['slug' => 'home-hardware',  'desc' => 'Handles, hooks, stops, and functional architectural hardware.'],
    'Desk Setup'     => ['slug' => 'desk-setup',     'desc' => 'Workspace ergonomics, riser attachments, and tactile accessories.'],
];

$sql = "-- ============================================================\n";
$sql .= "-- Kerf 3D Studio — 419 MakerWorld Products Seed Script\n";
$sql .= "-- ============================================================\n\n";
$sql .= "USE `kerf3d`;\n\n";
$sql .= "-- 1. Insert Categories\n";

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

$sql .= "-- 2. Insert 419 MakerWorld Products\n";
$index = 0;
$seenSlugs = [];

foreach ($lines as $line) {
    $row = str_getcsv($line);
    if (count($row) < 3) continue;
    $prodName = trim($row[0]);
    $catName  = trim($row[1]);
    $seoDesc  = trim($row[2]);
    if (empty($prodName)) continue;
    $index++;
    $sku = sprintf('K3D-MW-%03d', $index);
    
    $baseSlug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $prodName), '-'));
    $slug = $baseSlug;
    if (isset($seenSlugs[$slug])) {
        $seenSlugs[$baseSlug]++;
        $slug = $baseSlug . '-' . $seenSlugs[$baseSlug];
    } else {
        $seenSlugs[$slug] = 1;
    }

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
