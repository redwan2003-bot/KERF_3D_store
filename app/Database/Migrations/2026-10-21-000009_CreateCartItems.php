<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateCartItems extends Migration
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
            'session_id' => [
                'type'       => 'VARCHAR',
                'constraint' => 128,
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
            'quantity' => [
                'type'     => 'SMALLINT',
                'unsigned' => true,
                'default'  => 1,
            ],
            'created_at' => [
                'type' => 'DATETIME',
            ],
            'updated_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addKey('session_id');
        $this->forge->addForeignKey('product_id', 'products', 'id', 'CASCADE', 'CASCADE');
        $this->forge->addForeignKey('variation_id', 'product_variations', 'id', 'CASCADE', 'CASCADE');
        $this->forge->addForeignKey('upload_id', 'custom_uploads', 'id', 'CASCADE', 'CASCADE');
        $this->forge->createTable('cart_items', true);
    }

    public function down()
    {
        $this->forge->dropTable('cart_items', true);
    }
}
