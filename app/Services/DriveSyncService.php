<?php

namespace App\Services;

use App\Models\DriveConfigModel;
use App\Models\DriveSyncLogModel;
use App\Models\ProductImageModel;
use App\Models\ProductModel;
use Google\Client as GoogleClient;
use Google\Service\Drive as GoogleDrive;
use Google\Service\Drive\DriveFile;
use Google\Service\Drive\Permission;

/**
 * Kerf 3D Studio — Google Drive Synchronization Service
 *
 * Manages two-way coordination between Google Drive storage and MySQL:
 * 1. Synchronizes catalog photos from Drive folders into `product_images`.
 * 2. Uploads customer CAD meshes (.STL, .OBJ, .3MF) to Google Drive.
 * 3. Builds direct Google Edge CDN URLs without storing binary image data in MySQL.
 */
class DriveSyncService
{
    protected ?GoogleClient $client = null;
    protected ?GoogleDrive  $drive  = null;

    protected ProductModel      $productModel;
    protected ProductImageModel $imageModel;
    protected DriveConfigModel  $configModel;
    protected DriveSyncLogModel $logModel;

    protected string $productsFolderId = '';
    protected string $uploadsFolderId  = '';
    protected int    $thumbWidth       = 400;

    public function __construct(?GoogleClient $client = null)
    {
        $this->productModel = new ProductModel();
        $this->imageModel   = new ProductImageModel();
        $this->configModel  = new DriveConfigModel();
        $this->logModel     = new DriveSyncLogModel();

        $this->initClient($client);
        $this->loadSettings();
    }

    /**
     * Initialize Google API client using Service Account credentials.
     */
    protected function initClient(?GoogleClient $client): void
    {
        if ($client !== null) {
            $this->client = $client;
            $this->drive  = new GoogleDrive($this->client);
            return;
        }

        $rawPath = env('GOOGLE_DRIVE_KEY_FILE');
        if (!empty($rawPath) && !str_starts_with($rawPath, '/') && !str_contains($rawPath, ':')) {
            $keyPath = ROOTPATH . $rawPath;
        } else {
            $keyPath = $rawPath ?: (ROOTPATH . 'config/credentials/drive-service-account.json');
        }

        if (!file_exists($keyPath)) {
            // Check fallback in config/credentials
            $altFiles = glob(ROOTPATH . 'config/credentials/*.json');
            if (!empty($altFiles)) {
                foreach ($altFiles as $f) {
                    if (!str_ends_with($f, '.example')) {
                        $keyPath = $f;
                        break;
                    }
                }
            }
        }

        if (!file_exists($keyPath)) {
            // Service can still be instantiated for URL building, but API calls will require the credentials
            return;
        }

        $this->client = new GoogleClient();
        $this->client->setApplicationName('Kerf 3D Store Asset Sync');
        $this->client->setScopes([GoogleDrive::DRIVE]);
        $this->client->setAuthConfig($keyPath);

        $this->drive = new GoogleDrive($this->client);
    }

    /**
     * Load folder IDs and settings from DB with fallback to .env.
     */
    protected function loadSettings(): void
    {
        $this->productsFolderId = $this->configModel->getVal('products_folder_id', env('GOOGLE_DRIVE_PRODUCTS_FOLDER_ID', ''));
        $this->uploadsFolderId  = $this->configModel->getVal('uploads_folder_id', env('GOOGLE_DRIVE_UPLOADS_FOLDER_ID', ''));
        $this->thumbWidth       = (int) $this->configModel->getVal('thumbnail_width', env('GOOGLE_DRIVE_THUMBNAIL_WIDTH', '400'));
    }

    /**
     * Ensure Google Drive client is authenticated before API operations.
     */
    protected function requireDriveClient(): void
    {
        if ($this->drive === null) {
            throw new \RuntimeException(
                'Google Drive API client is not configured. Place service account JSON in config/credentials/ or configure GOOGLE_DRIVE_KEY_FILE.'
            );
        }
    }

    // ────────────────────────────────────────────────────────────
    // URL GENERATORS (Google Edge CDN)
    // ────────────────────────────────────────────────────────────

    /**
     * High-speed direct image view URL via Google's CDN edge.
     */
    public static function directUrl(string $fileId): string
    {
        return "https://lh3.googleusercontent.com/d/{$fileId}";
    }

    /**
     * Dynamic thumbnail URL with width constraint.
     */
    public static function thumbnailUrl(string $fileId, int $width = 400): string
    {
        return "https://drive.google.com/thumbnail?id={$fileId}&sz=w{$width}";
    }

