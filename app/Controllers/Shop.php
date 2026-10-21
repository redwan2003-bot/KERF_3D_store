<?php

namespace App\Controllers;

use App\Models\ProductModel;
use App\Models\ProductImageModel;

class Shop extends BaseController
{
    public function index(): string
    {
        $db = \Config\Database::connect();
        $productModel = new ProductModel();
        $imageModel   = new ProductImageModel();

        // Filter: Selected materials from GET query
        $selectedMaterials = $this->request->getGet('material') ?? [];
        $sort = $this->request->getGet('sort') ?? 'featured';

        $builder = $productModel->select('products.*, categories.name as category_name')
            ->join('categories', 'categories.id = products.category_id', 'left')
            ->where('products.status', 'active');

        // Sorting
        switch ($sort) {
            case 'price_asc':
                $builder->orderBy('products.price_bdt', 'ASC');
                break;
            case 'price_desc':
                $builder->orderBy('products.price_bdt', 'DESC');
                break;
            default:
                $builder->orderBy('products.sort_order', 'ASC');
                break;
        }

        $products = $builder->findAll();

        // Attach primary Google Drive CDN thumbnail for each product
        foreach ($products as &$prod) {
            $prod['primary_image'] = $imageModel->getPrimaryImage((int) $prod['id']);
        }

        // Available Materials & Shades for sidebar
        $materials = $db->table('materials')->where('is_active', 1)->get()->getResultArray();
        $shades    = $db->table('filament_shades')->where('is_active', 1)->orderBy('sort_order', 'ASC')->get()->getResultArray();

        $data = [
            'title'             => 'Shop & Archive — Kerf 3D Curated Artifacts',
            'pageCss'           => ['shop.css'],
            'products'          => $products,
            'materials'         => $materials,
            'shades'            => $shades,
            'selectedMaterials' => (array) $selectedMaterials,
            'currentSort'       => $sort,
        ];

        return view('pages/shop', $data);
    }
}
