<?php

namespace App\Controllers;

use CodeIgniter\Exceptions\PageNotFoundException;

class Order extends BaseController
{
    public function confirmed(string $orderNumber): string
    {
        $db = \Config\Database::connect();

        $order = $db->table('orders')->where('order_number', $orderNumber)->get()->getRowArray();
        if (!$order) {
            throw PageNotFoundException::forPageNotFound("Workshop Ticket #{$orderNumber} not found.");
        }

        $customer = $db->table('customers')->where('id', $order['customer_id'])->get()->getRowArray();
        $items    = $db->table('order_items')
            ->select('order_items.*, products.makerworld_url as prod_mw_url, products.slug as prod_slug, products.sku as prod_sku')
            ->join('products', 'products.id = order_items.product_id', 'left')
            ->where('order_items.order_id', $order['id'])
            ->get()->getResultArray();

        foreach ($items as &$it) {
            if (empty($it['makerworld_url_snapshot']) && !empty($it['prod_mw_url'])) {
                $it['makerworld_url_snapshot'] = $it['prod_mw_url'];
            }
        }

        $data = [
            'title'      => "Workshop Ticket #{$orderNumber} — Kerf 3D Studio",
            'pageCss'    => ['order-confirmation.css'],
            'order'      => $order,
            'customer'   => $customer,
            'orderItems' => $items,
        ];

        return view('pages/order_confirmation', $data);
    }
}
