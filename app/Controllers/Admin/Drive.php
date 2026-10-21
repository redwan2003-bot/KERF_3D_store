<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\DriveSyncLogModel;
use App\Models\ProductImageModel;
use App\Models\ProductModel;
use App\Services\DriveSyncService;

class Drive extends BaseController
{
    public function index(): string
    {
        $productModel  = new ProductModel();
        $imageModel    = new ProductImageModel();
        $syncLogModel  = new DriveSyncLogModel();

        $products  = $productModel->orderBy('name', 'ASC')->findAll();
        $recentLogs = $syncLogModel->orderBy('started_at', 'DESC')->findAll(10);
        $totalImages = $imageModel->countAllResults();

        $data = [
            'title'       => 'Google Drive Media CDN Synchronization — Kerf 3D Studio',
            'products'    => $products,
            'recentLogs'  => $recentLogs,
            'totalImages' => $totalImages,
        ];

        return view('admin/drive_sync', $data);
    }

    public function runSync()
    {
        try {
            $service = new DriveSyncService();
            $stats = $service->sync();

            $msg = sprintf(
                'Drive Sync completed successfully! Synced %d products. Added: %d, Updated: %d, Removed: %d.',
                $stats['products_synced'],
                $stats['images_added'],
                $stats['images_updated'],
                $stats['images_removed']
            );

            return redirect()->back()->with('success', $msg);
        } catch (\Throwable $e) {
            return redirect()->back()->with('error', 'Google Drive sync failed: ' . $e->getMessage());
        }
    }
}
