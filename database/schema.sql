-- ============================================================
-- Kerf 3D Studio — Complete Production MySQL 8.x Schema
-- Specification Reference: docs/DATABASE_AND_DRIVE_SPEC.md
--
-- Features:
--   • Lightweight relational design (Zero image BLOBs)
--   • Google Drive CDN URL references for catalog imagery
--   • Customer CAD upload metadata (files on Drive)
--   • Full variation matrix (Material × Filament Shade)
--   • Session-based cart and checkout with Dhaka zone rules
--   • Manual bKash/Nagad/Rocket TrxID audit log
--   • Idempotent Drive sync operation log & settings
-- ============================================================

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

CREATE DATABASE IF NOT EXISTS `kerf3d`
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE `kerf3d`;

-- ────────────────────────────────────────────────────────────
-- 1. CATEGORIES
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
    `id`            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(120)    NOT NULL,
    `slug`          VARCHAR(120)    NOT NULL,
    `description`   TEXT            NULL,
    `parent_id`     INT UNSIGNED    NULL,
    `sort_order`    INT UNSIGNED    NOT NULL DEFAULT 0,
    `created_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_categories_slug` (`slug`),
    KEY `idx_categories_parent` (`parent_id`),
    CONSTRAINT `fk_categories_parent`
        FOREIGN KEY (`parent_id`) REFERENCES `categories`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 2. MATERIALS & FILAMENT SHADES
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `filament_shades`;
DROP TABLE IF EXISTS `materials`;

