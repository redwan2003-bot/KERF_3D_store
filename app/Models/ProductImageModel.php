<?php

namespace App\Models;

use CodeIgniter\Model;

class ProductImageModel extends Model
{
    protected $table            = 'product_images';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;

    protected $allowedFields = [
        'product_id',
        'drive_file_id',
        'drive_url',
        'drive_thumbnail_url',
        'drive_download_url',
        'filename',
        'alt_text',
        'mime_type',
        'file_size_bytes',
        'width_px',
        'height_px',
        'is_primary',
        'sort_order',
        'is_active',
        'synced_at',
    ];

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';

    /**
     * Get primary thumbnail for a product.
     */
    public function getPrimaryImage(int $productId): ?array
    {
        return $this->where('product_id', $productId)
            ->where('is_active', 1)
            ->orderBy('is_primary', 'DESC')
            ->orderBy('sort_order', 'ASC')
            ->first();
    }
}
