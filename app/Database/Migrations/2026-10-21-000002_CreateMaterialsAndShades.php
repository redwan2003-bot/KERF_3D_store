<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class CreateMaterialsAndShades extends Migration
{
    public function up()
    {
        // 1. Materials
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 10,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'name' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
            ],
            'slug' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
            ],
            'rate_per_gram_bdt' => [
                'type'       => 'DECIMAL',
                'constraint' => '8,2',
            ],
            'effective_density' => [
                'type'       => 'DECIMAL',
                'constraint' => '5,3',
            ],
            'customer_label' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
            ],
            'max_hotend_temp_c' => [
                'type'       => 'SMALLINT',
                'unsigned'   => true,
                'null'       => true,
            ],
            'max_bed_temp_c' => [
                'type'       => 'SMALLINT',
                'unsigned'   => true,
                'null'       => true,
            ],
            'is_recommended' => [
                'type'       => 'TINYINT',
                'constraint' => 1,
                'default'    => 1,
            ],
            'is_active' => [
                'type'       => 'TINYINT',
                'constraint' => 1,
                'default'    => 1,
            ],
            'created_at' => [
                'type' => 'DATETIME',
            ],
            'updated_at' => [
                'type' => 'DATETIME',
            ],
        ]);

        $this->forge->addKey('id', true);
        $this->forge->addUniqueKey('name');
        $this->forge->addUniqueKey('slug');
        $this->forge->createTable('materials', true);

        // 2. Filament Shades
        $this->forge->addField([
            'id' => [
                'type'           => 'INT',
                'constraint'     => 10,
                'unsigned'       => true,
                'auto_increment' => true,
            ],
            'material_id' => [
                'type'       => 'INT',
                'constraint' => 10,
                'unsigned'   => true,
            ],
            'name' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
            ],
            'slug' => [
                'type'       => 'VARCHAR',
                'constraint' => 60,
            ],
            'hex_color' => [
                'type'       => 'CHAR',
                'constraint' => 7,
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
        $this->forge->addKey('material_id');
        $this->forge->addUniqueKey(['material_id', 'slug']);
        $this->forge->addForeignKey('material_id', 'materials', 'id', 'CASCADE', 'CASCADE');
        $this->forge->createTable('filament_shades', true);
    }

    public function down()
    {
        $this->forge->dropTable('filament_shades', true);
        $this->forge->dropTable('materials', true);
    }
}
