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
     * Add ready-made product artifact to cart session.
     */
    public function add()
    {
        $productId   = (int) $this->request->getPost('product_id');
        $variationId = (int) $this->request->getPost('variation_id') ?: null;
        $quantity    = max(1, (int) $this->request->getPost('quantity') ?: 1);

        $cart = $this->session->get('k3d_cart') ?? [];

        $db = \Config\Database::connect();
        $product = $db->table('products')->where('id', $productId)->get()->getRowArray();

        if (!$product) {
            if ($this->request->isAJAX()) {
                return $this->response->setStatusCode(404)->setJSON(['success' => false, 'error' => 'Product not found.']);
            }
            return redirect()->back()->with('error', 'Product not found.');
        }

        $price = (float) $product['price_bdt'];
        $specs = 'STANDARD SPECIMEN';
        $shade = 'Standard';
        $material = 'PLA';

        if ($variationId) {
            $v = $db->table('product_variations')
                ->select('product_variations.*, materials.name as material_name, filament_shades.name as shade_name')
                ->join('materials', 'materials.id = product_variations.material_id')
                ->join('filament_shades', 'filament_shades.id = product_variations.shade_id', 'left')
                ->where('product_variations.id', $variationId)
                ->get()
                ->getRowArray();

            if ($v) {
                $price    = (float) $v['price_bdt'];
                $material = $v['material_name'];
                $shade    = $v['shade_name'] ?? 'Standard';
                $specs    = "{$material} · {$shade}";
            }
        }

        // Fetch primary thumbnail
        $imageRow = $db->table('product_images')
            ->where('product_id', $productId)
            ->orderBy('sort_order', 'ASC')
            ->get()->getRowArray();
        $thumbnailUrl = (!empty($imageRow['filename']) && file_exists(FCPATH . 'assets/images/products/' . $imageRow['filename']))
            ? '/assets/images/products/' . $imageRow['filename']
            : ($imageRow['drive_thumbnail_url'] ?? $imageRow['drive_url'] ?? '');

        $cartKey = "prod_{$productId}_var_" . ($variationId ?? '0');

        if (isset($cart[$cartKey])) {
            $cart[$cartKey]['quantity'] += $quantity;
            $cart[$cartKey]['line_total'] = $cart[$cartKey]['quantity'] * $price;
        } else {
            $cart[$cartKey] = [
                'key'          => $cartKey,
                'type'         => 'ready_made',
                'product_id'   => $productId,
                'variation_id' => $variationId,
                'sku'          => $product['sku'],
                'name'         => $product['name'],
                'slug'         => $product['slug'],
                'specs'        => $specs,
                'material'     => $material,
                'shade'        => $shade,
                'unit_price'   => $price,
                'quantity'     => $quantity,
                'line_total'   => $quantity * $price,
                'thumbnail'    => $thumbnailUrl,
            ];
        }

        $this->session->set('k3d_cart', $cart);

        if ($this->request->isAJAX()) {
            return $this->getCartData();
        }

        return redirect()->back()->with('cart_added', $product['name']);
    }

    /**
     * Add custom CAD mesh print quote to cart session.
     */
    public function addCustom(): ResponseInterface
    {
        $uploadId       = (int) $this->request->getPost('upload_id');
        $materialSlug   = (string) $this->request->getPost('material') ?: 'pla';
        $infill         = (int) $this->request->getPost('infill') ?: 20;
        $support        = (string) $this->request->getPost('support') ?: 'none';
        $grams          = (float) $this->request->getPost('grams') ?: 140.0;
        $totalQuote     = (float) $this->request->getPost('total_quote') ?: 960.0;
        $advanceDeposit = (float) $this->request->getPost('advance_deposit') ?: 100.0;
        $filename       = trim((string) $this->request->getPost('filename')) ?: 'Custom_Mesh.stl';

        $supportLabel = match(strtolower($support)) {
            'tree'     => 'TREE SUPPORTS',
            'standard' => 'STD SUPPORTS',
            default    => 'NO SUPPORTS',
        };

        $cart = $this->session->get('k3d_cart') ?? [];
        $cartKey = "custom_upl_" . ($uploadId ?: uniqid());

        $cart[$cartKey] = [
            'key'             => $cartKey,
            'type'            => 'custom_print',
            'upload_id'       => $uploadId ?: null,
            'sku'             => 'CAD-CUSTOM',
            'name'            => 'Custom Print: ' . $filename,
            'slug'            => 'quote',
            'specs'           => strtoupper($materialSlug) . " · {$infill}% GYROID · {$supportLabel} · {$grams}G",
            'material'        => strtoupper($materialSlug),
            'shade'           => 'Custom Specification',
            'unit_price'      => $totalQuote,
            'advance_deposit' => $advanceDeposit,
            'quantity'        => 1,
            'line_total'      => $totalQuote,
            'thumbnail'       => '',
        ];

        $this->session->set('k3d_cart', $cart);

        return $this->getCartData();
    }

    /**
     * Update quantity of an item in cart.
     */
    public function update(): ResponseInterface
    {
        $cartKey  = (string) $this->request->getPost('key');
        $quantity = (int) $this->request->getPost('quantity');

        $cart = $this->session->get('k3d_cart') ?? [];

        if (isset($cart[$cartKey])) {
            if ($quantity <= 0) {
                unset($cart[$cartKey]);
            } else {
                $cart[$cartKey]['quantity']   = $quantity;
                $cart[$cartKey]['line_total'] = $quantity * $cart[$cartKey]['unit_price'];
            }
            $this->session->set('k3d_cart', $cart);
        }

        return $this->getCartData();
    }

    /**
     * Remove item completely from cart.
     */
    public function remove(): ResponseInterface
    {
        $cartKey = (string) $this->request->getPost('key');
        $cart    = $this->session->get('k3d_cart') ?? [];

        if (isset($cart[$cartKey])) {
            unset($cart[$cartKey]);
            $this->session->set('k3d_cart', $cart);
        }

        return $this->getCartData();
    }

    /**
     * Clear all items from cart.
     */
    public function clear(): ResponseInterface
    {
        $this->session->remove('k3d_cart');
        return $this->getCartData();
    }

    /**
     * Get JSON representation of cart for receipt drawer and checkout.
     */
    public function getCartData(): ResponseInterface
    {
        $cart = $this->session->get('k3d_cart') ?? [];
        $subtotal = 0;
        $totalItems = 0;
        $depositTotal = 0;

        foreach ($cart as $item) {
            $subtotal += $item['line_total'];
            $totalItems += $item['quantity'];
            if (!empty($item['advance_deposit'])) {
                $depositTotal += $item['advance_deposit'] * $item['quantity'];
            }
        }

        $shippingInside  = 70.00;
        $shippingOutside = 130.00;

        return $this->response->setJSON([
            'success'              => true,
            'items'                => array_values($cart),
            'total_items'          => $totalItems,
            'subtotal'             => round($subtotal, 2),
            'subtotal_fmt'         => '৳' . number_format($subtotal, 2),
            'deposit_total'        => round($depositTotal, 2),
            'deposit_total_fmt'    => '৳' . number_format($depositTotal, 2),
            'shipping_inside'      => $shippingInside,
            'shipping_outside'     => $shippingOutside,
            'shipping_inside_fmt'  => '৳' . number_format($shippingInside, 2),
            'shipping_outside_fmt' => '৳' . number_format($shippingOutside, 2),
            'total_inside'         => round($subtotal + $shippingInside, 2),
            'total_inside_fmt'     => '৳' . number_format($subtotal + $shippingInside, 2),
            'total_outside'        => round($subtotal + $shippingOutside, 2),
            'total_outside_fmt'    => '৳' . number_format($subtotal + $shippingOutside, 2),
        ]);
    }
}
