<?php

namespace App\Models;

use CodeIgniter\Model;

class ProductModel extends Model
{
    protected $table            = 'products';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;

    protected $allowedFields = [
        'sku',
        'name',
        'slug',
        'short_description',
        'description',
        'category_id',
        'catalog_type',
        'status',
        'tags',
        'weight_g',
        'dimensions_mm',
        'layer_height_mm',
        'infill_percent',
        'print_time_minutes',
        'build_volume_fit',
        'makerworld_url',
        'creator',
        'license',
        'attribution_text',
        'drive_folder_id',
        'drive_folder_url',
        'sort_order',
    ];

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';

    /**
     * Retrieve a product with its linked Google Drive images.
     */
    public function getWithImages(string $slugOrId): ?array
    {
        $builder = $this->where('slug', $slugOrId)->orWhere('id', $slugOrId);
        $product = $builder->first();

        if (!$product) {
            return null;
        }

        $imageModel = new ProductImageModel();
        $product['images'] = $imageModel->where('product_id', $product['id'])
            ->where('is_active', 1)
            ->orderBy('is_primary', 'DESC')
            ->orderBy('sort_order', 'ASC')
            ->findAll();

        return $product;
    }
}
