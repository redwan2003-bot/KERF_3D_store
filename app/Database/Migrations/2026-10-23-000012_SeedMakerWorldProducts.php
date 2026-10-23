<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class SeedMakerWorldProducts extends Migration
{
    public function up()
    {
        $seeder = \Config\Database::seeder();
        $seeder->call('App\Database\Seeds\MakerWorldProductSeeder');
    }

    public function down()
    {
        $db = \Config\Database::connect();
        $db->table('products')->like('sku', 'K3D-MW-', 'after')->delete();
    }
}
