<?php

namespace App\Controllers;

use App\Models\ProductModel;
use App\Models\ProductImageModel;

class Home extends BaseController
{
    public function index(): string
    {
        $db = \Config\Database::connect();

        // 1. Live Material Rates
        $materialsRaw = $db->table('materials')->where('is_active', 1)->get()->getResultArray();
        $materials = [];
        foreach ($materialsRaw as $mat) {
            $materials[$mat['slug']] = $mat;
        }

        // 2. Featured Artifacts (up to 4 products with Drive images)
        $productModel = new ProductModel();
        $imageModel   = new ProductImageModel();

        $featured = $productModel->where('status', 'active')
            ->orderBy('sort_order', 'ASC')
            ->findAll(4);

        foreach ($featured as &$item) {
            $item['images'] = $imageModel->where('product_id', $item['id'])
                ->where('is_active', 1)
                ->orderBy('is_primary', 'DESC')
                ->findAll(1);
        }

        $data = [
            'title'            => 'Kerf 3D Studio — Precision Additive Manufacturing & Curated Artifacts',
            'pageCss'          => ['homepage.css'],
            'materials'        => $materials,
            'featuredProducts' => $featured,
        ];

        return view('pages/home', $data);
    }

    public function privacy(): string
    {
        return view('pages/privacy', [
            'title'   => 'Privacy Policy — Kerf 3D Studio',
            'pageCss' => [],
        ]);
    }

    public function terms(): string
    {
        return view('pages/terms', [
            'title'   => 'Terms of Service — Kerf 3D Studio',
            'pageCss' => [],
        ]);
    }
}