    /**
     * Direct file download URL.
     */
    public static function downloadUrl(string $fileId): string
    {
        return "https://drive.google.com/uc?export=download&id={$fileId}";
    }

    /**
     * View link for studio managers in Google Drive web interface.
     */
    public static function folderUrl(string $folderId): string
    {
        return "https://drive.google.com/drive/folders/{$folderId}";
    }

    // ────────────────────────────────────────────────────────────
    // SYNC CATALOG IMAGES & PRODUCT INFOS FROM DRIVE -> MYSQL
    // ────────────────────────────────────────────────────────────

    /**
     * Alias for syncAll() for backwards compatibility with controller calls.
     */
    public function sync(): array
    {
        return $this->syncAll();
    }

    /**
     * Synchronize all product image folders and metadata on Google Drive with MySQL.
     * Supports:
     * - Image syncing to product_images with Google CDN URLs
     * - Auto-creation of products when new folders appear in Google Drive
     * - Reading info.json / product.json inside folders to update product metadata
     * - Auto-syncing master CSV files placed in the Google Drive Products folder
     *
     * @return array Sync summary stats
     */
    public function syncAll(): array
    {
        $this->requireDriveClient();

        $logId = $this->logModel->insert([
            'sync_type'       => 'product_images',
            'status'          => 'started',
            'products_synced' => 0,
            'images_added'    => 0,
            'images_updated'  => 0,
            'images_removed'  => 0,
            'started_at'      => date('Y-m-d H:i:s'),
        ]);

        $stats = [
            'products_synced'  => 0,
            'products_created' => 0,
            'products_updated' => 0,
            'images_added'     => 0,
            'images_updated'   => 0,
            'images_removed'   => 0,
            'errors'           => [],
        ];

        try {
            if (empty($this->productsFolderId)) {
                throw new \InvalidArgumentException('Products root folder ID is not configured.');
            }

            // 1. Sync any master CSV files in Products root folder
            $this->syncMasterCsvFromDrive($stats);

            // 2. Fetch all product subfolders in /Products/ using pagination
            $allFolders = [];
            $pageToken  = null;

            do {
                $params = [
                    'q'        => "'{$this->productsFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false",
                    'fields'   => 'nextPageToken, files(id, name, webViewLink)',
                    'pageSize' => 100,
                ];
                if ($pageToken) {
                    $params['pageToken'] = $pageToken;
                }

                $res = $this->drive->files->listFiles($params);
                foreach ($res->getFiles() as $folder) {
                    $allFolders[] = $folder;
                }
                $pageToken = $res->getNextPageToken();
            } while ($pageToken);

            // 3. Process each Google Drive product folder
            foreach ($allFolders as $folder) {
                $folderName = trim($folder->getName());
                $folderId   = $folder->getId();

                // Match folder by: 1. Drive folder ID, 2. Regex slug extraction, 3. Raw slug
                $product = $this->productModel->where('drive_folder_id', $folderId)->first();
                if (!$product && preg_match('/\(([a-z0-9\-]+)\)$/', $folderName, $m)) {
                    $product = $this->productModel->where('slug', $m[1])->first();
                }
                if (!$product) {
                    $product = $this->productModel->where('slug', $folderName)->first();
                }

                // If folder is not recognized, auto-create the product from the folder taxonomy!
                if (!$product) {
                    $product = $this->createProductFromDriveFolder($folderName, $folderId, $folder->getWebViewLink());
                    if ($product) {
                        $stats['products_created']++;
                    }
                }

                if (!$product) {
                    continue; // Skip if product creation could not resolve
                }

                // Update product folder link in MySQL
                $this->productModel->update($product['id'], [
                    'drive_folder_id'  => $folderId,
                    'drive_folder_url' => self::folderUrl($folderId),
                ]);

                // Sync images and metadata for this product
                $subStats = $this->syncProductFolder($product, $folderId);

                $stats['products_synced']++;
                $stats['images_added']   += $subStats['added'];
                $stats['images_updated'] += $subStats['updated'];
                $stats['images_removed'] += $subStats['removed'];
                if (!empty($subStats['meta_updated'])) {
                    $stats['products_updated']++;
                }
            }

            $this->logModel->update($logId, [
                'status'          => 'completed',
                'products_synced' => $stats['products_synced'],
                'images_added'    => $stats['images_added'],
                'images_updated'  => $stats['images_updated'],
                'images_removed'  => $stats['images_removed'],
                'completed_at'    => date('Y-m-d H:i:s'),
            ]);

        } catch (\Throwable $e) {
            $stats['errors'][] = $e->getMessage();
            $this->logModel->update($logId, [
                'status'       => 'failed',
                'errors'       => $e->getMessage(),
                'completed_at' => date('Y-m-d H:i:s'),
            ]);
            throw $e;
        }

        return $stats;
    }

