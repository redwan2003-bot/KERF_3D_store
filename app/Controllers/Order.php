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
        $items    = $db->table('order_items')->where('order_id', $order['id'])->get()->getResultArray();

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
