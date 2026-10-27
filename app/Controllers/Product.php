<?php

namespace App\Controllers;

use App\Models\ProductModel;
use CodeIgniter\Exceptions\PageNotFoundException;

class Product extends BaseController
{
    public function view(string $slug): string
    {
        $productModel = new ProductModel();
        $product = $productModel->getWithImages($slug);

        if (!$product) {
            throw PageNotFoundException::forPageNotFound("Product '{$slug}' not found.");
        }

        $db = \Config\Database::connect();

        // Fetch variations with material and shade details
        $variations = $db->table('product_variations')
            ->select('product_variations.*, materials.name as material_name, filament_shades.name as shade_name, filament_shades.hex_color')
            ->join('materials', 'materials.id = product_variations.material_id')
            ->join('filament_shades', 'filament_shades.id = product_variations.shade_id', 'left')
            ->where('product_variations.product_id', $product['id'])
            ->where('product_variations.is_active', 1)
            ->orderBy('product_variations.sort_order', 'ASC')
            ->get()
            ->getResultArray();

        $primaryImg = !empty($product['primary_image']['filename'])
            ? base_url('assets/images/products/' . $product['primary_image']['filename'])
            : (!empty($product['images'][0]['filename']) ? base_url('assets/images/products/' . $product['images'][0]['filename']) : base_url('assets/images/favicon.svg'));

        $shortDesc = !empty($product['short_description'])
            ? strip_tags($product['short_description'])
            : (!empty($product['description']) ? mb_substr(strip_tags($product['description']), 0, 160) . '...' : 'Precision FDM 3D printed artifact calibrated in Dhaka on Bambu Lab A1 hardware.');

        $data = [
            'title'            => esc($product['name']) . ' — Kerf 3D Specimen Sheet',
            'meta_description' => $shortDesc,
            'canonical_url'    => site_url('product/' . $product['slug']),
            'og_type'          => 'product',
            'og_title'         => $product['name'] . ' — KERF 3D Studio',
            'og_description'   => $shortDesc,
            'og_image'         => $primaryImg,
            'pageCss'          => ['product.css'],
            'product'          => $product,
            'variations'       => $variations,
        ];

        return view('pages/product', $data);
    }
}
