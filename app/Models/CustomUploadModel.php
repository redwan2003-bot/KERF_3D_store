<?php

namespace App\Models;

use CodeIgniter\Model;

class CustomUploadModel extends Model
{
    protected $table            = 'custom_uploads';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';

    protected $allowedFields = [
        'session_id',
        'customer_id',
        'original_filename',
        'file_extension',
        'mime_type',
        'file_size_bytes',
        'file_hash',
        'drive_file_id',
        'drive_url',
        'drive_folder_id',
        'mesh_volume_cm3',
        'estimated_grams',
        'material_id',
        'infill_percent',
        'fits_build_volume',
        'print_subtotal_bdt',
        'setup_fee_bdt',
        'quote_total_bdt',
        'quote_status',
        'uploaded_at',
        'updated_at',
    ];

    protected $useTimestamps = true;
    protected $createdField  = 'uploaded_at';
    protected $updatedField  = 'updated_at';
}
