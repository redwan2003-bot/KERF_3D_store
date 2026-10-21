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
        $grams    = (float) $this->request->getPost('grams') ?: 140.0;
        $matSlug  = (string) $this->request->getPost('material') ?: 'pla';
        $infill   = (int) $this->request->getPost('infill') ?: 20;

        $db = \Config\Database::connect();
        $mat = $db->table('materials')->where('slug', $matSlug)->get()->getRowArray();
        $rate = $mat ? (float) $mat['rate_per_gram_bdt'] : 6.50;

        $setupFee       = 50.00;
        $printSubtotal  = $grams * $rate;
        $totalQuote     = $printSubtotal + $setupFee;
        $advanceDeposit = 100.00;
        $balanceDue     = $totalQuote - $advanceDeposit;

        return $this->response->setJSON([
            'success'          => true,
            'grams'            => $grams,
            'rate'             => $rate,
            'print_subtotal'   => round($printSubtotal, 2),
            'setup_fee'        => $setupFee,
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

        try {
            $driveService = new DriveSyncService();
            $result = $driveService->uploadCustomerCAD($file->getTempName(), $file->getClientName(), $sessionId);

            // Record into custom_uploads table
            $db = \Config\Database::connect();
            $db->table('custom_uploads')->insert([
                'session_id'        => $sessionId,
                'original_filename' => $file->getClientName(),
                'file_extension'    => $ext,
                'mime_type'         => $file->getClientMimeType(),
                'file_size_bytes'   => $file->getSize(),
                'drive_file_id'     => $result['drive_file_id'],
                'drive_url'         => $result['drive_url'],
                'drive_folder_id'   => $result['drive_folder_id'],
                'fits_build_volume' => 1,
                'setup_fee_bdt'     => 50.00,
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
                'drive_file_id' => $result['drive_file_id'],
            ]);

        } catch (\Throwable $e) {
            return $this->response->setStatusCode(500)->setJSON([
                'success' => false,
                'error'   => 'Google Drive upload error: ' . $e->getMessage(),
            ]);
        }
    }
}