CREATE TABLE `materials` (
    `id`                    INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `name`                  VARCHAR(60)     NOT NULL,
    `slug`                  VARCHAR(60)     NOT NULL,
    `rate_per_gram_bdt`     DECIMAL(8,2)    NOT NULL COMMENT 'BDT per gram',
    `effective_density`     DECIMAL(5,3)    NOT NULL COMMENT 'g/cm³ for quoting',
    `customer_label`        VARCHAR(60)     NOT NULL,
    `max_hotend_temp_c`     SMALLINT UNSIGNED NULL,
    `max_bed_temp_c`        SMALLINT UNSIGNED NULL,
    `is_recommended`        TINYINT(1)      NOT NULL DEFAULT 1,
    `is_active`             TINYINT(1)      NOT NULL DEFAULT 1,
    `created_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_materials_name` (`name`),
    UNIQUE KEY `uq_materials_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `filament_shades` (
    `id`            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `material_id`   INT UNSIGNED    NOT NULL,
    `name`          VARCHAR(60)     NOT NULL,
    `slug`          VARCHAR(60)     NOT NULL,
    `hex_color`     CHAR(7)         NULL,
    `is_active`     TINYINT(1)      NOT NULL DEFAULT 1,
    `sort_order`    INT UNSIGNED    NOT NULL DEFAULT 0,
    `created_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_shades_combo` (`material_id`, `slug`),
    KEY `idx_shades_material` (`material_id`),
    CONSTRAINT `fk_shades_material`
        FOREIGN KEY (`material_id`) REFERENCES `materials`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 3. PRODUCTS
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
    `id`                    INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `sku`                   VARCHAR(40)     NOT NULL,
    `name`                  VARCHAR(255)    NOT NULL,
    `slug`                  VARCHAR(255)    NOT NULL,
    `short_description`     VARCHAR(500)    NULL,
    `description`           TEXT            NULL,
    `category_id`           INT UNSIGNED    NULL,
    `catalog_type`          ENUM('ready_made','custom_print','inspiration','review')
                                            NOT NULL DEFAULT 'ready_made',
    `status`                ENUM('draft','active','archived','review')
                                            NOT NULL DEFAULT 'draft',
    `tags`                  VARCHAR(500)    NULL,
    `price_bdt`             DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
    `sale_price_bdt`        DECIMAL(10,2)   NULL,
    `weight_g`              DECIMAL(8,2)    NULL,
    `dimensions_mm`         VARCHAR(80)     NULL,
    `layer_height_mm`       DECIMAL(4,2)    NULL,
    `infill_percent`        TINYINT UNSIGNED NULL,
    `print_time_minutes`    INT UNSIGNED    NULL,
    `build_volume_fit`      TINYINT(1)      NOT NULL DEFAULT 1,
    `makerworld_url`        VARCHAR(500)    NULL,
    `creator`               VARCHAR(120)    NULL,
    `license`               VARCHAR(120)    NULL,
    `attribution_text`      VARCHAR(500)    NULL,

    -- Google Drive Catalog Folder Link
    `drive_folder_id`       VARCHAR(120)    NULL COMMENT 'Folder ID on Google Drive',
    `drive_folder_url`      VARCHAR(500)    NULL COMMENT 'Browser URL to Drive folder',

    `sort_order`            INT UNSIGNED    NOT NULL DEFAULT 0,
    `created_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_products_sku` (`sku`),
    UNIQUE KEY `uq_products_slug` (`slug`),
    KEY `idx_products_category` (`category_id`),
    KEY `idx_products_status` (`status`),
    KEY `idx_products_catalog_type` (`catalog_type`),
    KEY `idx_products_drive_folder` (`drive_folder_id`),
    CONSTRAINT `fk_products_category`
        FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 4. PRODUCT IMAGES (Populated via Google Drive Sync)
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
    `id`                    INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `product_id`            INT UNSIGNED    NOT NULL,
    `drive_file_id`         VARCHAR(120)    NOT NULL,
    `drive_url`             VARCHAR(500)    NOT NULL COMMENT 'Direct display via Google CDN',
    `drive_thumbnail_url`   VARCHAR(500)    NULL,
    `drive_download_url`    VARCHAR(500)    NULL,
    `filename`              VARCHAR(255)    NOT NULL,
    `alt_text`              VARCHAR(255)    NULL,
    `mime_type`             VARCHAR(40)     NULL,
    `file_size_bytes`       INT UNSIGNED    NULL,
    `width_px`              SMALLINT UNSIGNED NULL,
    `height_px`             SMALLINT UNSIGNED NULL,
    `is_primary`            TINYINT(1)      NOT NULL DEFAULT 0,
    `sort_order`            INT UNSIGNED    NOT NULL DEFAULT 0,
    `is_active`             TINYINT(1)      NOT NULL DEFAULT 1,
    `synced_at`             DATETIME        NULL,
    `created_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    KEY `idx_images_product` (`product_id`),
    KEY `idx_images_primary` (`product_id`, `is_primary`),
    KEY `idx_images_drive_file` (`drive_file_id`),
    CONSTRAINT `fk_images_product`
        FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 5. PRODUCT VARIATIONS
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `product_variations`;
CREATE TABLE `product_variations` (
    `id`                INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `product_id`        INT UNSIGNED    NOT NULL,
    `material_id`       INT UNSIGNED    NOT NULL,
    `shade_id`          INT UNSIGNED    NULL,
    `sku_suffix`        VARCHAR(20)     NULL,
    `price_bdt`         DECIMAL(10,2)   NOT NULL,
    `sale_price_bdt`    DECIMAL(10,2)   NULL,
    `weight_g`          DECIMAL(8,2)    NULL,
    `inventory_number`  VARCHAR(40)     NULL,
    `stock_qty`         INT             NOT NULL DEFAULT 0,
    `stock_status`      ENUM('in_stock','out_of_stock','preorder')
                                        NOT NULL DEFAULT 'in_stock',
    `drive_file_id`     VARCHAR(120)    NULL,
    `drive_url`         VARCHAR(500)    NULL,
    `is_active`         TINYINT(1)      NOT NULL DEFAULT 1,
    `sort_order`        INT UNSIGNED    NOT NULL DEFAULT 0,
    `created_at`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_variation_combo` (`product_id`, `material_id`, `shade_id`),
    KEY `idx_variations_material` (`material_id`),
    KEY `idx_variations_shade` (`shade_id`),
    KEY `idx_variations_stock` (`stock_status`),
    CONSTRAINT `fk_variations_product`
        FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_variations_material`
        FOREIGN KEY (`material_id`) REFERENCES `materials`(`id`)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_variations_shade`
        FOREIGN KEY (`shade_id`) REFERENCES `filament_shades`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 6. CUSTOMERS
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
    `id`            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(120)    NOT NULL,
    `phone`         VARCHAR(20)     NOT NULL,
    `email`         VARCHAR(255)    NULL,
    `address_line`  TEXT            NOT NULL,
    `is_dhaka`      TINYINT(1)      NOT NULL DEFAULT 1,
    `notes`         TEXT            NULL,
    `created_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    KEY `idx_customers_phone` (`phone`),
    KEY `idx_customers_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 7. CUSTOM UPLOADS (CAD Files stored on Drive)
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `custom_uploads`;
CREATE TABLE `custom_uploads` (
    `id`                    INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `session_id`            VARCHAR(128)    NULL,
    `customer_id`           INT UNSIGNED    NULL,
    `original_filename`     VARCHAR(255)    NOT NULL,
    `file_extension`        VARCHAR(10)     NOT NULL,
    `mime_type`             VARCHAR(60)     NULL,
    `file_size_bytes`       INT UNSIGNED    NOT NULL,
    `file_hash`             CHAR(64)        NULL,
    `drive_file_id`         VARCHAR(120)    NOT NULL,
    `drive_url`             VARCHAR(500)    NOT NULL,
    `drive_folder_id`       VARCHAR(120)    NULL,
    `mesh_volume_cm3`       DECIMAL(12,4)   NULL,
    `estimated_grams`       DECIMAL(8,2)    NULL,
    `material_id`           INT UNSIGNED    NULL,
    `infill_percent`        TINYINT UNSIGNED NULL,
    `fits_build_volume`     TINYINT(1)      NOT NULL DEFAULT 1,
    `print_subtotal_bdt`    DECIMAL(10,2)   NULL,
    `setup_fee_bdt`         DECIMAL(10,2)   NOT NULL DEFAULT 50.00,
    `quote_total_bdt`       DECIMAL(10,2)   NULL,
    `quote_status`          ENUM('pending','quoted','accepted','rejected','expired')
                                            NOT NULL DEFAULT 'pending',
    `uploaded_at`           DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    KEY `idx_uploads_session` (`session_id`),
    KEY `idx_uploads_customer` (`customer_id`),
    KEY `idx_uploads_drive_file` (`drive_file_id`),
    CONSTRAINT `fk_uploads_customer`
        FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_uploads_material`
        FOREIGN KEY (`material_id`) REFERENCES `materials`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 8. ORDERS & ORDER ITEMS
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `order_items`;
DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
    `id`                    INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `order_number`          VARCHAR(30)     NOT NULL,
    `customer_id`           INT UNSIGNED    NOT NULL,
    `shipping_zone`         ENUM('inside_dhaka','outside_dhaka')
                                            NOT NULL,
    `shipping_cost_bdt`     DECIMAL(10,2)   NOT NULL DEFAULT 70.00,
    `subtotal_bdt`          DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
    `setup_fee_total_bdt`   DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
    `total_bdt`             DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
    `deposit_bdt`           DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
    `balance_due_bdt`       DECIMAL(10,2)   NOT NULL DEFAULT 0.00,
    `payment_method`        ENUM('bkash','nagad','rocket','cod')
                                            NOT NULL,
    `trx_id`                VARCHAR(60)     NULL,
    `payment_status`        ENUM('pending','on_hold','verified','failed','refunded')
                                            NOT NULL DEFAULT 'pending',
    `order_status`          ENUM('received','slicing','printing','dispatched','delivered','cancelled')
                                            NOT NULL DEFAULT 'received',
    `courier_provider`      VARCHAR(60)     NULL,
    `courier_tracking`      VARCHAR(120)    NULL,
    `admin_notes`           TEXT            NULL,
    `order_notes`           TEXT            NULL,
    `created_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_orders_number` (`order_number`),
    KEY `idx_orders_customer` (`customer_id`),
    KEY `idx_orders_status` (`order_status`),
    KEY `idx_orders_payment` (`payment_status`),
    KEY `idx_orders_trx` (`trx_id`),
    CONSTRAINT `fk_orders_customer`
        FOREIGN KEY (`customer_id`) REFERENCES `customers`(`id`)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `order_items` (
    `id`                    INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `order_id`              INT UNSIGNED    NOT NULL,
    `item_type`             ENUM('ready_made','custom_print')
                                            NOT NULL DEFAULT 'ready_made',
    `product_id`            INT UNSIGNED    NULL,
    `variation_id`          INT UNSIGNED    NULL,
    `upload_id`             INT UNSIGNED    NULL,
    `product_name_snapshot` VARCHAR(255)    NOT NULL,
    `specs_snapshot`        VARCHAR(255)    NULL,
    `quantity`              SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    `unit_price_bdt`        DECIMAL(10,2)   NOT NULL,
    `line_total_bdt`        DECIMAL(10,2)   NOT NULL,
    `created_at`            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    KEY `idx_items_order` (`order_id`),
    KEY `idx_items_product` (`product_id`),
    CONSTRAINT `fk_items_order`
        FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_items_product`
        FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_items_variation`
        FOREIGN KEY (`variation_id`) REFERENCES `product_variations`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_items_upload`
        FOREIGN KEY (`upload_id`) REFERENCES `custom_uploads`(`id`)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 9. CART ITEMS
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
    `id`            INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `session_id`    VARCHAR(128)    NOT NULL,
    `item_type`     ENUM('ready_made','custom_print')
                                    NOT NULL DEFAULT 'ready_made',
    `product_id`    INT UNSIGNED    NULL,
    `variation_id`  INT UNSIGNED    NULL,
    `upload_id`     INT UNSIGNED    NULL,
    `quantity`      SMALLINT UNSIGNED NOT NULL DEFAULT 1,
    `created_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    KEY `idx_cart_session` (`session_id`),
    CONSTRAINT `fk_cart_product`
        FOREIGN KEY (`product_id`) REFERENCES `products`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_cart_variation`
        FOREIGN KEY (`variation_id`) REFERENCES `product_variations`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_cart_upload`
        FOREIGN KEY (`upload_id`) REFERENCES `custom_uploads`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 10. PAYMENTS (Manual MFS Audit Log)
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
    `id`                INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `order_id`          INT UNSIGNED    NOT NULL,
    `payment_method`    ENUM('bkash','nagad','rocket','cod')
                                        NOT NULL,
    `trx_id`            VARCHAR(60)     NOT NULL,
    `amount_bdt`        DECIMAL(10,2)   NOT NULL,
    `payment_type`      ENUM('deposit','full','balance','refund')
                                        NOT NULL DEFAULT 'deposit',
    `status`            ENUM('pending','verified','rejected')
                                        NOT NULL DEFAULT 'pending',
    `verified_by`       VARCHAR(60)     NULL,
    `verified_at`       DATETIME        NULL,
    `notes`             TEXT            NULL,
    `created_at`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`),
    KEY `idx_payments_order` (`order_id`),
    KEY `idx_payments_trx` (`trx_id`),
    KEY `idx_payments_status` (`status`),
    CONSTRAINT `fk_payments_order`
        FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ────────────────────────────────────────────────────────────
-- 11. GOOGLE DRIVE SYNC LOG & CONFIGURATION
-- ────────────────────────────────────────────────────────────
DROP TABLE IF EXISTS `drive_sync_log`;
DROP TABLE IF EXISTS `drive_config`;

CREATE TABLE `drive_config` (
    `config_key`    VARCHAR(60)     NOT NULL,
    `config_value`  VARCHAR(500)    NOT NULL,
    `description`   VARCHAR(255)    NULL,
    `updated_at`    DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`config_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `drive_sync_log` (
    `id`                INT UNSIGNED    NOT NULL AUTO_INCREMENT,
    `sync_type`         ENUM('product_images','custom_uploads','full')
                                        NOT NULL,
    `status`            ENUM('started','completed','failed')
                                        NOT NULL DEFAULT 'started',
    `products_synced`   INT UNSIGNED    NOT NULL DEFAULT 0,
    `images_added`      INT UNSIGNED    NOT NULL DEFAULT 0,
    `images_updated`    INT UNSIGNED    NOT NULL DEFAULT 0,
    `images_removed`    INT UNSIGNED    NOT NULL DEFAULT 0,
    `errors`            TEXT            NULL,
    `started_at`        DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `completed_at`      DATETIME        NULL,

    PRIMARY KEY (`id`),
    KEY `idx_sync_status` (`status`),
    KEY `idx_sync_started` (`started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;

-- ────────────────────────────────────────────────────────────
-- INITIAL SEED DATA
-- ────────────────────────────────────────────────────────────

-- Confirmed Materials for Bambu Lab A1
INSERT INTO `materials` (`name`, `slug`, `rate_per_gram_bdt`, `effective_density`, `customer_label`, `is_recommended`, `is_active`)
VALUES
    ('PLA',     'pla',      6.50,  0.500, 'PLA / rigid biopolymer', 1, 1),
    ('TPU 95A', 'tpu-95a',  9.75,  0.480, 'TPU 95A / flexible',     1, 1),
    ('PETG',    'petg',     7.50,  0.500, 'PETG / engineering',     1, 0)
ON DUPLICATE KEY UPDATE `rate_per_gram_bdt` = VALUES(`rate_per_gram_bdt`);

-- Initial Filament Shades for PLA
INSERT INTO `filament_shades` (`material_id`, `name`, `slug`, `hex_color`, `sort_order`, `is_active`)
VALUES
    (1, 'Terracotta',     'terracotta',      '#C86446', 1, 1),
    (1, 'Matte Black',    'matte-black',     '#181818', 2, 1),
    (1, 'Parchment White','parchment-white', '#F8F6F0', 3, 1),
    (1, 'Silk Gold',      'silk-gold',       '#C4A052', 4, 1),
    (1, 'Olive Drab',     'olive-drab',      '#4A4A28', 5, 1)
ON DUPLICATE KEY UPDATE `hex_color` = VALUES(`hex_color`);

-- Initial Categories
INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES
    ('Vessels & Forms', 'vessels-forms', 'Geometric planters, bowls, and sculptural vessels', 1),
    ('Desk & Studio',   'desk-studio',   'Docks, trays, cable guides, and tactile desktop tools', 2),
    ('Architectural',   'architectural', 'Modular brackets, hooks, structural specimens', 3),
    ('Custom Mesh',     'custom-mesh',   'Client-uploaded geometry manufacturing orders', 4)
ON DUPLICATE KEY UPDATE `name` = VALUES(`name`);

-- Default Google Drive Configurations
INSERT INTO `drive_config` (`config_key`, `config_value`, `description`)
VALUES
    ('root_folder_id',       '',      'Google Drive ID for /KERF_3D_MEDIA/'),
    ('products_folder_id',   '',      'Drive ID for /KERF_3D_MEDIA/Products/'),
    ('uploads_folder_id',    '',      'Drive ID for /KERF_3D_MEDIA/Customer_Uploads/'),
    ('service_account_email','',      'Service Account Email'),
    ('thumbnail_width',      '400',   'Default thumbnail width for CDN delivery'),
    ('sync_interval_mins',   '60',    'Automated background sync interval')
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);
