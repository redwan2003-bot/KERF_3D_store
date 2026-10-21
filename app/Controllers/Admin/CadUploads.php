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
}
