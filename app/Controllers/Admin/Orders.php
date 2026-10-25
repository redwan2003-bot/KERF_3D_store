<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\OrderModel;
use App\Models\OrderItemModel;
use App\Models\CustomerModel;
use CodeIgniter\HTTP\ResponseInterface;

class Orders extends BaseController
{
    public function index(): string
    {
        $db = \Config\Database::connect();
        $statusFilter = $this->request->getGet('status');
        $payFilter    = $this->request->getGet('payment');

        $builder = $db->table('orders')
            ->select('orders.*, customers.name as customer_name, customers.phone as customer_phone, customers.is_dhaka')
            ->join('customers', 'customers.id = orders.customer_id', 'left')
            ->orderBy('orders.created_at', 'DESC');

        if (!empty($statusFilter)) {
            $builder->where('orders.order_status', $statusFilter);
        }
        if (!empty($payFilter)) {
            $builder->where('orders.payment_status', $payFilter);
        }

        $orders = $builder->get()->getResultArray();

        $data = [
            'title'        => 'Workshop Orders Intake & Fulfillment — Kerf 3D Studio',
            'orders'       => $orders,
            'statusFilter' => $statusFilter,
            'payFilter'    => $payFilter,
        ];

        return view('admin/orders_list', $data);
    }

    public function view($orderId): string
    {
        $db = \Config\Database::connect();
        $order = $db->table('orders')
            ->select('orders.*, customers.name as customer_name, customers.phone as customer_phone, customers.email as customer_email, customers.address_line, customers.is_dhaka, customers.notes as customer_notes')
            ->join('customers', 'customers.id = orders.customer_id', 'left')
            ->where('orders.id', $orderId)
            ->orWhere('orders.order_number', $orderId)
            ->get()->getRowArray();

        if (!$order) {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound("Order not found: {$orderId}");
        }

        $items = $db->table('order_items')
            ->select('order_items.*, products.makerworld_url as prod_mw_url, products.sku as prod_sku')
            ->join('products', 'products.id = order_items.product_id', 'left')
            ->where('order_items.order_id', $order['id'])
            ->get()->getResultArray();

        foreach ($items as &$it) {
            if (empty($it['makerworld_url_snapshot']) && !empty($it['prod_mw_url'])) {
                $it['makerworld_url_snapshot'] = $it['prod_mw_url'];
            }
        }

        $data = [
            'title' => "Order {$order['order_number']} — Workshop Fulfillment",
            'order' => $order,
            'items' => $items,
        ];

        return view('admin/order_detail', $data);
    }

    public function verifyPayment($orderId)
    {
        $status = $this->request->getPost('payment_status') ?: 'verified';
        $db = \Config\Database::connect();

        $order = $db->table('orders')
            ->where('id', $orderId)
            ->orWhere('order_number', $orderId)
            ->get()->getRowArray();
        if (!$order) {
            return redirect()->back()->with('error', 'Order not found.');
        }

        $db->table('orders')->where('id', $order['id'])->update([
            'payment_status' => $status,
            'updated_at'     => date('Y-m-d H:i:s'),
        ]);

        return redirect()->back()->with('success', "Payment status updated to " . strtoupper($status));
    }

    public function updateStatus($orderId)
    {
        $status          = $this->request->getPost('order_status');
        $courierProvider = trim((string) $this->request->getPost('courier_provider'));
        $courierTracking = trim((string) $this->request->getPost('courier_tracking'));
        $adminNotes      = trim((string) $this->request->getPost('admin_notes'));

        $db = \Config\Database::connect();
        $order = $db->table('orders')
            ->where('id', $orderId)
            ->orWhere('order_number', $orderId)
            ->get()->getRowArray();
        if (!$order) {
            return redirect()->back()->with('error', 'Order not found.');
        }

        $updateData = [
            'updated_at' => date('Y-m-d H:i:s'),
        ];
        if (!empty($status)) {
            $updateData['order_status'] = $status;
        }
        if ($courierProvider !== '') {
            $updateData['courier_provider'] = $courierProvider;
        }
        if ($courierTracking !== '') {
            $updateData['courier_tracking'] = $courierTracking;
        }
        if ($adminNotes !== '') {
            $updateData['admin_notes'] = $adminNotes;
        }

        $db->table('orders')->where('id', $order['id'])->update($updateData);

        return redirect()->back()->with('success', "Order status successfully updated to " . strtoupper($status ?? $order['order_status']));
    }
}
