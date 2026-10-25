<?php

namespace App\Controllers;

use App\Models\CustomUploadModel;
use App\Services\DriveSyncService;
use CodeIgniter\HTTP\ResponseInterface;

class Quote extends BaseController
{
    public function index(): string
    {
        $db = \Config\Database::connect();
        $materials = $db->table('materials')->where('is_active', 1)->get()->getResultArray();

        $data = [
            'title'     => 'Custom 3D Mesh Quote & Manufacturing — Kerf 3D Studio',
            'pageCss'   => ['quote.css'],
            'materials' => $materials,
        ];

        return view('pages/quote', $data);
    }

    /**
     * AJAX endpoint to compute instant quote breakdown.
     */
    public function calculate(): ResponseInterface
    {
        $grams      = (float) $this->request->getPost('grams') ?: 140.0;
        $matSlug    = (string) $this->request->getPost('material') ?: 'pla';
        $infill     = (int) $this->request->getPost('infill') ?: 20;
        $supportPct = (int) $this->request->getPost('support_pct') ?: 0;

        $db = \Config\Database::connect();
        $mat = $db->table('materials')->where('slug', $matSlug)->get()->getRowArray();
        $rate = $mat ? (float) $mat['rate_per_gram_bdt'] : 6.50;

        $setupFee       = 0.00;
        $printSubtotal  = $grams * $rate;
        $totalQuote     = $printSubtotal;
        $advanceDeposit = 100.00;
        $balanceDue     = max(0.00, $totalQuote - $advanceDeposit);

        return $this->response->setJSON([
            'success'          => true,
            'grams'            => $grams,
            'rate'             => $rate,
            'print_subtotal'   => round($printSubtotal, 2),
            'setup_fee'        => 0.00,
            'total_quote'      => round($totalQuote, 2),
            'advance_deposit'  => $advanceDeposit,
            'balance_due'      => round($balanceDue, 2),
        ]);
    }

    /**
     * File upload intake endpoint (uploads to Google Drive /Customer_Uploads/).
     */
    public function upload(): ResponseInterface
    {
        $file = $this->request->getFile('mesh_file');

        if (!$file || !$file->isValid()) {
            return $this->response->setStatusCode(400)->setJSON([
                'success' => false,
                'error'   => 'No valid CAD file received.',
            ]);
        }

        $allowedExts = ['stl', 'obj', '3mf'];
        $ext = strtolower($file->getClientExtension());

        if (!in_array($ext, $allowedExts, true)) {
            return $this->response->setStatusCode(400)->setJSON([
                'success' => false,
                'error'   => 'Unsupported file format. Please upload .STL, .OBJ, or .3MF.',
            ]);
        }

        // Limit: 128 MB
        if ($file->getSizeByUnit('mb') > 128) {
            return $this->response->setStatusCode(400)->setJSON([
                'success' => false,
                'error'   => 'File exceeds the maximum upload limit of 128 MB.',
            ]);
        }

        $sessionId = $this->session->session_id;

        // 1. Ensure local storage exists and save locally first
        $localDir = WRITEPATH . 'uploads/custom_cad/' . $sessionId . '/';
        if (!is_dir($localDir)) {
            mkdir($localDir, 0775, true);
        }
        $safeName = preg_replace('/[^a-zA-Z0-9_\.-]/', '_', $file->getClientName());
        $localFilePath = $localDir . $safeName;
        copy($file->getTempName(), $localFilePath);

        $driveFileId   = 'local_' . substr(md5(uniqid($sessionId, true)), 0, 16);
        $driveUrl      = '/uploads/custom_cad/' . $sessionId . '/' . $safeName;
        $driveFolderId = '';

        // 2. Attempt Google Drive sync with graceful fallback
        try {
            $driveService = new DriveSyncService();
            $result = $driveService->uploadCustomerCAD($localFilePath, $file->getClientName(), $sessionId);
            if (!empty($result['drive_file_id'])) {
                $driveFileId   = $result['drive_file_id'];
                $driveUrl      = $result['drive_url'] ?? $driveUrl;
                $driveFolderId = $result['drive_folder_id'] ?? '';
            }
        } catch (\Throwable $e) {
            log_message('notice', 'Google Drive sync skipped/failed for CAD upload: ' . $e->getMessage());
        }

        try {
            // Record into custom_uploads table
            $db = \Config\Database::connect();
            $db->table('custom_uploads')->insert([
                'session_id'        => $sessionId,
                'original_filename' => $file->getClientName(),
                'file_extension'    => $ext,
                'mime_type'         => $file->getClientMimeType(),
                'file_size_bytes'   => $file->getSize(),
                'drive_file_id'     => $driveFileId,
                'drive_url'         => $driveUrl,
                'drive_folder_id'   => $driveFolderId,
                'fits_build_volume' => 1,
                'setup_fee_bdt'     => 0.00,
                'quote_status'      => 'quoted',
                'uploaded_at'       => date('Y-m-d H:i:s'),
                'updated_at'        => date('Y-m-d H:i:s'),
            ]);

            $uploadId = $db->insertID();

            return $this->response->setJSON([
                'success'       => true,
                'upload_id'     => $uploadId,
                'filename'      => $file->getClientName(),
                'file_size_mb'  => round($file->getSizeByUnit('mb'), 2),
                'drive_file_id' => $driveFileId,
            ]);

        } catch (\Throwable $e) {
            return $this->response->setStatusCode(500)->setJSON([
                'success' => false,
                'error'   => 'CAD intake storage error: ' . $e->getMessage(),
            ]);
        }
    }
}
