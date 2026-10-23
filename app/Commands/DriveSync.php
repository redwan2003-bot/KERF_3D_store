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
        '--product'           => 'Specify a single product slug to sync (e.g. --product=arc-vessel)',
        '--init-folders'      => 'Auto-create category-nested Google Drive folders (Products/{Category}/{Name} ({slug}))',
        '--nested-categories' => 'Alias for --init-folders: organize into category-nested Google Drive hierarchy',
        '--remodify-folders'  => 'Remodify Google Drive product folder names to prepend categories [Category] Name (slug)',
    ];

    public function run(array $params)
    {
        CLI::write('✦ Kerf 3D Studio — Google Drive Media Synchronizer ✦', 'yellow');
        CLI::newLine();

        $productSlug      = CLI::getOption('product');
        $initFolders      = CLI::getOption('init-folders');
        $nestedCategories = CLI::getOption('nested-categories');
        $remodifyFolders  = CLI::getOption('remodify-folders');

        try {
            $service = new DriveSyncService();

            if ($nestedCategories || $initFolders) {
                CLI::write('Initializing category-nested Google Drive folder taxonomy...', 'cyan');
                CLI::write('Structure: Products / {Category Name} / {Product Name} ({slug})', 'light_gray');
                CLI::newLine();

                $stats = $service->initCategoryNestedFolders(function ($current, $total, $name, $category) {
                    if ($current % 25 === 0 || $current === $total) {
                        CLI::write("[{$current}/{$total}] {$category} → {$name}", 'light_gray');
                    }
                });

                CLI::newLine();
                CLI::table([
                    ['Metric', 'Count'],
                    ['Category Folders Created', $stats['categories_created']],
                    ['Product Folders Created',  $stats['products_created']],
                    ['Existing Folders Matched', $stats['products_matched']],
                    ['Legacy Folders Moved',     $stats['products_moved']],
                    ['Total Products Processed', $stats['total_products']],
                ], ['Metric', 'Count']);

                CLI::newLine();
                CLI::write('✓ Google Drive category-nested hierarchy initialized and synced to MySQL.', 'green');
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
