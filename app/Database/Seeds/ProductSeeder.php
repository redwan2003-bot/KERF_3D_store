<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run()
    {
        $db = \Config\Database::connect();

        $products = [
            [
                'sku'                => 'K3D-001',
                'name'               => 'Arc Vessel',
                'slug'               => 'arc-vessel',
                'short_description'  => 'Architectural ribbed vessel with parabolic fluting. Engineered for zero-support continuous extrusion on Bambu Lab A1.',
                'description'        => 'The Arc Vessel explores mathematical fluting to achieve extreme structural rigidity without internal infill penalties. Printed in high-grade PLA at 0.16mm layer resolution, each contour captures and diffuses ambient natural light with architectural presence.',
                'category_id'        => 1, // Vessels & Forms
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'vessel,planter,fluted,minimalist,homeware',
                'price_bdt'          => 780.00,
                'weight_g'           => 140.00,
                'dimensions_mm'      => '120 × 120 × 180 mm',
                'layer_height_mm'    => 0.16,
                'infill_percent'     => 15,
                'print_time_minutes' => 310,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null, // Auto-discovered by slug
                'sort_order'         => 1,
            ],
            [
                'sku'                => 'K3D-006',
                'name'               => 'Grid Dock',
                'slug'               => 'grid-dock',
                'short_description'  => 'Weighted parametric tray with channeled cable routing and smartphone resting angle.',
                'description'        => 'Designed for desk workflows that demand tactile order. The Grid Dock houses daily essentials with calibrated chamfers and rear cable pass-through channels that keep charging cables locked at an ergonomic grab angle.',
                'category_id'        => 2, // Desk & Studio
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'desk,organizer,dock,cable,workspace',
                'price_bdt'          => 520.00,
                'weight_g'           => 85.00,
                'dimensions_mm'      => '160 × 75 × 32 mm',
                'layer_height_mm'    => 0.20,
                'infill_percent'     => 20,
                'print_time_minutes' => 195,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 2,
            ],
            [
                'sku'                => 'K3D-011',
                'name'               => 'Flex Loop',
                'slug'               => 'flex-loop',
                'short_description'  => 'Compliant TPU 95A wristlet and tactile key loop utilizing elastic lattice tension.',
                'description'        => 'Manufactured from shore 95A thermoplastic polyurethane. Flex Loop is virtually indestructible, highly resistant to abrasion, and features a smooth, satisfying mechanical snap that clips onto lanyards and carabiners.',
                'category_id'        => 2, // Desk & Studio
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'tpu,flexible,edc,keychain,wearable',
                'price_bdt'          => 410.00,
                'weight_g'           => 42.00,
                'dimensions_mm'      => '90 × 40 × 18 mm',
                'layer_height_mm'    => 0.20,
                'infill_percent'     => 100,
                'print_time_minutes' => 110,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 3,
            ],
            [
                'sku'                => 'K3D-014',
                'name'               => 'Stack Planter',
                'slug'               => 'stack-planter',
                'short_description'  => 'Dual-tier self-aerating planter with modular drainage reservoir.',
                'description'        => 'A modular botanical artifact that isolates root moisture while circulating air through internal vent slots. Fits standard 4-inch nursery pots directly or houses succulents with volcanic rock drainage.',
                'category_id'        => 1, // Vessels & Forms
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'planter,botanical,succulent,drainage,interiors',
                'price_bdt'          => 1120.00,
                'weight_g'           => 210.00,
                'dimensions_mm'      => '150 × 150 × 140 mm',
                'layer_height_mm'    => 0.16,
                'infill_percent'     => 18,
                'print_time_minutes' => 450,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 4,
            ],
            [
                'sku'                => 'K3D-017',
                'name'               => 'Keystone Hook',
                'slug'               => 'keystone-hook',
                'short_description'  => 'High-load structural wall peg utilizing triangular shear force distribution.',
                'description'        => 'Engineered to support heavy overcoats, headphones, and camera bags up to 8kg. Features a concealed screw-mounting channel that creates a floating architectural silhouette against wall surfaces.',
                'category_id'        => 3, // Architectural
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'hook,hardware,architectural,hanger,coat-rack',
                'price_bdt'          => 460.00,
                'weight_g'           => 58.00,
                'dimensions_mm'      => '65 × 35 × 110 mm',
                'layer_height_mm'    => 0.20,
                'infill_percent'     => 40,
                'print_time_minutes' => 140,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 5,
            ],
            [
                'sku'                => 'K3D-018',
                'name'               => 'Mono Tray',
                'slug'               => 'mono-tray',
                'short_description'  => 'Minimalist chamfered desk organiser with micro-texture surface.',
                'description'        => 'The Mono Tray serves as a tactile landing zone for watches, rings, fountain pens, and small electronics. Printed with a concentric top-infill pattern that catches light and resists surface scuffs.',
                'category_id'        => 2, // Desk & Studio
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'tray,catchall,stationery,valet,desktop',
                'price_bdt'          => 890.00,
                'weight_g'           => 160.00,
                'dimensions_mm'      => '220 × 140 × 24 mm',
                'layer_height_mm'    => 0.16,
                'infill_percent'     => 15,
                'print_time_minutes' => 360,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 6,
            ],
            [
                'sku'                => 'K3D-021',
                'name'               => 'Tactile Cable Dock',
                'slug'               => 'tactile-cable-dock',
                'short_description'  => 'Desktop cable capture hub with friction-fit retention channels.',
                'description'        => 'Prevents USB-C, Lightning, and display cables from falling behind desks. The calibrated channel taper grips cables firmly without crimping delicate braiding or insulation.',
                'category_id'        => 2, // Desk & Studio
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'cable-management,usbc,desk-setup,cord-organizer',
                'price_bdt'          => 480.00,
                'weight_g'           => 75.00,
                'dimensions_mm'      => '110 × 55 × 28 mm',
                'layer_height_mm'    => 0.20,
                'infill_percent'     => 25,
                'print_time_minutes' => 170,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 7,
            ],
            [
                'sku'                => 'K3D-024',
                'name'               => 'Bauhaus Desk Tidy',
                'slug'               => 'bauhaus-desk-tidy',
                'short_description'  => 'Geometric pen and card caddy inspired by Dessau architectural proportions.',
                'description'        => 'An asymmetrical tri-compartment vessel designed to hold writing instruments, business cards, and small scissors. Combines pure geometry with functional ergonomics for the modern studio space.',
                'category_id'        => 2, // Desk & Studio
                'catalog_type'       => 'ready_made',
                'status'             => 'active',
                'tags'               => 'bauhaus,pen-holder,caddy,architectural-desk',
                'price_bdt'          => 720.00,
                'weight_g'           => 130.00,
                'dimensions_mm'      => '180 × 100 × 55 mm',
                'layer_height_mm'    => 0.16,
                'infill_percent'     => 20,
                'print_time_minutes' => 290,
                'build_volume_fit'   => 1,
                'creator'            => 'Kerf 3D Studio',
                'license'            => 'Standard Commercial',
                'attribution_text'   => 'Original studio design by Kerf 3D',
                'drive_folder_id'    => null,
                'sort_order'         => 8,
            ],
        ];

        // Filament shades for PLA (Material ID 1)
        $shades = $db->table('filament_shades')->where('material_id', 1)->get()->getResultArray();

        foreach ($products as $pData) {
            $existing = $db->table('products')->where('slug', $pData['slug'])->get()->getRowArray();
            if ($existing) {
                $db->table('products')->where('id', $existing['id'])->update($pData);
                $productId = (int) $existing['id'];
            } else {
                $db->table('products')->insert($pData);
                $productId = (int) $db->insertID();
            }

            // Populate Variations for each shade
            foreach ($shades as $shade) {
                $varExists = $db->table('product_variations')
                    ->where('product_id', $productId)
                    ->where('material_id', 1)
                    ->where('shade_id', $shade['id'])
                    ->countAllResults();

                if ($varExists === 0) {
                    $db->table('product_variations')->insert([
                        'product_id'   => $productId,
                        'material_id'  => 1,
                        'shade_id'     => $shade['id'],
                        'sku_suffix'   => '-' . strtoupper(substr($shade['slug'], 0, 3)),
                        'price_bdt'    => $pData['price_bdt'],
                        'weight_g'     => $pData['weight_g'],
                        'stock_qty'    => 10,
                        'stock_status' => 'in_stock',
                        'is_active'    => 1,
                        'sort_order'   => $shade['sort_order'],
                    ]);
                }
            }
        }
    }
}
