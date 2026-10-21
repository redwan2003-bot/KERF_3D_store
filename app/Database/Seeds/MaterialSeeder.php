<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class MaterialSeeder extends Seeder
{
    public function run()
    {
        $db = \Config\Database::connect();

        // 1. Materials
        $materials = [
            [
                'name'              => 'PLA',
                'slug'              => 'pla',
                'rate_per_gram_bdt' => 6.50,
                'effective_density' => 0.500,
                'customer_label'    => 'PLA / rigid biopolymer',
                'max_hotend_temp_c' => 300,
                'max_bed_temp_c'    => 100,
                'is_recommended'    => 1,
                'is_active'         => 1,
                'created_at'        => date('Y-m-d H:i:s'),
                'updated_at'        => date('Y-m-d H:i:s'),
            ],
            [
                'name'              => 'TPU 95A',
                'slug'              => 'tpu-95a',
                'rate_per_gram_bdt' => 9.75,
                'effective_density' => 0.480,
                'customer_label'    => 'TPU 95A / flexible',
                'max_hotend_temp_c' => 300,
                'max_bed_temp_c'    => 100,
                'is_recommended'    => 1,
                'is_active'         => 1,
                'created_at'        => date('Y-m-d H:i:s'),
                'updated_at'        => date('Y-m-d H:i:s'),
            ],
            [
                'name'              => 'PETG',
                'slug'              => 'petg',
                'rate_per_gram_bdt' => 7.50,
                'effective_density' => 0.500,
                'customer_label'    => 'PETG / engineering',
                'max_hotend_temp_c' => 300,
                'max_bed_temp_c'    => 100,
                'is_recommended'    => 1,
                'is_active'         => 0, // Inactive pending owner rate verification
                'created_at'        => date('Y-m-d H:i:s'),
                'updated_at'        => date('Y-m-d H:i:s'),
            ],
        ];

        foreach ($materials as $material) {
            $existing = $db->table('materials')->where('slug', $material['slug'])->get()->getRow();
            if ($existing) {
                $db->table('materials')->where('slug', $material['slug'])->update($material);
            } else {
                $db->table('materials')->insert($material);
            }
        }

        // Get PLA ID
        $pla = $db->table('materials')->where('slug', 'pla')->get()->getRow();

        // 2. Filament Shades for PLA
        if ($pla) {
            $shades = [
                ['name' => 'Terracotta',     'slug' => 'terracotta',      'hex_color' => '#C86446', 'sort_order' => 1],
                ['name' => 'Matte Black',    'slug' => 'matte-black',     'hex_color' => '#181818', 'sort_order' => 2],
                ['name' => 'Parchment White','slug' => 'parchment-white', '#hex_color' => '#F8F6F0', 'sort_order' => 3],
                ['name' => 'Silk Gold',      'slug' => 'silk-gold',       'hex_color' => '#C4A052', 'sort_order' => 4],
                ['name' => 'Olive Drab',     'slug' => 'olive-drab',      'hex_color' => '#4A4A28', 'sort_order' => 5],
            ];

            foreach ($shades as $shade) {
                $shade['material_id'] = $pla->id;
                $shade['is_active']   = 1;
                $shade['created_at']  = date('Y-m-d H:i:s');
                $shade['updated_at']  = date('Y-m-d H:i:s');

                $exists = $db->table('filament_shades')
                    ->where('material_id', $pla->id)
                    ->where('slug', $shade['slug'])
                    ->get()
                    ->getRow();

                if ($exists) {
                    $db->table('filament_shades')
                        ->where('material_id', $pla->id)
                        ->where('slug', $shade['slug'])
                        ->update($shade);
                } else {
                    $db->table('filament_shades')->insert($shade);
                }
            }
        }
    }
}
