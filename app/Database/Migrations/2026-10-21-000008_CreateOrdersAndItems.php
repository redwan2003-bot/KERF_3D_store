<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateOrdersAndItems extends Migration
{
    public function up()
    {
        // 1. Orders
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 10,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'order_number' => [
                'type'       => 'VARCHAR',
                'constraint' => 30,
            ],
            'customer_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
            ],
            'shipping_zone' => [
                'type'       => 'ENUM',
                'constraint' => ['inside_dhaka', 'outside_dhaka'],
            ],
            'shipping_cost_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 70.00,
            ],
            'subtotal_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 0.00,
            ],
            'setup_fee_total_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 0.00,
            ],
            'total_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 0.00,
            ],
            'deposit_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 0.00,
            ],
            'balance_due_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 0.00,
            ],
            'payment_method' => [
                'type'       => 'ENUM',
                'constraint' => ['bkash', 'nagad', 'rocket', 'cod'],
            ],
            'trx_id' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
                'null'       => true,
            ],
            'payment_status' => [
                'type'       => 'ENUM',
                'constraint' => ['pending', 'on_hold', 'verified', 'failed', 'refunded'],
                'default'    => 'pending',
            ],
            'order_status' => [
                'type'       => 'ENUM',
                'constraint' => ['received', 'slicing', 'printing', 'dispatched', 'delivered', 'cancelled'],
                'default'    => 'received',
            ],
            'courier_provider' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
                'null'       => true,
            ],
            'courier_tracking' => [
                'type'       => 'VARCHAR',
                'constraint' => 120,
                'null'       => true,
            ],
            'admin_notes' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'created_at' => [
                'type' => 'DATETIME',
            ],
            'updated_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addUniqueKey('order_number');
        $this->forge->addKey('customer_id');
        $this->forge->addKey('order_status');
        $this->forge->addKey('payment_status');
        $this->forge->addKey('trx_id');
        $this->forge->addForeignKey('customer_id', 'customers', 'id', 'RESTRICT', 'CASCADE');
        $this->forge->createTable('orders', true);

        // 2. Order Items
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 10,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'order_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
            ],
            'item_type' => [
                'type'       => 'ENUM',
                'constraint' => ['ready_made', 'custom_print'],
                'default'    => 'ready_made',
            ],
            'product_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'null'       => true,
            ],
            'variation_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'null'       => true,
            ],
            'upload_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'null'       => true,
            ],
            'product_name_snapshot' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
            ],
            'specs_snapshot' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
                'null'       => true,
            ],
            'quantity' => [
                'type'       => 'SMALLINT',
                'unsigned'   => true,
                'default'    => 1,
            ],
            'unit_price_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
            ],
            'line_total_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
            ],
            'created_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addKey('order_id');
        $this->forge->addKey('product_id');
        $this->forge->addForeignKey('order_id', 'orders', 'id', 'CASCADE', 'CASCADE');
        $this->forge->addForeignKey('product_id', 'products', 'id', 'SET NULL', 'CASCADE');
        $this->forge->addForeignKey('variation_id', 'product_variations', 'id', 'SET NULL', 'CASCADE');
        $this->forge->addForeignKey('upload_id', 'custom_uploads', 'id', 'SET NULL', 'CASCADE');
        $this->forge->createTable('order_items', true);
    }

    public function down()
    {
        $this->forge->dropTable('order_items', true);
        $this->forge->dropTable('orders', true);
    }
}
