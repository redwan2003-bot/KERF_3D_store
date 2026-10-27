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

        // Filter: Selected materials, category, and search query from GET query
        $searchQuery       = trim((string) ($this->request->getGet('q') ?? $this->request->getGet('search') ?? ''));
        $selectedMaterials = $this->request->getGet('material') ?? [];
        $selectedCategory  = (string) $this->request->getGet('category');
        $sort              = $this->request->getGet('sort') ?? 'featured';

        $builder = $productModel->select('products.*, categories.name as category_name, categories.slug as category_slug')
            ->join('categories', 'categories.id = products.category_id', 'left')
            ->where('products.status', 'active');

        if (!empty($searchQuery)) {
            $builder->groupStart()
                ->like('products.name', $searchQuery)
                ->orLike('products.sku', $searchQuery)
                ->orLike('products.tags', $searchQuery)
                ->orLike('products.description', $searchQuery)
            ->groupEnd();
        }

        if (!empty($selectedCategory)) {
            $builder->where('categories.slug', $selectedCategory);
        }

        if (!empty($selectedMaterials)) {
            $builder->groupStart();
            foreach ((array) $selectedMaterials as $mIdx => $matSlug) {
                if ($mIdx === 0) {
                    $builder->like('products.tags', $matSlug);
                } else {
                    $builder->orLike('products.tags', $matSlug);
                }
            }
            $builder->groupEnd();
        }

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

        // Pagination: 36 specimens per page
        $totalProducts = (clone $builder)->countAllResults(false);
        $perPage       = 36;
        $currentPage   = max(1, (int) $this->request->getGet('page'));
        $totalPages    = max(1, (int) ceil($totalProducts / $perPage));
        if ($currentPage > $totalPages) {
            $currentPage = $totalPages;
        }

        $products = $builder->findAll($perPage, ($currentPage - 1) * $perPage);

        // Attach primary Google Drive CDN thumbnail for each product
        foreach ($products as &$prod) {
            $prod['primary_image'] = $imageModel->getPrimaryImage((int) $prod['id']);
        }

        // Available Categories with active products for filter pills
        $categories = $db->table('categories')
            ->select('categories.id, categories.name, categories.slug, count(products.id) as product_count')
            ->join('products', 'products.category_id = categories.id AND products.status = "active"', 'inner')
            ->groupBy('categories.id')
            ->orderBy('categories.name', 'ASC')
            ->get()->getResultArray();
        $materials  = $db->table('materials')->where('is_active', 1)->get()->getResultArray();
        $shades     = $db->table('filament_shades')->where('is_active', 1)->orderBy('sort_order', 'ASC')->get()->getResultArray();

        $data = [
            'title'             => 'Shop & Archive — Kerf 3D Curated Artifacts',
            'pageCss'           => ['shop.css'],
            'products'          => $products,
            'categories'        => $categories,
            'selectedCategory'  => $selectedCategory,
            'materials'         => $materials,
            'shades'            => $shades,
            'selectedMaterials' => (array) $selectedMaterials,
            'currentSort'       => $sort,
            'searchQuery'       => $searchQuery,
            'totalProducts'     => $totalProducts,
            'currentPage'       => $currentPage,
            'totalPages'        => $totalPages,
            'perPage'           => $perPage,
        ];

        return view('pages/shop', $data);
    }
}
