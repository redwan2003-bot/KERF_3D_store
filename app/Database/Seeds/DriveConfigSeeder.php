<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class DriveConfigSeeder extends Seeder
{
    public function run()
    {
        $db = \Config\Database::connect();

        $configs = [
            [
                'config_key'   => 'root_folder_id',
                'config_value' => '',
                'description'  => 'Google Drive Root ID for /KERF_3D_MEDIA/',
                'updated_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'config_key'   => 'products_folder_id',
                'config_value' => '',
                'description'  => 'Drive Folder ID for /KERF_3D_MEDIA/Products/',
                'updated_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'config_key'   => 'uploads_folder_id',
                'config_value' => '',
                'description'  => 'Drive Folder ID for /KERF_3D_MEDIA/Customer_Uploads/',
                'updated_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'config_key'   => 'service_account_email',
                'config_value' => '',
                'description'  => 'Google Cloud Service Account Email with Editor access',
                'updated_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'config_key'   => 'thumbnail_width',
                'config_value' => '400',
                'description'  => 'Default dynamic thumbnail width parameter for Google CDN delivery',
                'updated_at'   => date('Y-m-d H:i:s'),
            ],
            [
                'config_key'   => 'sync_interval_mins',
                'config_value' => '60',
                'description'  => 'Automated background Drive sync interval',
                'updated_at'   => date('Y-m-d H:i:s'),
            ],
        ];

        foreach ($configs as $cfg) {
            $existing = $db->table('drive_config')->where('config_key', $cfg['config_key'])->get()->getRow();
            if ($existing) {
                $db->table('drive_config')->where('config_key', $cfg['config_key'])->update($cfg);
            } else {
                $db->table('drive_config')->insert($cfg);
            }
        }
    }
}
