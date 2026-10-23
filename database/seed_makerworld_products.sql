-- ============================================================
-- Kerf 3D Studio — 55 MakerWorld Products Seed Script
-- ============================================================

USE `kerf3d`;

-- 1. Insert Missing Categories
INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Carry Gear', 'carry-gear', 'Everyday carry cases, carabiners, and modular EDC attachments.', 11)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Organizers', 'organizers', 'Desktop caddies, pen holders, and modular workstation dividers.', 12)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Keyboards', 'keyboards', 'Ergonomic cases, custom keycaps, and mechanical numpad enclosures.', 13)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Lamps', 'lamps', 'Parametric ambient lighting, diffusers, and pendant lamp shades.', 14)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Bathroom', 'bathroom', 'Water-draining soap trays and architectural countertop vessels.', 15)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Kitchen', 'kitchen', 'Precision volumetric scoops and functional culinary utensils.', 16)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Stands', 'stands', 'Ergonomic phone docks, multi-device stands, and laptop props.', 17)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Decor', 'decor', 'Sculptural vases, Japandi planters, and wabi-sabi artifacts.', 18)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Desk Setup', 'desk-setup', 'Workspace ergonomics, riser attachments, and wrist rests.', 19)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Trash Bins', 'trash-bins', 'Minimalist desktop bins with swing and magnetic lid closures.', 20)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Wall Mounts', 'wall-mounts', 'Modular interlocking wall tiles and drill-free LED channels.', 21)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Wrist Rests', 'wrist-rests', 'Hex-pattern and contoured wrist supports for mechanical typing.', 22)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Gadgets', 'gadgets', 'Cable strain relief wraps, adapters, and functional daily tools.', 23)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Storage', 'storage', 'Print-in-place hinged boxes, photo vaults, and hardware trays.', 24)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

