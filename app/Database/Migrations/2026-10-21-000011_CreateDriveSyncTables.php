<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateDriveSyncTables extends Migration
{
    public function up()
    {
        // 1. Drive Configuration Key-Value Store
        $this->forge->addField([
            'config_key' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
            ],
            'config_value' => [
                'type'       => 'VARCHAR',
                'constraint' => 500,
            ],
            'description' => [
                'type'       => 'VARCHAR',
                'constraint' => 255,
                'null'       => true,
            ],
            'updated_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('config_key', true);
        $this->forge->createTable('drive_config', true);

        // 2. Drive Sync Logs
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 10,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'sync_type' => [
                'type'       => 'ENUM',
                'constraint' => ['product_images', 'custom_uploads', 'full'],
            ],
            'status' => [
                'type'       => 'ENUM',
                'constraint' => ['started', 'completed', 'failed'],
                'default'    => 'started',
            ],
            'products_synced' => [
                'type'     => 'INT',
                'unsigned' => true,
                'default'  => 0,
            ],
            'images_added' => [
                'type'     => 'INT',
                'unsigned' => true,
                'default'  => 0,
            ],
            'images_updated' => [
                'type'     => 'INT',
                'unsigned' => true,
                'default'  => 0,
            ],
            'images_removed' => [
                'type'     => 'INT',
                'unsigned' => true,
                'default'  => 0,
            ],
            'errors' => [
                'type' => 'TEXT',
                'null' => true,
            ],
            'started_at' => [
                'type' => 'DATETIME',
            ],
            'completed_at' => [
                'type' => 'DATETIME',
                'null' => true,
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addKey('status');
        $this->forge->addKey('started_at');
        $this->forge->createTable('drive_sync_log', true);
    }

    public function down()
    {
        $this->forge->dropTable('drive_sync_log', true);
        $this->forge->dropTable('drive_config', true);
    }
}
