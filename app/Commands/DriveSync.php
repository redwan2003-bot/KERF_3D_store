<?php

namespace App\Commands;

use App\Services\DriveSyncService;
use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;

class DriveSync extends BaseCommand
{
    protected $group       = 'Kerf3D';
    protected $name        = 'drive:sync';
    protected $description = 'Synchronize product catalog images from Google Drive folders into MySQL';

    protected $usage = 'drive:sync [options]';
    protected $arguments = [];
    protected $options = [
        '--product'      => 'Specify a single product slug to sync (e.g. --product=arc-vessel)',
        '--init-folders' => 'Auto-create Google Drive product folders matching all catalog slugs',
    ];

    public function run(array $params)
    {
        CLI::write('✦ Kerf 3D Studio — Google Drive Media Synchronizer ✦', 'yellow');
        CLI::newLine();

        $productSlug = CLI::getOption('product');
        $initFolders = CLI::getOption('init-folders');

        try {
            $service = new DriveSyncService();

            if ($initFolders) {
                CLI::write('Initializing Google Drive folders for catalog products...', 'cyan');
                $initStats = $service->initProductFolders();

                CLI::table([
                    ['Metric', 'Count'],
                    ['Folders Created on Drive', $initStats['created']],
                    ['Existing Folders Matched', $initStats['matched']],
                    ['Total Catalog Products',   $initStats['total']],
                ], ['Metric', 'Count']);

                CLI::newLine();
                CLI::write('✓ Google Drive folder structure initialized and linked to MySQL.', 'green');
                return EXIT_SUCCESS;
            }

            if (!empty($productSlug)) {
                CLI::write("Synchronizing single product: {$productSlug}...", 'cyan');
                $stats = $service->syncProductBySlug($productSlug);

                CLI::table([
                    ['Metric', 'Count'],
                    ['Images Added',   $stats['added']],
                    ['Images Updated', $stats['updated']],
                    ['Images Removed', $stats['removed']],
                ], ['Metric', 'Count']);

            } else {
                CLI::write('Scanning Google Drive /Products/ hierarchy...', 'cyan');
                $stats = $service->syncAll();

                CLI::table([
                    ['Metric', 'Count'],
                    ['Products Synced', $stats['products_synced']],
                    ['Images Added',    $stats['images_added']],
                    ['Images Updated',  $stats['images_updated']],
                    ['Images Removed',  $stats['images_removed']],
                ], ['Metric', 'Count']);
            }

            CLI::newLine();
            CLI::write('✓ Google Drive synchronization completed successfully.', 'green');

        } catch (\Throwable $e) {
            CLI::error('Sync failed: ' . $e->getMessage());
            return EXIT_ERROR;
        }

        return EXIT_SUCCESS;
    }
}