-- 2. Insert 55 MakerWorld Products
INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-001', 'Charlie Brown AirPods Pro 2nd Gen Case', 'charlie-brown-airpods-pro-2nd-gen-case', 'Charlie Brown-style 3D printed AirPods Pro 2nd gen case, printed to order by KERF 3D in Dhaka, Bangladesh. Message us on WhatsApp for the price.', 'Charlie Brown-style 3D printed AirPods Pro 2nd gen case, printed to order by KERF 3D in Dhaka, Bangladesh. Message us on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 101
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-002', 'Mini Paracord Pulley (608 Bearing) - Skeleton Zero', 'mini-paracord-pulley-608-bearing---skeleton-zero', 'Small 3D printed paracord pulley for 608 bearings, no supports needed. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Small 3D printed paracord pulley for 608 bearings, no supports needed. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 102
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-003', 'Carabiner', 'carabiner', 'Modern, lightweight 3D printed carabiner for everyday carry, keys and bags. Printed to order by KERF 3D in Bangladesh. Message us on WhatsApp for the price.', 'Modern, lightweight 3D printed carabiner for everyday carry, keys and bags. Printed to order by KERF 3D in Bangladesh. Message us on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 103
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-004', 'MOLLE Panel for Peak Design Everyday Backpack 30L', 'molle-panel-for-peak-design-everyday-backpack-30l', '3D printed MOLLE attachment panel for the Peak Design Everyday Backpack 30L. Printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '3D printed MOLLE attachment panel for the Peak Design Everyday Backpack 30L. Printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 104
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-005', 'Sleek Passport Case', 'sleek-passport-case', 'Slim 3D printed passport case, designed for clean, consistent printing. Made to order in Dhaka, Bangladesh by KERF 3D. Message us on WhatsApp for the price.', 'Slim 3D printed passport case, designed for clean, consistent printing. Made to order in Dhaka, Bangladesh by KERF 3D. Message us on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 105
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-006', 'DUO Pen Holder with Removable Tray', 'duo-pen-holder-with-removable-tray', 'DUO desk organizer: 3D printed pen holder with a removable tray for scissors and small tools. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'DUO desk organizer: 3D printed pen holder with a removable tray for scissors and small tools. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 106
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-007', 'Infill Custom Key Caps', 'infill-custom-key-caps', '3D printed custom keycaps with infill-pattern designs, printed face down for a unique look. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', '3D printed custom keycaps with infill-pattern designs, printed face down for a unique look. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 107
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-008', 'Nebula Lamp', 'nebula-lamp', 'Nebula Lamp: soft, rounded 3D printed lamp designed for the Bambu Lab LED kit MH001. Printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Nebula Lamp: soft, rounded 3D printed lamp designed for the Bambu Lab LED kit MH001. Printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 108
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-009', '16-Key Mechanical Keyboard Frame', '16-key-mechanical-keyboard-frame', '3D printed 16-key mechanical keyboard frame with shift and caps-lock size key options. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', '3D printed 16-key mechanical keyboard frame with shift and caps-lock size key options. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 109
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-010', 'Wave Soap Dish', 'wave-soap-dish', 'Modern parametric wave soap dish in 3D printed form for bathroom or kitchen. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern parametric wave soap dish in 3D printed form for bathroom or kitchen. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 110
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-011', 'Creatine Scoop Set (3-10 g)', 'creatine-scoop-set-3-10-g', '3D printed measuring scoop set for 3 to 10 gram doses of creatine and powders. Made to order by KERF 3D in Dhaka. Message us on WhatsApp for the price.', '3D printed measuring scoop set for 3 to 10 gram doses of creatine and powders. Made to order by KERF 3D in Dhaka. Message us on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 111
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-012', 'Laptop Lid Prop - Keep Your Laptop Awake with the Lid Down', 'laptop-lid-prop---keep-your-laptop-awake-with-the-lid-down', 'Customizable 3D printed laptop lid prop that keeps the lid slightly open for 24/7 running. Printed to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable 3D printed laptop lid prop that keeps the lid slightly open for 24/7 running. Printed to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 112
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-013', 'Japandi Fluted Smart Planter with Water Level Indicator', 'japandi-fluted-smart-planter-with-water-level-indicator', 'Minimalist Japandi fluted indoor planter with a water level indicator, 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Japandi fluted indoor planter with a water level indicator, 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 113
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-014', 'The Couch King Desk Setup', 'the-couch-king-desk-setup', 'The Couch King: comfy desk setup accessory inspired by the Couchmaster, 3D printed to order in Dhaka. Message KERF 3D on WhatsApp for the price.', 'The Couch King: comfy desk setup accessory inspired by the Couchmaster, 3D printed to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'desk-setup' LIMIT 1), 'ready_made', 'active', 'desksetup,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 114
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-015', 'One Lamp - Table and Pendant Lamp', 'one-lamp---table-and-pendant-lamp', 'One Lamp: modular 3D printed lamp for table or pendant use, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'One Lamp: modular 3D printed lamp for table or pendant use, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 115
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-016', '20/20 Split Keyboard Case - Handwired, Hotswap, Wireless', '20-20-split-keyboard-case---handwired-hotswap-wireless', '3D printed case for the 20/20 handwired, hot-swap wireless split keyboard with no PCB. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', '3D printed case for the 20/20 handwired, hot-swap wireless split keyboard with no PCB. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 116
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-017', 'Modern Ribbed Cube Lamp - Wireless or Wired RGB', 'modern-ribbed-cube-lamp---wireless-or-wired-rgb', 'Modern ribbed cube lamp with RGB light, wireless or wired. 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern ribbed cube lamp with RGB light, wireless or wired. 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 117
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-018', 'Iskra Numpad - Handwired Low-Profile Case', 'iskra-numpad---handwired-low-profile-case', 'Compact 3D printed case for the Iskra 10-key low-profile handwired numpad with Kailh Choc switches. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', 'Compact 3D printed case for the Iskra 10-key low-profile handwired numpad with Kailh Choc switches. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 118
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-019', 'Desk Bin Trash Can', 'desk-bin-trash-can', 'Stylish 3D printed desk bin that doubles as desk decor. Made to order in Dhaka, Bangladesh by KERF 3D. Message us on WhatsApp for the price.', 'Stylish 3D printed desk bin that doubles as desk decor. Made to order in Dhaka, Bangladesh by KERF 3D. Message us on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'trash-bins' LIMIT 1), 'ready_made', 'active', 'trashbins,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 119
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-020', 'Minimalist Japandi Phone Holder - iPhone Desk Stand', 'minimalist-japandi-phone-holder---iphone-desk-stand', 'Minimalist Japandi 3D printed phone holder and iPhone desk stand. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Japandi 3D printed phone holder and iPhone desk stand. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 120
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-021', 'Modular Wall Panel', 'modular-wall-panel', 'Modular 3D printed wall panels with push-fit connectors that form a pattern when arranged. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modular 3D printed wall panels with push-fit connectors that form a pattern when arranged. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 121
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-022', 'Sputnik Split Keyboard Case - Handwired Corne ZMK', 'sputnik-split-keyboard-case---handwired-corne-zmk', '3D printed case for the Sputnik handwired wireless Corne-style ZMK split keyboard. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '3D printed case for the Sputnik handwired wireless Corne-style ZMK split keyboard. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 122
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-023', 'IKEA FADO 17 cm Lampshade', 'ikea-fado-17-cm-lampshade', '3D printed lampshade for the 17 cm IKEA FADO lamp, made for translucent PLA ambient glow. Printed to order in Dhaka. Message KERF 3D on WhatsApp for the price.', '3D printed lampshade for the 17 cm IKEA FADO lamp, made for translucent PLA ambient glow. Printed to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 123
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-024', 'Custom Wrist Rest Generator', 'custom-wrist-rest-generator', 'Customizable 3D printed wrist rest sized to your hand and desk setup. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable 3D printed wrist rest sized to your hand and desk setup. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wrist-rests' LIMIT 1), 'ready_made', 'active', 'wristrests,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 124
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-025', 'Navais Modular Desk Organiser', 'navais-modular-desk-organiser', 'Navais modular 3D printed desk organiser with a customizable layout for your workspace. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Navais modular 3D printed desk organiser with a customizable layout for your workspace. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 125
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-026', 'Hollow Keycaps - Non-1U Sizes', 'hollow-keycaps---non-1u-sizes', '3D printed hollow keycaps in 1.25U to 2.25U non-1U sizes for mechanical keyboards. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', '3D printed hollow keycaps in 1.25U to 2.25U non-1U sizes for mechanical keyboards. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 126
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-027', 'Sweaty Palms Hex Wrist Rest', 'sweaty-palms-hex-wrist-rest', 'Dynamic hex-pattern 3D printed wrist support that lets your hand move freely. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dynamic hex-pattern 3D printed wrist support that lets your hand move freely. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wrist-rests' LIMIT 1), 'ready_made', 'active', 'wristrests,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 127
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-028', 'TwistShield Cable Protector', 'twistshield-cable-protector', '3D printed spiral cable saver that protects charging cable ends from bending and fraying. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', '3D printed spiral cable saver that protects charging cable ends from bending and fraying. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 128
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-029', 'Modular MacBook Vertical Stand with iPhone Stand', 'modular-macbook-vertical-stand-with-iphone-stand', '3D printed vertical MacBook stand for clamshell mode with a built-in iPhone stand. Saves desk space. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', '3D printed vertical MacBook stand for clamshell mode with a built-in iPhone stand. Saves desk space. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 129
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-030', 'MX Keycap Set - Shine-Through Lettering', 'mx-keycap-set---shine-through-lettering', '3D printed MX keycap set with shine-through lettering for backlit mechanical keyboards. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', '3D printed MX keycap set with shine-through lettering for backlit mechanical keyboards. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 130
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-031', 'Modern Toothbrush Holder', 'modern-toothbrush-holder', 'Elegant 3D printed toothbrush holder that keeps brushes dry and your countertop clean. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Elegant 3D printed toothbrush holder that keeps brushes dry and your countertop clean. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 131
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-032', 'Slim Nano Desk Stand with Light', 'slim-nano-desk-stand-with-light', 'Slim 3D printed desktop stand with light that saves space and keeps your setup tidy. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Slim 3D printed desktop stand with light that saves space and keeps your setup tidy. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 132
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-033', 'Compact Phone Stand - Dual Angle', 'compact-phone-stand---dual-angle', 'Compact, lightweight 3D printed phone stand with two viewing angles. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Compact, lightweight 3D printed phone stand with two viewing angles. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 133
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-034', 'Monolith Photo Box', 'monolith-photo-box', 'Minimalist 3D printed photo box with a print-in-place hinge and magnetic lid for 10x15 cm photos. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', 'Minimalist 3D printed photo box with a print-in-place hinge and magnetic lid for 10x15 cm photos. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 134
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-035', 'QuadDock 4-Phone Horizontal Stand', 'quaddock-4-phone-horizontal-stand', 'QuadDock: 3D printed 4-phone horizontal stand with built-in cable management. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'QuadDock: 3D printed 4-phone horizontal stand with built-in cable management. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 135
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-036', 'Transparent Handbag Vase', 'transparent-handbag-vase', 'Translucent handbag-shaped vase, 3D printed in clear PETG or PLA. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Translucent handbag-shaped vase, 3D printed in clear PETG or PLA. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 136
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-037', 'Minimalistic Phone Stand', 'minimalistic-phone-stand', 'Elegant minimalist 3D printed smartphone stand for desk or nightstand. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Elegant minimalist 3D printed smartphone stand for desk or nightstand. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 137
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-038', 'Easy-Pour Parts Box - Mini Storage Tray with Lid', 'easy-pour-parts-box---mini-storage-tray-with-lid', 'Stackable 3D printed mini storage tray with lid and easy-pour spout for small parts. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stackable 3D printed mini storage tray with lid and easy-pour spout for small parts. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 138
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-039', 'LED Wall Panel Holder - No Drilling', 'led-wall-panel-holder---no-drilling', '3D printed holder that mounts LED strips on wall panels without drilling or glue. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', '3D printed holder that mounts LED strips on wall panels without drilling or glue. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 139
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-040', 'Bauhaus Tray', 'bauhaus-tray', 'Bauhaus-style 3D printed tray for desks, shelves and entryways. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Bauhaus-style 3D printed tray for desks, shelves and entryways. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 140
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-041', 'Modern Dual-Layer Wine Glass Table Lamp', 'modern-dual-layer-wine-glass-table-lamp', 'Modern table lamp with a unique lit stem and Philippe Starck-inspired design, 3D printed to order in Dhaka. Message KERF 3D on WhatsApp for the price.', 'Modern table lamp with a unique lit stem and Philippe Starck-inspired design, 3D printed to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 141
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-042', 'Futuristic Keyboard Hand Rest', 'futuristic-keyboard-hand-rest', 'Futuristic 3D printed keyboard hand rest for comfortable support at your desk. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Futuristic 3D printed keyboard hand rest for comfortable support at your desk. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wrist-rests' LIMIT 1), 'ready_made', 'active', 'wristrests,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 142
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-043', 'Ma Series Wabi-Sabi Ribbed Vases', 'ma-series-wabi-sabi-ribbed-vases', 'Set of four wabi-sabi ribbed vases, 3D printed to order in Dhaka, Bangladesh for modern home decor. Message KERF 3D on WhatsApp for the price.', 'Set of four wabi-sabi ribbed vases, 3D printed to order in Dhaka, Bangladesh for modern home decor. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 143
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-044', 'Wave Vase', 'wave-vase', 'Wave-shaped decorative vase with a sea-wave look, 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wave-shaped decorative vase with a sea-wave look, 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 144
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-045', 'Mini Desktop Trash Bin with Swing Lid', 'mini-desktop-trash-bin-with-swing-lid', 'Compact 3D printed desktop trash bin with a 2-part swing lid. Keeps your workspace clean. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Compact 3D printed desktop trash bin with a 2-part swing lid. Keeps your workspace clean. Made to order in Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'trash-bins' LIMIT 1), 'ready_made', 'active', 'trashbins,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 145
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-046', 'Milk Crate AirPods 4 Case', 'milk-crate-airpods-4-case', 'Milk-crate-style 3D printed AirPods 4 case with a separate lid. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Milk-crate-style 3D printed AirPods 4 case with a separate lid. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 146
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-047', 'Organic Voronoi Pen Holder and Vase', 'organic-voronoi-pen-holder-and-vase', 'Organic Voronoi 3D printed pen holder that also works as a vase. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Voronoi 3D printed pen holder that also works as a vase. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 147
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-048', 'Tilt Stack Stackable Storage Organizer', 'tilt-stack-stackable-storage-organizer', 'Stackable angled 3D printed storage organizer for everyday essentials. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stackable angled 3D printed storage organizer for everyday essentials. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 148
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-049', 'Road Lamp V1', 'road-lamp-v1', 'Road Lamp V1: modern textured 3D printed lamp from the Road Lamp series. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Road Lamp V1: modern textured 3D printed lamp from the Road Lamp series. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 149
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-050', 'Lightweight Square Mesh Bowl (4 Sizes)', 'lightweight-square-mesh-bowl-4-sizes', 'Lightweight square mesh bowl in 4 sizes, 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lightweight square mesh bowl in 4 sizes, 3D printed to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 150
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-051', 'DeskFlow 3-in-1 Desk Organizer', 'deskflow-3-in-1-desk-organizer', 'DeskFlow: minimalist 3-in-1 3D printed desk organizer for a tidy workspace. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'DeskFlow: minimalist 3-in-1 3D printed desk organizer for a tidy workspace. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 151
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-052', 'Organic Pen Holder - Modern Minimal Desk Organizer', 'organic-pen-holder---modern-minimal-desk-organizer', 'Organic lattice-style 3D printed pen holder and minimal desk organizer. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic lattice-style 3D printed pen holder and minimal desk organizer. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 152
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-053', 'Compact Phone Stand - Mini Travel iPhone Stand', 'compact-phone-stand---mini-travel-iphone-stand', 'Mini travel iPhone stand: compact 3D printed phone stand that fits in a pocket. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.', 'Mini travel iPhone stand: compact 3D printed phone stand that fits in a pocket. Made to order in Dhaka. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 153
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-054', 'DIY Wire Mesh Trash Can - Flat Print', 'diy-wire-mesh-trash-can---flat-print', '3D printed wire-mesh style trash can with flat printing and easy assembly. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '3D printed wire-mesh style trash can with flat printing and easy assembly. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'trash-bins' LIMIT 1), 'ready_made', 'active', 'trashbins,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 154
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-055', 'Pencil and Pen Holder', 'pencil-and-pen-holder', 'Simple 3D printed pencil and pen holder for your desk. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Simple 3D printed pencil and pen holder for your desk. Made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 155
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

