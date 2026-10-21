<?php

namespace App\Models;

use CodeIgniter\Model;

class OrderModel extends Model
{
    protected $table            = 'orders';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';

    protected $allowedFields = [
        'order_number',
        'customer_id',
        'shipping_zone',
        'shipping_cost_bdt',
        'subtotal_bdt',
        'setup_fee_total_bdt',
        'total_bdt',
        'deposit_bdt',
        'balance_due_bdt',
        'payment_method',
        'trx_id',
        'payment_status',
        'order_status',
        'courier_provider',
        'courier_tracking',
        'admin_notes',
        'created_at',
        'updated_at',
    ];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';

    /**
     * Get order with customer details
     */
    public function getOrderWithCustomer(int $orderId): ?array
    {
        return $this->select('orders.*, customers.name as customer_name, customers.phone as customer_phone, customers.email as customer_email, customers.address_line, customers.is_dhaka')
            ->join('customers', 'customers.id = orders.customer_id', 'left')
            ->where('orders.id', $orderId)
            ->first();
    }
}
