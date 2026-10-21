<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run()
    {
        $db = \Config\Database::connect();

        $categories = [
            [
                'name'        => 'Vessels & Forms',
                'slug'        => 'vessels-forms',
                'description' => 'Geometric planters, bowls, and sculptural vessels',
                'sort_order'  => 1,
                'created_at'  => date('Y-m-d H:i:s'),
                'updated_at'  => date('Y-m-d H:i:s'),
            ],
            [
                'name'        => 'Desk & Studio',
                'slug'        => 'desk-studio',
                'description' => 'Docks, trays, cable guides, and tactile desktop tools',
                'sort_order'  => 2,
                'created_at'  => date('Y-m-d H:i:s'),
                'updated_at'  => date('Y-m-d H:i:s'),
            ],
            [
                'name'        => 'Architectural',
                'slug'        => 'architectural',
                'description' => 'Modular brackets, hooks, structural specimens',
                'sort_order'  => 3,
                'created_at'  => date('Y-m-d H:i:s'),
                'updated_at'  => date('Y-m-d H:i:s'),
            ],
            [
                'name'        => 'Custom Mesh',
                'slug'        => 'custom-mesh',
                'description' => 'Client-uploaded geometry manufacturing orders',
                'sort_order'  => 4,
                'created_at'  => date('Y-m-d H:i:s'),
                'updated_at'  => date('Y-m-d H:i:s'),
            ],
        ];

        foreach ($categories as $cat) {
            $existing = $db->table('categories')->where('slug', $cat['slug'])->get()->getRow();
            if ($existing) {
                $db->table('categories')->where('slug', $cat['slug'])->update($cat);
            } else {
                $db->table('categories')->insert($cat);
            }
        }
    }
}
