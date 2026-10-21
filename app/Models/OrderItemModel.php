<?php

namespace App\Models;

use CodeIgniter\Model;

class OrderItemModel extends Model
{
    protected $table            = 'order_items';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';

    protected $allowedFields = [
        'order_id',
        'item_type',
        'product_id',
        'variation_id',
        'upload_id',
        'product_name_snapshot',
        'specs_snapshot',
        'shade_snapshot',
        'material_snapshot',
        'unit_price_bdt',
        'setup_fee_bdt',
        'quantity',
        'line_total_bdt',
        'print_duration_minutes',
        'weight_grams',
        'created_at',
    ];

    protected $useTimestamps = false;
}
