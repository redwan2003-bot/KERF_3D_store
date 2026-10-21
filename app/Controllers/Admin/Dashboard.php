<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\OrderModel;
use App\Models\CustomUploadModel;
use App\Models\DriveSyncLogModel;
use App\Models\ProductModel;
use CodeIgniter\HTTP\ResponseInterface;

class Dashboard extends BaseController
{
    public function index(): string
    {
        $db = \Config\Database::connect();
        $orderModel = new OrderModel();
        $uploadModel = new CustomUploadModel();
        $syncLogModel = new DriveSyncLogModel();
        $productModel = new ProductModel();

        // 1. Order Status Counts
        $ordersCount = $orderModel->countAllResults();
        $printingOrders = $orderModel->where('order_status', 'printing')->countAllResults();
        $receivedOrders = $orderModel->where('order_status', 'received')->countAllResults();
        $deliveredOrders = $orderModel->where('order_status', 'delivered')->countAllResults();
        $pendingPayments = $orderModel->whereIn('payment_status', ['pending', 'on_hold'])->countAllResults();

        // 2. Financial Metrics
        $financialRow = $db->table('orders')
            ->selectSum('total_bdt', 'total_gross')
            ->selectSum('deposit_bdt', 'total_deposits')
            ->whereIn('payment_status', ['verified', 'on_hold'])
            ->get()->getRowArray();
        $totalGross = (float) ($financialRow['total_gross'] ?? 0.0);

        // 3. Products & Drive Sync Status
        $productsCount = $productModel->where('status', 'active')->countAllResults();
        $lastSync = $syncLogModel->orderBy('started_at', 'DESC')->first();

        // 4. Custom CAD Uploads
        $uploadsCount = $uploadModel->countAllResults();

        // 5. Recent Orders with Customer Info
        $recentOrders = $db->table('orders')
            ->select('orders.*, customers.name as customer_name, customers.phone as customer_phone')
            ->join('customers', 'customers.id = orders.customer_id', 'left')
            ->orderBy('orders.created_at', 'DESC')
            ->limit(6)
            ->get()->getResultArray();

        // 6. Recent CAD uploads
        $recentUploads = $uploadModel->orderBy('uploaded_at', 'DESC')->findAll(5);

        $data = [
            'title'           => 'Workshop Command Dashboard — Kerf 3D Studio',
            'ordersCount'     => $ordersCount,
            'printingOrders'  => $printingOrders,
            'receivedOrders'  => $receivedOrders,
            'deliveredOrders' => $deliveredOrders,
            'pendingPayments' => $pendingPayments,
            'totalGross'      => $totalGross,
            'productsCount'   => $productsCount,
            'uploadsCount'    => $uploadsCount,
            'lastSync'        => $lastSync,
            'recentOrders'    => $recentOrders,
            'recentUploads'   => $recentUploads,
        ];

        return view('admin/dashboard', $data);
    }

    /**
     * Real-time telemetry feed consumed by the 3D Neural Lattice / Brain
     */
    public function telemetry(): ResponseInterface
    {
        $db = \Config\Database::connect();
        $orderModel = new OrderModel();
        $uploadModel = new CustomUploadModel();
        $syncLogModel = new DriveSyncLogModel();

        $printingCount = $orderModel->where('order_status', 'printing')->countAllResults();
        $pendingCount  = $orderModel->where('order_status', 'received')->countAllResults();
        $uploadsCount  = $uploadModel->countAllResults();
        $lastSync      = $syncLogModel->orderBy('started_at', 'DESC')->first();

        return $this->response->setJSON([
            'status'         => 'online',
            'timestamp'      => time(),
            'printer'        => [
                'model'      => 'Bambu Lab A1 (FDM)',
                'build_vol'  => '256 x 256 x 256 mm',
                'active_jobs'=> $printingCount,
                'queued_jobs'=> $pendingCount,
                'nozzle_temp'=> $printingCount > 0 ? 220 : 28,
                'bed_temp'   => $printingCount > 0 ? 60 : 25,
            ],
            'drive_cdn'      => [
                'connected'   => true,
                'last_status' => $lastSync['status'] ?? 'ready',
                'last_synced' => $lastSync['completed_at'] ?? 'Never',
                'photos'      => (int) ($lastSync['images_added'] ?? 0),
            ],
            'cad_intake'     => [
                'total_files' => $uploadsCount,
            ],
            'activity_level' => min(1.0, 0.2 + ($printingCount * 0.3) + ($pendingCount * 0.15)),
        ]);
    }
}
