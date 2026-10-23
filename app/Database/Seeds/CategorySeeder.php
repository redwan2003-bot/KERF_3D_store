<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run()
    {
        $db = \Config\Database::connect();

        $categories = [
            ['name' => 'Clocks',         'slug' => 'clocks',         'description' => 'Parametric, geometric, and motorized 3D printed desktop and wall timepieces.', 'sort_order' => 1],
            ['name' => 'Organizers',     'slug' => 'organizers',     'description' => 'Desktop caddies, pen holders, and modular workstation dividers.', 'sort_order' => 2],
            ['name' => 'QR & Custom',    'slug' => 'qr-custom',      'description' => 'Tactile scannable QR display stands and custom personalized signs.', 'sort_order' => 3],
            ['name' => 'Fans & Cooling', 'slug' => 'fans-cooling',   'description' => 'Blower cowls, turbine fan ducts, and cooling accessories.', 'sort_order' => 4],
            ['name' => 'Carry Gear',     'slug' => 'carry-gear',     'description' => 'Everyday carry cases, carabiners, and modular EDC attachments.', 'sort_order' => 5],
            ['name' => 'Lamps',          'slug' => 'lamps',          'description' => 'Parametric ambient lighting, diffusers, and pendant lamp shades.', 'sort_order' => 6],
            ['name' => 'Decor',          'slug' => 'decor',          'description' => 'Sculptural vases, Japandi planters, and wabi-sabi artifacts.', 'sort_order' => 7],
            ['name' => 'Cables',         'slug' => 'cables',         'description' => 'Friction-fit cable docks, strain reliefs, and channel guides.', 'sort_order' => 8],
            ['name' => 'Stands',         'slug' => 'stands',         'description' => 'Ergonomic phone docks, multi-device stands, and laptop props.', 'sort_order' => 9],
            ['name' => 'Wall Mounts',    'slug' => 'wall-mounts',    'description' => 'Modular interlocking wall tiles and drill-free LED channels.', 'sort_order' => 10],
            ['name' => 'Bathroom',       'slug' => 'bathroom',       'description' => 'Water-draining soap trays and architectural countertop vessels.', 'sort_order' => 11],
            ['name' => 'Toys & Figures', 'slug' => 'toys-figures',   'description' => 'Print-in-place articulated figures, fidgets, and kinetic models.', 'sort_order' => 12],
            ['name' => 'Storage',        'slug' => 'storage',        'description' => 'Print-in-place hinged boxes, photo vaults, and hardware trays.', 'sort_order' => 13],
            ['name' => 'Tools & Clips',  'slug' => 'tools-clips',    'description' => 'Workshop calipers, clamp blocks, and mechanical retention clips.', 'sort_order' => 14],
            ['name' => 'Gadgets',        'slug' => 'gadgets',        'description' => 'Cable strain relief wraps, adapters, and functional daily tools.', 'sort_order' => 15],
            ['name' => 'Keyboards',      'slug' => 'keyboards',      'description' => 'Ergonomic cases, custom keycaps, and mechanical numpad enclosures.', 'sort_order' => 16],
            ['name' => 'Kitchen',        'slug' => 'kitchen',        'description' => 'Precision volumetric scoops and functional culinary utensils.', 'sort_order' => 17],
            ['name' => 'Pegboards',      'slug' => 'pegboards',      'description' => 'Modular Skadis and pegboard tool holders and storage bins.', 'sort_order' => 18],
            ['name' => 'Trash Bins',     'slug' => 'trash-bins',     'description' => 'Minimalist desktop bins with swing and magnetic lid closures.', 'sort_order' => 19],
            ['name' => 'Phone Cases',    'slug' => 'phone-cases',    'description' => 'Bespoke textured smartphone bumpers and clamshell cases.', 'sort_order' => 20],
            ['name' => 'Wrist Rests',    'slug' => 'wrist-rests',    'description' => 'Hex-pattern and contoured wrist supports for mechanical typing.', 'sort_order' => 21],
            ['name' => 'Home Hardware',  'slug' => 'home-hardware',  'description' => 'Handles, hooks, stops, and functional architectural hardware.', 'sort_order' => 22],
            ['name' => 'Desk Setup',     'slug' => 'desk-setup',     'description' => 'Workspace ergonomics, riser attachments, and tactile accessories.', 'sort_order' => 23],
        ];

        foreach ($categories as $cat) {
            $cat['created_at'] = date('Y-m-d H:i:s');
            $cat['updated_at'] = date('Y-m-d H:i:s');
            $existing = $db->table('categories')->where('slug', $cat['slug'])->get()->getRow();
            if ($existing) {
                unset($cat['created_at']);
                $db->table('categories')->where('slug', $cat['slug'])->update($cat);
            } else {
                $db->table('categories')->insert($cat);
            }
        }
    }
}
