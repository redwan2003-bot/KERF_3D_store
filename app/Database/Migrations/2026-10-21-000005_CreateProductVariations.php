<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateProductVariations extends Migration
{
    public function up()
    {
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 10,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'product_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
            ],
            'material_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
            ],
            'shade_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'null'       => true,
            ],
            'sku_suffix' => [
                'type'       => 'VARCHAR',
                'constraint' => 20,
                'null'       => true,
            ],
            'price_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
            ],
            'sale_price_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'null'       => true,
            ],
            'weight_g' => [
                'type'       => 'DECIMAL',
                'constraint' => '8,2',
                'null'       => true,
            ],
            'inventory_number' => [
                'type'       => 'VARCHAR',
                'constraint' => 40,
                'null'       => true,
            ],
            'stock_qty' => [
                'type'       => 'INT',
                'default'    => 0,
            ],
            'stock_status' => [
                'type'       => 'ENUM',
                'constraint' => ['in_stock', 'out_of_stock', 'preorder'],
                'default'    => 'in_stock',
            ],
            'drive_file_id' => [
                'type'       => 'VARCHAR',
                'constraint' => 120,
                'null'       => true,
            ],
            'drive_url' => [
                'type'       => 'VARCHAR',
                'constraint' => 500,
                'null'       => true,
            ],
            'is_active' => [
                'type'       => 'TINYINT',
                'constraint' => 1,
                'default'    => 1,
            ],
            'sort_order' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'default'    => 0,
            ],
            'created_at' => [
                'type' => 'DATETIME',
            ],
            'updated_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addUniqueKey(['product_id', 'material_id', 'shade_id']);
        $this->forge->addKey('material_id');
        $this->forge->addKey('shade_id');
        $this->forge->addKey('stock_status');
        $this->forge->addForeignKey('product_id', 'products', 'id', 'CASCADE', 'CASCADE');
        $this->forge->addForeignKey('material_id', 'materials', 'id', 'RESTRICT', 'CASCADE');
        $this->forge->addForeignKey('shade_id', 'filament_shades', 'id', 'SET NULL', 'CASCADE');
        $this->forge->createTable('product_variations', true);
    }

    public function down()
    {
        $this->forge->dropTable('product_variations', true);
    }
}
