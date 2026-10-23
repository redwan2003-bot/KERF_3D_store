<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class MakerWorldProductSeeder extends Seeder
{
    public function run()
    {
        $db = \Config\Database::connect();

        // Prefer the full 419 product catalog if present
        $csvPath419 = ROOTPATH . 'database/makerworld_all_419_products_seo.csv';
        $csvPath55  = ROOTPATH . 'database/makerworld_new_products_seo.csv';
        $csvPath    = file_exists($csvPath419) ? $csvPath419 : $csvPath55;

        if (!file_exists($csvPath)) {
            echo "CSV file not found at: {$csvPath}\n";
            return;
        }

        $file = fopen($csvPath, 'r');
        if (!$file) {
            echo "Failed to open CSV file: {$csvPath}\n";
            return;
        }

        // Read header row: Product Name,Category,SEO Description
        $header = fgetcsv($file);

        // Pre-create/verify categories lookup map
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

        $categoryIdCache = [];
        $catOrder = 10;
        foreach ($categoriesMap as $catName => $meta) {
            $existing = $db->table('categories')->where('slug', $meta['slug'])->get()->getRowArray();
            if ($existing) {
                $categoryIdCache[$catName] = (int) $existing['id'];
            } else {
                $db->table('categories')->insert([
                    'name'        => $catName,
                    'slug'        => $meta['slug'],
                    'description' => $meta['desc'],
                    'sort_order'  => ++$catOrder,
                    'created_at'  => date('Y-m-d H:i:s'),
                    'updated_at'  => date('Y-m-d H:i:s'),
                ]);
                $categoryIdCache[$catName] = (int) $db->insertID();
            }
        }

        $index = 0;
        $insertedCount = 0;
        $updatedCount  = 0;
        $seenSlugs = [];

        while (($row = fgetcsv($file)) !== false) {
            if (count($row) < 3) continue;

            $prodName = trim($row[0]);
            $catName  = trim($row[1]);
            $seoDesc  = trim($row[2]);

            if (empty($prodName)) continue;

            $index++;
            $sku = sprintf('K3D-MW-%03d', $index);
            
            // Clean slug with collision handling
            $baseSlug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $prodName), '-'));
            $slug = $baseSlug;
            if (isset($seenSlugs[$slug])) {
                $seenSlugs[$baseSlug]++;
                $slug = $baseSlug . '-' . $seenSlugs[$baseSlug];
            } else {
                $seenSlugs[$slug] = 1;
            }

            // Ensure category exists
            if (!isset($categoryIdCache[$catName])) {
                $dynSlug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $catName), '-'));
                $dynCat = $db->table('categories')->where('slug', $dynSlug)->get()->getRowArray();
                if ($dynCat) {
                    $categoryIdCache[$catName] = (int) $dynCat['id'];
                } else {
                    $db->table('categories')->insert([
                        'name'        => $catName,
                        'slug'        => $dynSlug,
                        'description' => "Curated {$catName} artifacts manufactured by Kerf 3D Studio.",
                        'sort_order'  => ++$catOrder,
                        'created_at'  => date('Y-m-d H:i:s'),
                        'updated_at'  => date('Y-m-d H:i:s'),
                    ]);
                    $categoryIdCache[$catName] = (int) $db->insertID();
                }
            }

            $categoryId = $categoryIdCache[$catName];

            $fullDesc = $seoDesc . "\n\n" . 
                "Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. " .
                "Each specimen is sliced with tuned layer heights and continuous extrusion profiles for exceptional surface finish. " .
                "Direct order and custom material inquiry available via WhatsApp (+8801754550297).";

            $tags = strtolower(implode(',', array_filter([
                preg_replace('/[^a-z0-9]+/', '', strtolower($catName)),
                'makerworld',
                '3dprinted',
                'dhaka',
                'kerf3d',
                'custom-print'
            ])));

            $productData = [
                'sku'                => $sku,
                'name'               => $prodName,
                'slug'               => $slug,
                'short_description'  => $seoDesc,
                'description'        => $fullDesc,
                'category_id'        => $categoryId,
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => $tags,
                'price_bdt'          => 0.00, // Price on Request via WhatsApp
                'weight_g'           => null,
                'dimensions_mm'      => null,
                'layer_height_mm'    => 0.20,
                'infill_percent'     => 20,
                'print_time_minutes' => null,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka',
                'drive_folder_id'    => null,
                'sort_order'         => 100 + $index,
                'updated_at'         => date('Y-m-d H:i:s'),
            ];

            // Check if product already exists by slug or name
            $existing = $db->table('products')
                ->where('slug', $slug)
                ->orWhere('name', $prodName)
                ->get()
                ->getRowArray();

            if ($existing) {
                unset($productData['sku']); // Retain existing SKU if already seeded
                $db->table('products')->where('id', $existing['id'])->update($productData);
                $updatedCount++;
            } else {
                $productData['created_at'] = date('Y-m-d H:i:s');
                $db->table('products')->insert($productData);
                $insertedCount++;
            }
        }

        fclose($file);

        echo "MakerWorld Seeder finished: {$insertedCount} products inserted, {$updatedCount} updated (source: " . basename($csvPath) . ").\n";
    }
}
