<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use App\Models\CustomUploadModel;

class CadUploads extends BaseController
{
    public function index(): string
    {
        $db = \Config\Database::connect();
        $uploads = $db->table('custom_uploads')
            ->select('custom_uploads.*, materials.name as material_name, materials.rate_per_gram_bdt')
            ->join('materials', 'materials.id = custom_uploads.material_id', 'left')
            ->orderBy('custom_uploads.uploaded_at', 'DESC')
            ->get()->getResultArray();

        $data = [
            'title'   => 'Customer CAD Mesh Intake Archive — Kerf 3D Studio',
            'uploads' => $uploads,
        ];

        return view('admin/cad_uploads', $data);
    }

    /**
     * Download stored customer CAD file directly for Bambu Studio slicing
     */
    public function download($session, $filename)
    {
        $safeSession  = preg_replace('/[^a-zA-Z0-9_\-]/', '_', (string) $session);
        $safeFilename = basename((string) $filename);
        $filePath     = WRITEPATH . 'uploads/custom_cad/' . $safeSession . '/' . $safeFilename;

        if (!file_exists($filePath)) {
            throw \CodeIgniter\Exceptions\PageNotFoundException::forPageNotFound("CAD file not found: {$safeFilename}");
        }

        return $this->response->download($filePath, null)->setFileName($safeFilename);
    }
}