    /**
     * Scan Google Drive Products folder for any master CSV and import products.
     */
    protected function syncMasterCsvFromDrive(array &$stats): void
    {
        try {
            $csvQuery = "'{$this->productsFolderId}' in parents and (mimeType = 'text/csv' or name contains '.csv') and trashed = false";
            $res = $this->drive->files->listFiles(['q' => $csvQuery, 'fields' => 'files(id, name)']);
            $csvFiles = $res->getFiles();

            if (empty($csvFiles)) {
                return;
            }

            $db = \Config\Database::connect();
            foreach ($csvFiles as $csvFile) {
                $content = $this->drive->files->get($csvFile->getId(), ['alt' => 'media'])->getBody()->getContents();
                $tempPath = WRITEPATH . 'temp_drive_' . $csvFile->getId() . '.csv';
                file_put_contents($tempPath, $content);

                $handle = fopen($tempPath, 'r');
                if (!$handle) continue;

                $header = fgetcsv($handle);
                $index = 0;
                while (($row = fgetcsv($handle)) !== false) {
                    if (count($row) < 3) continue;
                    $prodName = trim($row[0]);
                    $catName  = trim($row[1]);
                    $seoDesc  = trim($row[2]);
                    if (empty($prodName)) continue;

                    $index++;
                    $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $prodName), '-'));

                    // Ensure category
                    $catSlug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $catName), '-'));
                    $cat = $db->table('categories')->where('slug', $catSlug)->get()->getRowArray();
                    if (!$cat) {
                        $db->table('categories')->insert([
                            'name'        => $catName,
                            'slug'        => $catSlug,
                            'description' => "Curated {$catName} artifacts manufactured by Kerf 3D Studio.",
                            'sort_order'  => 50,
                            'created_at'  => date('Y-m-d H:i:s'),
                            'updated_at'  => date('Y-m-d H:i:s'),
                        ]);
                        $catId = (int) $db->insertID();
                    } else {
                        $catId = (int) $cat['id'];
                    }

                    $existing = $this->productModel->where('slug', $slug)->first();
                    $fullDesc = $seoDesc . "\n\nManufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).";

                    $payload = [
                        'name'              => $prodName,
                        'slug'              => $slug,
                        'short_description' => $seoDesc,
                        'description'       => $fullDesc,
                        'category_id'       => $catId,
                        'catalog_type'      => 'ready_made',
                        'status'            => 'active',
                        'price_bdt'         => 0.00,
                        'creator'           => 'Kerf 3D Studio',
                        'license'           => 'Standard Commercial',
                        'updated_at'        => date('Y-m-d H:i:s'),
                    ];

                    if ($existing) {
                        $this->productModel->update($existing['id'], $payload);
                        $stats['products_updated']++;
                    } else {
                        $payload['sku'] = sprintf('K3D-MW-%03d', rand(500, 999));
                        $payload['created_at'] = date('Y-m-d H:i:s');
                        $this->productModel->insert($payload);
                        $stats['products_created']++;
                    }
                }
                fclose($handle);
                @unlink($tempPath);
            }
        } catch (\Throwable $e) {
            // Log notice and continue with folder sync
        }
    }

    /**
     * Auto-create a product when a new folder is created in Google Drive.
     * Taxonomy pattern: "[Category] Product Name (slug)" or "slug"
     */
    protected function createProductFromDriveFolder(string $folderName, string $folderId, string $webViewLink): ?array
    {
        $db = \Config\Database::connect();
        $catName  = 'General';
        $prodName = $folderName;
        $slug     = '';

        // Check if folder has category format: [Category] Name (slug)
        if (preg_match('/^\[(.*?)\]\s*(.*?)\s*\((.*?)\)$/', $folderName, $m)) {
            $catName  = trim($m[1]);
            $prodName = trim($m[2]);
            $slug     = trim($m[3]);
        } elseif (preg_match('/^(.*?)\s*\((.*?)\)$/', $folderName, $m)) {
            $prodName = trim($m[1]);
            $slug     = trim($m[2]);
        } else {
            $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $folderName), '-'));
            $prodName = ucwords(str_replace('-', ' ', $slug));
        }

        if (empty($slug)) {
            $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $prodName), '-'));
        }

        // Ensure category
        $catSlug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $catName), '-'));
        $cat = $db->table('categories')->where('slug', $catSlug)->get()->getRowArray();
        if (!$cat) {
            $db->table('categories')->insert([
                'name'        => $catName,
                'slug'        => $catSlug,
                'description' => "Curated {$catName} artifacts.",
                'sort_order'  => 50,
                'created_at'  => date('Y-m-d H:i:s'),
                'updated_at'  => date('Y-m-d H:i:s'),
            ]);
            $catId = (int) $db->insertID();
        } else {
            $catId = (int) $cat['id'];
        }

        $sku = 'K3D-DRV-' . strtoupper(substr(md5($slug), 0, 4));

        $id = $this->productModel->insert([
            'sku'                => $sku,
            'name'               => $prodName,
            'slug'               => $slug,
            'short_description'  => "{$prodName} 3D printed to order in Dhaka, Bangladesh. Message us on WhatsApp for pricing.",
            'description'        => "{$prodName} manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).",
            'category_id'        => $catId,
            'catalog_type'       => 'ready_made',
            'status'             => 'active',
            'tags'               => 'googledrive,makerworld,3dprinted,dhaka',
            'price_bdt'          => 0.00,
            'layer_height_mm'    => 0.20,
            'infill_percent'     => 20,
            'build_volume_fit'   => 1,
            'creator'            => 'Kerf 3D Studio',
            'license'            => 'Standard Commercial',
            'attribution_text'   => 'Curated specimen synced via Google Drive',
            'drive_folder_id'    => $folderId,
            'drive_folder_url'   => $webViewLink ?: self::folderUrl($folderId),
            'sort_order'         => 999,
            'created_at'         => date('Y-m-d H:i:s'),
            'updated_at'         => date('Y-m-d H:i:s'),
        ]);

        return $this->productModel->find($id);
    }

    /**
     * Create product slug subfolders on Google Drive for all active products
     * if they do not exist already, and record their Drive folder IDs in MySQL.
     */
    public function initProductFolders(): array
    {
        $this->requireDriveClient();

        if (empty($this->productsFolderId)) {
            throw new \InvalidArgumentException('Products root folder ID is not configured.');
        }

        // Query existing folders in /Products/ with pagination
        $existing = [];
        $pageToken = null;

        do {
            $params = [
                'q'        => "'{$this->productsFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false",
                'fields'   => 'nextPageToken, files(id, name, webViewLink)',
                'pageSize' => 100,
            ];
            if ($pageToken) {
                $params['pageToken'] = $pageToken;
            }

            $response = $this->drive->files->listFiles($params);
            foreach ($response->getFiles() as $f) {
                $name = trim($f->getName());
                $existing[$name] = [
                    'id'  => $f->getId(),
                    'url' => $f->getWebViewLink(),
                ];
                // Also index by slug extracted from [Category] Name (slug)
                if (preg_match('/\(([a-z0-9\-]+)\)$/', $name, $m)) {
                    $existing[$m[1]] = [
                        'id'  => $f->getId(),
                        'url' => $f->getWebViewLink(),
                    ];
                }
            }
            $pageToken = $response->getNextPageToken();
        } while ($pageToken);

        $created = 0;
        $matched = 0;
        $products = $this->productModel->where('status', 'active')->findAll();

        foreach ($products as $product) {
            $slug = $product['slug'];
            if (isset($existing[$slug])) {
                $folderId  = $existing[$slug]['id'];
                $folderUrl = $existing[$slug]['url'];
                $matched++;
            } else {
                $folderMeta = new \Google\Service\Drive\DriveFile([
                    'name'     => $slug,
                    'mimeType' => 'application/vnd.google-apps.folder',
                    'parents'  => [$this->productsFolderId],
                ]);
                $createdFolder = $this->drive->files->create($folderMeta, ['fields' => 'id, webViewLink']);
                $folderId  = $createdFolder->getId();
                $folderUrl = $createdFolder->getWebViewLink();
                $created++;
                usleep(50000); // 50ms throttle to prevent API rate spikes
            }

            // Update product in MySQL
            $this->productModel->update($product['id'], [
                'drive_folder_id'  => $folderId,
                'drive_folder_url' => $folderUrl ?: self::folderUrl($folderId),
            ]);
        }

        return [
            'created' => $created,
            'matched' => $matched,
            'total'   => count($products),
        ];
    }

    /**
     * Initialize category-nested Google Drive folders:
     * Products /
     *   ├── Carry Gear /
     *   │     ├── Charlie Brown AirPods Pro 2nd Gen Case (charlie-brown-airpods-pro-2nd-gen-case)
     *   │     └── ...
     *   ├── Organizers /
     *   └── ...
     */
    public function initCategoryNestedFolders(?callable $onProgress = null): array
    {
        $this->requireDriveClient();

        if (empty($this->productsFolderId)) {
            throw new \InvalidArgumentException('Products root folder ID is not configured.');
        }

        $db = \Config\Database::connect();
        $categories = $db->table('categories')->get()->getResultArray();

        // 1. Scan existing items in Products root
        $rootFolders = [];
        $pageToken = null;
        do {
            $params = [
                'q'        => "'{$this->productsFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false",
                'fields'   => 'nextPageToken, files(id, name, webViewLink)',
                'pageSize' => 100,
            ];
            if ($pageToken) {
                $params['pageToken'] = $pageToken;
            }
            $res = $this->drive->files->listFiles($params);
            foreach ($res->getFiles() as $f) {
                $rootFolders[trim($f->getName())] = [
                    'id'  => $f->getId(),
                    'url' => $f->getWebViewLink(),
                ];
            }
            $pageToken = $res->getNextPageToken();
        } while ($pageToken);

        // 2. Ensure each Category folder exists under Products root
        $categoryFolderMap = [];
        $categoriesCreated = 0;
        foreach ($categories as $cat) {
            $catName = trim($cat['name']);
            if (isset($rootFolders[$catName])) {
                $categoryFolderMap[$cat['id']] = $rootFolders[$catName]['id'];
            } else {
                $folderMeta = new \Google\Service\Drive\DriveFile([
                    'name'     => $catName,
                    'mimeType' => 'application/vnd.google-apps.folder',
                    'parents'  => [$this->productsFolderId],
                ]);
                $created = $this->drive->files->create($folderMeta, ['fields' => 'id']);
                $categoryFolderMap[$cat['id']] = $created->getId();
                $categoriesCreated++;
                usleep(60000);
            }
        }

        // 3. For each category folder, scan existing subfolders to avoid duplicates
        $existingProductFolders = [];
        foreach ($categoryFolderMap as $catId => $catFolderId) {
            $existingProductFolders[$catId] = [];
            $subPageToken = null;
            do {
                $subParams = [
                    'q'        => "'{$catFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false",
                    'fields'   => 'nextPageToken, files(id, name, webViewLink)',
                    'pageSize' => 100,
                ];
                if ($subPageToken) {
                    $subParams['pageToken'] = $subPageToken;
                }
                $subRes = $this->drive->files->listFiles($subParams);
                foreach ($subRes->getFiles() as $sf) {
                    $sName = trim($sf->getName());
                    if (preg_match('/\(([a-z0-9\-]+)\)$/i', $sName, $m)) {
                        $existingProductFolders[$catId][$m[1]] = [
                            'id'  => $sf->getId(),
                            'url' => $sf->getWebViewLink(),
                        ];
                    }
                    $existingProductFolders[$catId][$sName] = [
                        'id'  => $sf->getId(),
                        'url' => $sf->getWebViewLink(),
                    ];
                }
                $subPageToken = $subRes->getNextPageToken();
            } while ($subPageToken);
        }

        // 4. Products iteration
        $products = $db->table('products')
            ->select('products.id, products.name, products.slug, products.category_id, products.drive_folder_id, categories.name as category_name')
            ->join('categories', 'categories.id = products.category_id', 'left')
            ->where('products.status', 'active')
            ->get()->getResultArray();

        $productsCreated = 0;
        $productsMatched = 0;
        $productsMoved   = 0;
        $totalProducts   = count($products);

        foreach ($products as $idx => $p) {
            $catId = $p['category_id'];
            $targetCatFolderId = $categoryFolderMap[$catId] ?? null;

            if (!$targetCatFolderId) {
                if (!isset($categoryFolderMap['general'])) {
                    $fMeta = new \Google\Service\Drive\DriveFile([
                        'name'     => 'General',
                        'mimeType' => 'application/vnd.google-apps.folder',
                        'parents'  => [$this->productsFolderId],
                    ]);
                    $cr = $this->drive->files->create($fMeta, ['fields' => 'id']);
                    $categoryFolderMap['general'] = $cr->getId();
                }
                $targetCatFolderId = $categoryFolderMap['general'];
            }

            $slug = $p['slug'];
            $folderName = "{$p['name']} ({$slug})";

            if (isset($existingProductFolders[$catId][$slug])) {
                $folderId  = $existingProductFolders[$catId][$slug]['id'];
                $folderUrl = $existingProductFolders[$catId][$slug]['url'];
                $productsMatched++;
            } elseif (!empty($p['drive_folder_id'])) {
                $folderId = $p['drive_folder_id'];
                try {
                    $this->drive->files->update($folderId, new \Google\Service\Drive\DriveFile(['name' => $folderName]), [
                        'addParents'    => $targetCatFolderId,
                        'removeParents' => $this->productsFolderId,
                        'fields'        => 'id, webViewLink'
                    ]);
                    $folderUrl = self::folderUrl($folderId);
                    $productsMoved++;
                } catch (\Throwable $e) {
                    $folderUrl = self::folderUrl($folderId);
                    $productsMatched++;
                }
            } else {
                $fMeta = new \Google\Service\Drive\DriveFile([
                    'name'     => $folderName,
                    'mimeType' => 'application/vnd.google-apps.folder',
                    'parents'  => [$targetCatFolderId],
                ]);
                $created = $this->drive->files->create($fMeta, ['fields' => 'id, webViewLink']);
                $folderId  = $created->getId();
                $folderUrl = $created->getWebViewLink();
                $productsCreated++;
                usleep(60000); // 60ms throttle
            }

            $this->productModel->update($p['id'], [
                'drive_folder_id'  => $folderId,
                'drive_folder_url' => $folderUrl ?: self::folderUrl($folderId),
            ]);

            if ($onProgress) {
                $onProgress($idx + 1, $totalProducts, $p['name'], $p['category_name'] ?? 'General');
            }
        }

        return [
            'categories_created' => $categoriesCreated,
            'products_created'   => $productsCreated,
            'products_matched'   => $productsMatched,
            'products_moved'     => $productsMoved,
            'total_products'     => $totalProducts,
        ];
    }

    /**
     * Remodify product subfolder names on Google Drive to prepend category taxonomy
     * and human-readable product names: [Category] Product Name (slug)
     */
    public function remodifyFoldersWithCategories(): array
    {
        $this->requireDriveClient();

        $db = \Config\Database::connect();
        $products = $db->table('products')
            ->select('products.id, products.name, products.slug, products.drive_folder_id, categories.name as category_name')
            ->join('categories', 'categories.id = products.category_id', 'left')
            ->where('products.status', 'active')
            ->get()->getResultArray();

        $stats = ['renamed' => 0, 'skipped' => 0, 'details' => [], 'errors' => []];

        foreach ($products as $p) {
            $folderId = $p['drive_folder_id'];
            if (empty($folderId)) {
                $stats['skipped']++;
                continue;
            }

            $categoryName = !empty($p['category_name']) ? trim($p['category_name']) : 'General';
            $newName = "[{$categoryName}] {$p['name']} ({$p['slug']})";

            try {
                $fileMeta = new DriveFile(['name' => $newName]);
                $this->drive->files->update($folderId, $fileMeta);

                // Update MySQL drive_folder_url
                $this->productModel->update($p['id'], [
                    'drive_folder_url' => self::folderUrl($folderId),
                ]);

                $stats['renamed']++;
                $stats['details'][] = [
                    'slug'     => $p['slug'],
                    'new_name' => $newName,
                    'id'       => $folderId,
                ];
            } catch (\Throwable $e) {
                $stats['skipped']++;
                $stats['errors'][] = "Failed to rename {$p['slug']}: " . $e->getMessage();
            }
        }

        return $stats;
    }

    /**
     * Synchronize a single product by its slug.
     */
    public function syncProductBySlug(string $slug): array
    {
        $this->requireDriveClient();

        $product = $this->productModel->where('slug', $slug)->first();
        if (!$product) {
            throw new \InvalidArgumentException("Product with slug '{$slug}' not found.");
        }

        $folderId = $product['drive_folder_id'];

        // If folder ID not yet mapped, search for folder by slug name
        if (empty($folderId)) {
            $query = "'{$this->productsFolderId}' in parents and name = '{$slug}' and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
            $res   = $this->drive->files->listFiles(['q' => $query, 'fields' => 'files(id)']);
            $files = $res->getFiles();

            if (empty($files)) {
                throw new \RuntimeException("No Google Drive folder named '{$slug}' found in Products root.");
            }
            $folderId = $files[0]->getId();

            $this->productModel->update($product['id'], [
                'drive_folder_id'  => $folderId,
                'drive_folder_url' => self::folderUrl($folderId),
            ]);
        }

        return $this->syncProductFolder($product, $folderId);
    }

    /**
     * Internal: sync files inside a specific product folder.
     */
    protected function syncProductFolder(array $product, string $folderId): array
    {
        $stats = ['added' => 0, 'updated' => 0, 'removed' => 0];

        // 1. Fetch images from Google Drive
        $query = "'{$folderId}' in parents and mimeType contains 'image/' and trashed = false";
        $driveFiles = $this->drive->files->listFiles([
            'q'        => $query,
            'fields'   => 'files(id, name, mimeType, size, imageMediaMetadata)',
            'orderBy'  => 'name asc',
            'pageSize' => 50,
        ])->getFiles();

        // 2. Fetch existing DB records for this product
        $existingRows = $this->imageModel->where('product_id', $product['id'])->findAll();
        $existingMap  = [];
        foreach ($existingRows as $row) {
            $existingMap[$row['drive_file_id']] = $row;
        }

        $activeDriveIds = [];

        // 3. Process files from Drive
        foreach ($driveFiles as $index => $file) {
            $fileId   = $file->getId();
            $filename = $file->getName();
            $mimeType = $file->getMimeType();
            $fileSize = (int) $file->getSize();

            $meta   = $file->getImageMediaMetadata();
            $width  = $meta ? $meta->getWidth() : null;
            $height = $meta ? $meta->getHeight() : null;

            $activeDriveIds[] = $fileId;

            // Make public to anyone with link for CDN delivery
            $this->ensurePublicRead($fileId);

            $payload = [
                'product_id'          => $product['id'],
                'drive_file_id'       => $fileId,
                'drive_url'           => self::directUrl($fileId),
                'drive_thumbnail_url' => self::thumbnailUrl($fileId, $this->thumbWidth),
                'drive_download_url'  => self::downloadUrl($fileId),
                'filename'            => $filename,
                'alt_text'            => $product['name'] . ' specimen view ' . ($index + 1),
                'mime_type'           => $mimeType,
                'file_size_bytes'     => $fileSize,
                'width_px'            => $width,
                'height_px'           => $height,
                'sort_order'          => $index,
                'is_active'           => 1,
                'synced_at'           => date('Y-m-d H:i:s'),
            ];

            if (isset($existingMap[$fileId])) {
                // Update
                $this->imageModel->update($existingMap[$fileId]['id'], $payload);
                $stats['updated']++;
            } else {
                // Insert new
                $payload['is_primary'] = ($index === 0 && empty($existingRows)) ? 1 : 0;
                $this->imageModel->insert($payload);
                $stats['added']++;
            }
        }

        // 4. Remove images in DB that were deleted from Drive
        foreach ($existingMap as $fileId => $existingRecord) {
            if (!in_array($fileId, $activeDriveIds, true)) {
                $this->imageModel->delete($existingRecord['id']);
                $stats['removed']++;
            }
        }

        // 5. Ensure at least one primary image exists
        $hasPrimary = $this->imageModel->where('product_id', $product['id'])->where('is_primary', 1)->first();
        if (!$hasPrimary) {
            $firstImage = $this->imageModel->where('product_id', $product['id'])->orderBy('sort_order', 'ASC')->first();
            if ($firstImage) {
                $this->imageModel->update($firstImage['id'], ['is_primary' => 1]);
            }
        }

        // 6. Check for info.json / product.json in the folder to update product details
        try {
            $infoRes = $this->drive->files->listFiles([
                'q'      => "'{$folderId}' in parents and (name = 'info.json' or name = 'product.json') and trashed = false",
                'fields' => 'files(id, name)',
            ]);
            $infoFiles = $infoRes->getFiles();
            if (!empty($infoFiles)) {
                $content = $this->drive->files->get($infoFiles[0]->getId(), ['alt' => 'media'])->getBody()->getContents();
                $meta = json_decode($content, true);
                if (is_array($meta)) {
                    $updateFields = [];
                    if (!empty($meta['name'])) $updateFields['name'] = trim($meta['name']);
                    if (!empty($meta['short_description'])) $updateFields['short_description'] = trim($meta['short_description']);
                    if (!empty($meta['description'])) $updateFields['description'] = trim($meta['description']);
                    if (isset($meta['price_bdt'])) $updateFields['price_bdt'] = (float) $meta['price_bdt'];
                    if (!empty($meta['tags'])) $updateFields['tags'] = is_array($meta['tags']) ? implode(',', $meta['tags']) : trim($meta['tags']);
                    if (isset($meta['weight_g'])) $updateFields['weight_g'] = (float) $meta['weight_g'];
                    if (!empty($meta['dimensions_mm'])) $updateFields['dimensions_mm'] = trim($meta['dimensions_mm']);
                    if (isset($meta['layer_height_mm'])) $updateFields['layer_height_mm'] = (float) $meta['layer_height_mm'];
                    if (isset($meta['infill_percent'])) $updateFields['infill_percent'] = (int) $meta['infill_percent'];

                    if (!empty($updateFields)) {
                        $updateFields['updated_at'] = date('Y-m-d H:i:s');
                        $this->productModel->update($product['id'], $updateFields);
                        $stats['meta_updated'] = 1;
                    }
                }
            }
        } catch (\Throwable $e) {
            // Ignore info file read errors and continue safely
        }

        return $stats;
    }

    /**
     * Grant "anyone with link = viewer" permission for Google CDN delivery.
     */
    protected function ensurePublicRead(string $fileId): void
    {
        try {
            $perm = new Permission([
                'type' => 'anyone',
                'role' => 'reader',
            ]);
            $this->drive->permissions->create($fileId, $perm);
        } catch (\Throwable $e) {
            // Permission may already exist; continue safely
        }
    }

    // ────────────────────────────────────────────────────────────
    // CUSTOM CUSTOMER 3D MODEL UPLOADS -> DRIVE
    // ────────────────────────────────────────────────────────────

    /**
     * Upload customer CAD geometry (.STL, .OBJ, .3MF) to Google Drive.
     *
     * @param string $localFilePath Local temporary file path
     * @param string $filename Original filename
     * @param string $sessionOrOrder Session ID or Order Number for subfolder grouping
     * @return array [drive_file_id, drive_url, drive_folder_id, file_size_bytes]
     */
    public function uploadCustomerCAD(string $localFilePath, string $filename, string $sessionOrOrder): array
    {
        $this->requireDriveClient();

        if (empty($this->uploadsFolderId)) {
            throw new \RuntimeException('Customer uploads folder ID is not configured.');
        }

        // 1. Get or create session/order subfolder in /Customer_Uploads/
        $subFolderId = $this->getOrCreateSubfolder($sessionOrOrder, $this->uploadsFolderId);

        // 2. Upload file
        $fileMeta = new DriveFile([
            'name'    => $filename,
            'parents' => [$subFolderId],
        ]);

        $mimeType = mime_content_type($localFilePath) ?: 'application/octet-stream';

        try {
            $uploaded = $this->drive->files->create($fileMeta, [
                'data'              => file_get_contents($localFilePath),
                'mimeType'          => $mimeType,
                'uploadType'        => 'multipart',
                'fields'            => 'id, size, webViewLink',
                'supportsAllDrives' => true,
            ]);

            return [
                'drive_file_id'   => $uploaded->getId(),
                'drive_url'       => self::downloadUrl($uploaded->getId()),
                'drive_folder_id' => $subFolderId,
                'file_size_bytes' => (int) $uploaded->getSize(),
                'storage_type'    => 'google_drive',
            ];
        } catch (\Throwable $e) {
            // If Service Account has no direct upload quota on Google personal drive,
            // persist securely to workshop server disk storage under writable/uploads/
            $safeSession = preg_replace('/[^a-zA-Z0-9_\-]/', '_', $sessionOrOrder);
            $uploadDir   = WRITEPATH . 'uploads/custom_cad/' . $safeSession . '/';
            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0755, true);
            }
            $targetPath = $uploadDir . $filename;
            copy($localFilePath, $targetPath);

            return [
                'drive_file_id'   => 'local_' . substr(md5($targetPath), 0, 16),
                'drive_url'       => '/admin/cad-uploads/download/' . urlencode($safeSession) . '/' . urlencode($filename),
                'drive_folder_id' => $subFolderId,
                'file_size_bytes' => (int) (filesize($targetPath) ?: filesize($localFilePath)),
                'storage_type'    => 'local_server',
            ];
        }
    }

    /**
     * Helper to retrieve or create a folder under a parent folder.
     */
    protected function getOrCreateSubfolder(string $folderName, string $parentId): string
    {
        $query = "'{$parentId}' in parents and name = '{$folderName}' and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
        $res   = $this->drive->files->listFiles(['q' => $query, 'fields' => 'files(id)']);
        $files = $res->getFiles();

        if (!empty($files)) {
            return $files[0]->getId();
        }

        $newFolder = new DriveFile([
            'name'     => $folderName,
            'mimeType' => 'application/vnd.google-apps.folder',
            'parents'  => [$parentId],
        ]);

        $created = $this->drive->files->create($newFolder, ['fields' => 'id']);
        return $created->getId();
    }
}
