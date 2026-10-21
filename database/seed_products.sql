-- ============================================================
-- Kerf 3D Studio — Launch Products Seed Data
-- ============================================================

USE `kerf3d`;

-- 1. Insert 8 Launch Products
INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `weight_g`, `dimensions_mm`, `layer_height_mm`,
    `infill_percent`, `print_time_minutes`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES
(
    'K3D-001', 'Arc Vessel', 'arc-vessel',
    'Architectural ribbed vessel with parabolic fluting. Engineered for zero-support continuous extrusion on Bambu Lab A1.',
    'The Arc Vessel explores mathematical fluting to achieve extreme structural rigidity without internal infill penalties. Printed in high-grade PLA at 0.16mm layer resolution, each contour captures and diffuses ambient natural light with architectural presence.',
    1, 'ready_made', 'active', 'vessel,planter,fluted,minimalist,homeware',
    780.00, 140.00, '120 × 120 × 180 mm', 0.16, 15, 310, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 1
),
(
    'K3D-006', 'Grid Dock', 'grid-dock',
    'Weighted parametric tray with channeled cable routing and smartphone resting angle.',
    'Designed for desk workflows that demand tactile order. The Grid Dock houses daily essentials with calibrated chamfers and rear cable pass-through channels that keep charging cables locked at an ergonomic grab angle.',
    2, 'ready_made', 'active', 'desk,organizer,dock,cable,workspace',
    520.00, 85.00, '160 × 75 × 32 mm', 0.20, 20, 195, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 2
),
(
    'K3D-011', 'Flex Loop', 'flex-loop',
    'Compliant TPU 95A wristlet and tactile key loop utilizing elastic lattice tension.',
    'Manufactured from shore 95A thermoplastic polyurethane. Flex Loop is virtually indestructible, highly resistant to abrasion, and features a smooth, satisfying mechanical snap that clips onto lanyards and carabiners.',
    2, 'ready_made', 'active', 'tpu,flexible,edc,keychain,wearable',
    410.00, 42.00, '90 × 40 × 18 mm', 0.20, 100, 110, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 3
),
(
    'K3D-014', 'Stack Planter', 'stack-planter',
    'Dual-tier self-aerating planter with modular drainage reservoir.',
    'A modular botanical artifact that isolates root moisture while circulating air through internal vent slots. Fits standard 4-inch nursery pots directly or houses succulents with volcanic rock drainage.',
    1, 'ready_made', 'active', 'planter,botanical,succulent,drainage,interiors',
    1120.00, 210.00, '150 × 150 × 140 mm', 0.16, 18, 450, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 4
),
(
    'K3D-017', 'Keystone Hook', 'keystone-hook',
    'High-load structural wall peg utilizing triangular shear force distribution.',
    'Engineered to support heavy overcoats, headphones, and camera bags up to 8kg. Features a concealed screw-mounting channel that creates a floating architectural silhouette against wall surfaces.',
    3, 'ready_made', 'active', 'hook,hardware,architectural,hanger,coat-rack',
    460.00, 58.00, '65 × 35 × 110 mm', 0.20, 40, 140, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 5
),
(
    'K3D-018', 'Mono Tray', 'mono-tray',
    'Minimalist chamfered desk organiser with micro-texture surface.',
    'The Mono Tray serves as a tactile landing zone for watches, rings, fountain pens, and small electronics. Printed with a concentric top-infill pattern that catches light and resists surface scuffs.',
    2, 'ready_made', 'active', 'tray,catchall,stationery,valet,desktop',
    890.00, 160.00, '220 × 140 × 24 mm', 0.16, 15, 360, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 6
),
(
    'K3D-021', 'Tactile Cable Dock', 'tactile-cable-dock',
    'Desktop cable capture hub with friction-fit retention channels.',
    'Prevents USB-C, Lightning, and display cables from falling behind desks. The calibrated channel taper grips cables firmly without crimping delicate braiding or insulation.',
    2, 'ready_made', 'active', 'cable-management,usbc,desk-setup,cord-organizer',
    480.00, 75.00, '110 × 55 × 28 mm', 0.20, 25, 170, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 7
),
(
    'K3D-024', 'Bauhaus Desk Tidy', 'bauhaus-desk-tidy',
    'Geometric pen and card caddy inspired by Dessau architectural proportions.',
    'An asymmetrical tri-compartment vessel designed to hold writing instruments, business cards, and small scissors. Combines pure geometry with functional ergonomics for the modern studio space.',
    2, 'ready_made', 'active', 'bauhaus,pen-holder,caddy,architectural-desk',
    720.00, 130.00, '180 × 100 × 55 mm', 0.16, 20, 290, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Original studio design by Kerf 3D', 8
)
ON DUPLICATE KEY UPDATE `price_bdt` = VALUES(`price_bdt`), `name` = VALUES(`name`);

-- 2. Populate PLA Variations across Filament Shades
INSERT IGNORE INTO `product_variations` (`product_id`, `material_id`, `shade_id`, `sku_suffix`, `price_bdt`, `weight_g`, `stock_qty`, `stock_status`, `is_active`, `sort_order`)
SELECT p.id, s.material_id, s.id, CONCAT('-', UPPER(SUBSTRING(s.slug, 1, 3))), p.price_bdt, p.weight_g, 10, 'in_stock', 1, s.sort_order
FROM `products` p
CROSS JOIN `filament_shades` s
WHERE s.material_id = 1 AND p.slug != 'flex-loop';

-- 3. Populate TPU Variation for Flex Loop
INSERT IGNORE INTO `product_variations` (`product_id`, `material_id`, `shade_id`, `sku_suffix`, `price_bdt`, `weight_g`, `stock_qty`, `stock_status`, `is_active`, `sort_order`)
SELECT p.id, 2, NULL, '-TPU', p.price_bdt, p.weight_g, 15, 'in_stock', 1, 1
FROM `products` p
WHERE p.slug = 'flex-loop';
