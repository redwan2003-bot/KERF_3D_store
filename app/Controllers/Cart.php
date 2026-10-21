<?php

namespace App\Controllers;

use CodeIgniter\HTTP\ResponseInterface;

class Cart extends BaseController
{
    public function index(): ResponseInterface
    {
        return $this->getCartData();
    }

    /**
     * Add item (ready-made or custom print) to cart session.
     */
    public function add(): ResponseInterface
    {
        $productId   = (int) $this->request->getPost('product_id');
        $variationId = (int) $this->request->getPost('variation_id') ?: null;
        $quantity    = max(1, (int) $this->request->getPost('quantity') ?: 1);

        $cart = $this->session->get('k3d_cart') ?? [];

        $db = \Config\Database::connect();
        $product = $db->table('products')->where('id', $productId)->get()->getRowArray();

        if (!$product) {
            return $this->response->setStatusCode(404)->setJSON(['success' => false, 'error' => 'Product not found.']);
        }

        $price = (float) $product['price_bdt'];
        $specs = 'STANDARD SPECIMEN';

        if ($variationId) {
            $v = $db->table('product_variations')
                ->select('product_variations.*, materials.name as material_name, filament_shades.name as shade_name')
                ->join('materials', 'materials.id = product_variations.material_id')
                ->join('filament_shades', 'filament_shades.id = product_variations.shade_id', 'left')
                ->where('product_variations.id', $variationId)
                ->get()
                ->getRowArray();

            if ($v) {
                $price = (float) $v['price_bdt'];
                $specs = "{$v['material_name']} / {$v['shade_name']}";
            }
        }

        $cartKey = "prod_{$productId}_var_{$variationId}";

        if (isset($cart[$cartKey])) {
            $cart[$cartKey]['quantity'] += $quantity;
            $cart[$cartKey]['line_total'] = $cart[$cartKey]['quantity'] * $price;
        } else {
            $cart[$cartKey] = [
                'type'         => 'ready_made',
                'product_id'   => $productId,
                'variation_id' => $variationId,
                'name'         => $product['name'],
                'specs'        => $specs,
                'unit_price'   => $price,
                'quantity'     => $quantity,
                'line_total'   => $quantity * $price,
            ];
        }

        $this->session->set('k3d_cart', $cart);

        if ($this->request->isAJAX()) {
            return $this->getCartData();
        }

        return redirect()->to('/cart');
    }

    /**
     * Get JSON representation of cart for drawer and invoice calculations.
     */
    public function getCartData(): ResponseInterface
    {
        $cart = $this->session->get('k3d_cart') ?? [];
        $subtotal = 0;
        $totalItems = 0;

        foreach ($cart as $item) {
            $subtotal += $item['line_total'];
            $totalItems += $item['quantity'];
        }

        return $this->response->setJSON([
            'success'      => true,
            'items'        => array_values($cart),
            'total_items'  => $totalItems,
            'subtotal'     => round($subtotal, 2),
            'subtotal_fmt' => '৳' . number_format($subtotal, 2),
        ]);
    }
}
