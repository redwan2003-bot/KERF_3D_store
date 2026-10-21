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
        '--product' => 'Specify a single product slug to sync (e.g. --product=arc-vessel)',
    ];

    public function run(array $params)
    {
        CLI::write('✦ Kerf 3D Studio — Google Drive Media Synchronizer ✦', 'yellow');
        CLI::newLine();

        $productSlug = CLI::getOption('product');

        try {
            $service = new DriveSyncService();

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
