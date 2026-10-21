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
    // SYNC CATALOG IMAGES FROM DRIVE -> MYSQL
    // ────────────────────────────────────────────────────────────

    /**
     * Synchronize all product image folders on Google Drive with MySQL.
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
            'products_synced' => 0,
            'images_added'    => 0,
            'images_updated'  => 0,
            'images_removed'  => 0,
            'errors'          => [],
        ];

        try {
            if (empty($this->productsFolderId)) {
                throw new \InvalidArgumentException('Products root folder ID is not configured.');
            }

            // List product subfolders in /Products/
            $query = "'{$this->productsFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
            $response = $this->drive->files->listFiles([
                'q'        => $query,
                'fields'   => 'files(id, name, webViewLink)',
                'pageSize' => 100,
            ]);

            foreach ($response->getFiles() as $folder) {
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
                if (!$product) {
                    continue; // Skip folders that do not match an existing product slug
                }

                // Update product folder link
                $this->productModel->update($product['id'], [
                    'drive_folder_id'  => $folderId,
                    'drive_folder_url' => self::folderUrl($folderId),
                ]);

                // Sync images for this product
                $subStats = $this->syncProductFolder($product, $folderId);

                $stats['products_synced']++;
                $stats['images_added']   += $subStats['added'];
                $stats['images_updated'] += $subStats['updated'];
                $stats['images_removed'] += $subStats['removed'];
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
     * Create product slug subfolders on Google Drive for all active products
     * if they do not exist already, and record their Drive folder IDs in MySQL.
     */
    public function initProductFolders(): array
    {
        $this->requireDriveClient();

        if (empty($this->productsFolderId)) {
            throw new \InvalidArgumentException('Products root folder ID is not configured.');
        }

        // Query existing folders in /Products/
        $existing = [];
        $query = "'{$this->productsFolderId}' in parents and mimeType = 'application/vnd.google-apps.folder' and trashed = false";
        $response = $this->drive->files->listFiles([
            'q'        => $query,
            'fields'   => 'files(id, name, webViewLink)',
            'pageSize' => 200,
        ]);

        foreach ($response->getFiles() as $f) {
            $existing[trim($f->getName())] = [
                'id'  => $f->getId(),
                'url' => $f->getWebViewLink(),
            ];
        }

        $created = 0;
        $matched = 0;
        $products = $this->productModel->findAll();

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

        $uploaded = $this->drive->files->create($fileMeta, [
            'data'       => file_get_contents($localFilePath),
            'mimeType'   => $mimeType,
            'uploadType' => 'multipart',
            'fields'     => 'id, size, webViewLink',
        ]);

        return [
            'drive_file_id'   => $uploaded->getId(),
            'drive_url'       => self::downloadUrl($uploaded->getId()),
            'drive_folder_id' => $subFolderId,
            'file_size_bytes' => (int) $uploaded->getSize(),
        ];
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
