<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateCustomUploads extends Migration
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
                'null'       => true,
            ],
            'customer_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'null'       => true,
            ],
            'original_filename' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
            ],
            'file_extension' => [
                'type'       => 'VARCHAR',
                'constraint' => 10,
            ],
            'mime_type' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
                'null'       => true,
            ],
            'file_size_bytes' => [
                'type'     => 'INT',
                'unsigned' => true,
            ],
            'file_hash' => [
                'type'       => 'CHAR',
                'constraint' => 64,
                'null'       => true,
            ],
            'drive_file_id' => [
                'type'       => 'VARCHAR',
                'constraint' => 120,
            ],
            'drive_url' => [
                'type'       => 'VARCHAR',
                'constraint' => 500,
            ],
            'drive_folder_id' => [
                'type'       => 'VARCHAR',
                'constraint' => 120,
                'null'       => true,
            ],
            'mesh_volume_cm3' => [
                'type'       => 'DECIMAL',
                'constraint' => '12,4',
                'null'       => true,
            ],
            'estimated_grams' => [
                'type'       => 'DECIMAL',
                'constraint' => '8,2',
                'null'       => true,
            ],
            'material_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
                'null'       => true,
            ],
            'infill_percent' => [
                'type'     => 'TINYINT',
                'unsigned' => true,
                'null'     => true,
            ],
            'fits_build_volume' => [
                'type'       => 'TINYINT',
                'constraint' => 1,
                'default'    => 1,
            ],
            'print_subtotal_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'null'       => true,
            ],
            'setup_fee_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'default'    => 50.00,
            ],
            'quote_total_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '10,2',
                'null'       => true,
            ],
            'quote_status' => [
                'type'       => 'ENUM',
                'constraint' => ['pending', 'quoted', 'accepted', 'rejected', 'expired'],
                'default'    => 'pending',
            ],
            'uploaded_at' => [
                'type' => 'DATETIME',
            ],
            'updated_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addKey('session_id');
        $this->forge->addKey('customer_id');
        $this->forge->addKey('drive_file_id');
        $this->forge->addForeignKey('customer_id', 'customers', 'id', 'SET NULL', 'CASCADE');
        $this->forge->addForeignKey('material_id', 'materials', 'id', 'SET NULL', 'CASCADE');
        $this->forge->createTable('custom_uploads', true);
    }

    public function down()
    {
        $this->forge->dropTable('custom_uploads', true);
    }
}
