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

        // 2. Featured Artifacts (Curated Bento Selection)
        $productModel = new ProductModel();
        $imageModel   = new ProductImageModel();

        // 3. Latest Intake Specimens for Interactive Ledger (Latest 8 MakerWorld Arrivals)
        $latestArrivals = $db->table('products p')
            ->select('p.id, p.sku, p.name, p.slug, p.layer_height_mm, p.infill_percent, p.makerworld_url, c.name as category_name, pi.filename as image_filename')
            ->join('categories c', 'c.id = p.category_id', 'left')
            ->join('product_images pi', 'pi.product_id = p.id AND pi.is_primary = 1', 'left')
            ->where('p.status', 'active')
            ->where('p.sku LIKE', 'K3D-MW-%')
            ->orderBy('p.id', 'DESC')
            ->limit(8)
            ->get()
            ->getResultArray();

        $data = [
            'title'            => 'Kerf 3D Studio — Precision Additive Manufacturing & Curated Artifacts',
            'pageCss'          => ['homepage.css'],
            'materials'        => $materials,
            'latestArrivals'   => $latestArrivals,
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
