-- ============================================================
-- Kerf 3D Studio — Launch Products Seed Data
-- Replaced dummy products with curated MakerWorld catalog.
-- See database/seed_makerworld_products.sql for the complete 419 products seed script.
-- ============================================================

USE `kerf3d`;

-- Clean up any residual legacy dummy records if they exist
DELETE FROM `products` WHERE `sku` IN ('K3D-001','K3D-006','K3D-011','K3D-014','K3D-017','K3D-018','K3D-021','K3D-024');
DELETE FROM `categories` WHERE `slug` IN ('vessels-forms','architectural','custom-mesh');
