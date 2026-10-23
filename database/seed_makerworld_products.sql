-- ============================================================
-- Kerf 3D Studio — 419 MakerWorld Products Seed Script
-- ============================================================

USE `kerf3d`;

-- 1. Insert Categories
INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Clocks', 'clocks', 'Parametric, geometric, and motorized 3D printed desktop and wall timepieces.', 11)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Organizers', 'organizers', 'Desktop caddies, pen holders, and modular workstation dividers.', 12)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('QR & Custom', 'qr-custom', 'Tactile scannable QR display stands and custom personalized signs.', 13)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Fans & Cooling', 'fans-cooling', 'Blower cowls, turbine fan ducts, and cooling accessories.', 14)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Carry Gear', 'carry-gear', 'Everyday carry cases, carabiners, and modular EDC attachments.', 15)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Lamps', 'lamps', 'Parametric ambient lighting, diffusers, and pendant lamp shades.', 16)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Decor', 'decor', 'Sculptural vases, Japandi planters, and wabi-sabi artifacts.', 17)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Cables', 'cables', 'Friction-fit cable docks, strain reliefs, and channel guides.', 18)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Stands', 'stands', 'Ergonomic phone docks, multi-device stands, and laptop props.', 19)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Wall Mounts', 'wall-mounts', 'Modular interlocking wall tiles and drill-free LED channels.', 20)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Bathroom', 'bathroom', 'Water-draining soap trays and architectural countertop vessels.', 21)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Toys & Figures', 'toys-figures', 'Print-in-place articulated figures, fidgets, and kinetic models.', 22)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Storage', 'storage', 'Print-in-place hinged boxes, photo vaults, and hardware trays.', 23)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Tools & Clips', 'tools-clips', 'Workshop calipers, clamp blocks, and mechanical retention clips.', 24)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Gadgets', 'gadgets', 'Cable strain relief wraps, adapters, and functional daily tools.', 25)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Keyboards', 'keyboards', 'Ergonomic cases, custom keycaps, and mechanical numpad enclosures.', 26)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Kitchen', 'kitchen', 'Precision volumetric scoops and functional culinary utensils.', 27)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Pegboards', 'pegboards', 'Modular Skadis and pegboard tool holders and storage bins.', 28)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Trash Bins', 'trash-bins', 'Minimalist desktop bins with swing and magnetic lid closures.', 29)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Phone Cases', 'phone-cases', 'Bespoke textured smartphone bumpers and clamshell cases.', 30)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Wrist Rests', 'wrist-rests', 'Hex-pattern and contoured wrist supports for mechanical typing.', 31)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Home Hardware', 'home-hardware', 'Handles, hooks, stops, and functional architectural hardware.', 32)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

INSERT INTO `categories` (`name`, `slug`, `description`, `sort_order`)
VALUES ('Desk Setup', 'desk-setup', 'Workspace ergonomics, riser attachments, and tactile accessories.', 33)
ON DUPLICATE KEY UPDATE `description` = VALUES(`description`);

-- 2. Insert 419 MakerWorld Products
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

INSERT INTO `products` (
    `sku`, `name`, `slug`, `short_description`, `description`,
    `category_id`, `catalog_type`, `status`, `tags`,
    `price_bdt`, `layer_height_mm`, `infill_percent`, `build_volume_fit`,
    `creator`, `license`, `attribution_text`, `sort_order`
) VALUES (
    'K3D-MW-056', 'Spiral Vase Pen Holder | Ribbed Texture | Fast Print', 'spiral-vase-pen-holder-ribbed-texture-fast-print', 'Spiral Vase Pen Holder | Ribbed Texture | Fast Print: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Spiral Vase Pen Holder | Ribbed Texture | Fast Print: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 156
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
    'K3D-MW-057', 'Vortex Pen Holder | Twisted Texture', 'vortex-pen-holder-twisted-texture', 'Vortex Pen Holder | Twisted Texture: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Vortex Pen Holder | Twisted Texture: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 157
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
    'K3D-MW-058', 'Celtic Mesh Pencil Holder | Elegant Office Organizer', 'celtic-mesh-pencil-holder-elegant-office-organizer', 'Celtic Mesh Pencil Holder | Elegant Office Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Celtic Mesh Pencil Holder | Elegant Office Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 158
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
    'K3D-MW-059', 'Lightweight Mesh Pencil Holder', 'lightweight-mesh-pencil-holder', 'Lightweight Mesh Pencil Holder: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lightweight Mesh Pencil Holder: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 159
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
    'K3D-MW-060', 'Switch Clock Small - Clock with Switchable Panels', 'switch-clock-small---clock-with-switchable-panels', 'Switch Clock Small - Clock with Switchable Panels: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Switch Clock Small - Clock with Switchable Panels: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 160
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
    'K3D-MW-061', 'Mesh Lamp 1.0', 'mesh-lamp-1-0', 'Mesh Lamp 1.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Lamp 1.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 161
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
    'K3D-MW-062', 'Diamond Bowl', 'diamond-bowl', 'Diamond Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Diamond Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 162
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
    'K3D-MW-063', 'Ergonomic Armrest for Office Desk', 'ergonomic-armrest-for-office-desk', 'Ergonomic Armrest for Office Desk: 3D printed ergonomic rest, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Ergonomic Armrest for Office Desk: 3D printed ergonomic rest, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wrist-rests' LIMIT 1), 'ready_made', 'active', 'wristrests,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 163
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
    'K3D-MW-064', 'Mesh Basket', 'mesh-basket', 'Mesh Basket: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Basket: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 164
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
    'K3D-MW-065', 'Lattice Lamp', 'lattice-lamp', 'Lattice Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lattice Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 165
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
    'K3D-MW-066', 'Organic Ripple Lamp', 'organic-ripple-lamp', 'Organic Ripple Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Ripple Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 166
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
    'K3D-MW-067', 'Mesh Lamp 2.0', 'mesh-lamp-2-0', 'Mesh Lamp 2.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Lamp 2.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 167
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
    'K3D-MW-068', 'Organic Ripple Lamp 2.0', 'organic-ripple-lamp-2-0', 'Organic Ripple Lamp 2.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Ripple Lamp 2.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 168
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
    'K3D-MW-069', 'Lattice Bowl', 'lattice-bowl', 'Lattice Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lattice Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 169
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
    'K3D-MW-070', 'Minimalistic Table Lamp - Modern & Elegant Light', 'minimalistic-table-lamp---modern-elegant-light', 'Minimalistic Table Lamp - Modern & Elegant Light: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalistic Table Lamp - Modern & Elegant Light: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 170
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
    'K3D-MW-071', 'Phone Stand - Compact', 'phone-stand---compact', 'Phone Stand - Compact: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Phone Stand - Compact: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 171
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
    'K3D-MW-072', 'Mesh Lamp 3.0', 'mesh-lamp-3-0', 'Mesh Lamp 3.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Lamp 3.0: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 172
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
    'K3D-MW-073', 'Blackout Blinds Light Blocking Channels', 'blackout-blinds-light-blocking-channels', 'Blackout Blinds Light Blocking Channels: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Blackout Blinds Light Blocking Channels: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'home-hardware' LIMIT 1), 'ready_made', 'active', 'homehardware,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 173
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
    'K3D-MW-074', 'Dual-color furniture handle / drawer handle', 'dual-color-furniture-handle-drawer-handle', 'Dual-color furniture handle / drawer handle: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dual-color furniture handle / drawer handle: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 174
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
    'K3D-MW-075', 'Pipe bracket for shelf', 'pipe-bracket-for-shelf', 'Pipe bracket for shelf: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Pipe bracket for shelf: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 175
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
    'K3D-MW-076', 'Rice Washing Bowl', 'rice-washing-bowl', 'Rice Washing Bowl: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Rice Washing Bowl: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 176
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
    'K3D-MW-077', 'Toothpaste Squeezer | Cream Tube Squeezer', 'toothpaste-squeezer-cream-tube-squeezer', 'Toothpaste Squeezer | Cream Tube Squeezer: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Toothpaste Squeezer | Cream Tube Squeezer: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 177
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
    'K3D-MW-078', 'Organic Mesh Fruit & Vegetable Bowl - 3 sizes', 'organic-mesh-fruit-vegetable-bowl---3-sizes', 'Organic Mesh Fruit & Vegetable Bowl - 3 sizes: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Mesh Fruit & Vegetable Bowl - 3 sizes: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 178
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
    'K3D-MW-079', 'Customizable QR Code Sign (NFC & Frame Option)', 'customizable-qr-code-sign-nfc-frame-option', 'Customizable QR Code Sign (NFC & Frame Option): 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable QR Code Sign (NFC & Frame Option): 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 179
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
    'K3D-MW-080', 'ID Card Holder - Open, Closed, Hex, Clean & AirTag', 'id-card-holder---open-closed-hex-clean-airtag', 'ID Card Holder - Open, Closed, Hex, Clean & AirTag: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'ID Card Holder - Open, Closed, Hex, Clean & AirTag: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 180
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
    'K3D-MW-081', 'Office Status Desk Sign', 'office-status-desk-sign', 'Office Status Desk Sign: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Office Status Desk Sign: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 181
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
    'K3D-MW-082', 'Heavy-Duty Hinge Workbench Hinge Angle', 'heavy-duty-hinge-workbench-hinge-angle', 'Heavy-Duty Hinge Workbench Hinge Angle: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Heavy-Duty Hinge Workbench Hinge Angle: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 182
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
    'K3D-MW-083', 'Folding Hand Fan with Japanese wave pattern', 'folding-hand-fan-with-japanese-wave-pattern', 'Folding Hand Fan with Japanese wave pattern: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Folding Hand Fan with Japanese wave pattern: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 183
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
    'K3D-MW-084', 'Towel Hanger - 8 Patterns, Pressure Lock', 'towel-hanger---8-patterns-pressure-lock', 'Towel Hanger - 8 Patterns, Pressure Lock: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Towel Hanger - 8 Patterns, Pressure Lock: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 184
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
    'K3D-MW-085', 'Bag clip', 'bag-clip', 'Bag clip: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Bag clip: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 185
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
    'K3D-MW-086', 'Retro 80s theme clay cutter', 'retro-80s-theme-clay-cutter', 'Retro 80s theme clay cutter: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Retro 80s theme clay cutter: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 186
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
    'K3D-MW-087', 'Full bottle watering spout (print in place)', 'full-bottle-watering-spout-print-in-place', 'Full bottle watering spout (print in place): 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Full bottle watering spout (print in place): 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 187
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
    'K3D-MW-088', 'Wood Grain Bottom - iPhone 13 Case', 'wood-grain-bottom---iphone-13-case', 'Wood Grain Bottom - iPhone 13 Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wood Grain Bottom - iPhone 13 Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'phone-cases' LIMIT 1), 'ready_made', 'active', 'phonecases,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 188
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
    'K3D-MW-089', 'Honeycomb Paper Towel Holder', 'honeycomb-paper-towel-holder', 'Honeycomb Paper Towel Holder: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Honeycomb Paper Towel Holder: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 189
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
    'K3D-MW-090', 'Heavy duty wall bracket', 'heavy-duty-wall-bracket', 'Heavy duty wall bracket: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Heavy duty wall bracket: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 190
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
    'K3D-MW-091', 'Large Trash Can with Lid (A1 mini compatible)', 'large-trash-can-with-lid-a1-mini-compatible', 'Large Trash Can with Lid (A1 mini compatible): 3D printed trash bin, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Large Trash Can with Lid (A1 mini compatible): 3D printed trash bin, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'trash-bins' LIMIT 1), 'ready_made', 'active', 'trashbins,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 191
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
    'K3D-MW-092', 'Modern Minimalist Geometric Soap Dish - 4 Patterns', 'modern-minimalist-geometric-soap-dish---4-patterns', 'Modern Minimalist Geometric Soap Dish - 4 Patterns: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Minimalist Geometric Soap Dish - 4 Patterns: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 192
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
    'K3D-MW-093', 'Portal Sentry Turret', 'portal-sentry-turret', 'Portal Sentry Turret: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Portal Sentry Turret: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 193
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
    'K3D-MW-094', 'IPhone 15 Voronoi Case', 'iphone-15-voronoi-case', 'IPhone 15 Voronoi Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'IPhone 15 Voronoi Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'phone-cases' LIMIT 1), 'ready_made', 'active', 'phonecases,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 194
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
    'K3D-MW-095', 'GLAdOs - Shelf Buddy', 'glados---shelf-buddy', 'GLAdOs - Shelf Buddy: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'GLAdOs - Shelf Buddy: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 195
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
    'K3D-MW-096', 'Wavy Bloom Vessel / Dish / Plate / Tray / Bowl', 'wavy-bloom-vessel-dish-plate-tray-bowl', 'Wavy Bloom Vessel / Dish / Plate / Tray / Bowl: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wavy Bloom Vessel / Dish / Plate / Tray / Bowl: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 196
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
    'K3D-MW-097', 'Geometric Object Tray with Edges V2', 'geometric-object-tray-with-edges-v2', 'Geometric Object Tray with Edges V2: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Geometric Object Tray with Edges V2: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 197
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
    'K3D-MW-098', 'Desk Clamp LED Lamp Kit-001', 'desk-clamp-led-lamp-kit-001', 'Desk Clamp LED Lamp Kit-001: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desk Clamp LED Lamp Kit-001: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 198
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
    'K3D-MW-099', 'Organic Shelf Brackets', 'organic-shelf-brackets', 'Organic Shelf Brackets: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Shelf Brackets: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 199
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
    'K3D-MW-100', 'Zelda\'s Ocarina', 'zelda-s-ocarina', 'Zelda\'s Ocarina: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Zelda\'s Ocarina: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 200
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
    'K3D-MW-101', 'Iphone 15 PRO / PRO MAX camera dust cover', 'iphone-15-pro-pro-max-camera-dust-cover', 'Iphone 15 PRO / PRO MAX camera dust cover: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Iphone 15 PRO / PRO MAX camera dust cover: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'phone-cases' LIMIT 1), 'ready_made', 'active', 'phonecases,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 201
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
    'K3D-MW-102', 'Soap Holder', 'soap-holder', 'Soap Holder: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Holder: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 202
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
    'K3D-MW-103', 'One-handed Desk Lamp', 'one-handed-desk-lamp', 'One-handed Desk Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'One-handed Desk Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 203
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
    'K3D-MW-104', 'Geometric Catchall Tray – Easy Print', 'geometric-catchall-tray-easy-print', 'Geometric Catchall Tray – Easy Print: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Geometric Catchall Tray – Easy Print: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 204
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
    'K3D-MW-105', 'A simple soap dish (Minimalist Soap Dish)', 'a-simple-soap-dish-minimalist-soap-dish', 'A simple soap dish (Minimalist Soap Dish): 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'A simple soap dish (Minimalist Soap Dish): 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 205
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
    'K3D-MW-106', 'Medium Topology Optimized Shelf Bracket', 'medium-topology-optimized-shelf-bracket', 'Medium Topology Optimized Shelf Bracket: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Medium Topology Optimized Shelf Bracket: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 206
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
    'K3D-MW-107', 'Death Stranding Improved Battery Desk Lamp', 'death-stranding-improved-battery-desk-lamp', 'Death Stranding Improved Battery Desk Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Death Stranding Improved Battery Desk Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 207
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
    'K3D-MW-108', 'Robotics LED lamp', 'robotics-led-lamp', 'Robotics LED lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Robotics LED lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 208
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
    'K3D-MW-109', 'LED spot und WLED animation upgrade', 'led-spot-und-wled-animation-upgrade', 'LED spot und WLED animation upgrade: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'LED spot und WLED animation upgrade: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 209
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
    'K3D-MW-110', 'Adjustable Desk lamp GU10 spotlights LED.', 'adjustable-desk-lamp-gu10-spotlights-led', 'Adjustable Desk lamp GU10 spotlights LED.: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Adjustable Desk lamp GU10 spotlights LED.: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 210
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
    'K3D-MW-111', 'Corner bracket for 3/4 inch plywood', 'corner-bracket-for-3-4-inch-plywood', 'Corner bracket for 3/4 inch plywood: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Corner bracket for 3/4 inch plywood: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 211
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
    'K3D-MW-112', 'Minimal Shelf Bracket - Strong, Lightweight & Modern', 'minimal-shelf-bracket---strong-lightweight-modern', 'Minimal Shelf Bracket - Strong, Lightweight & Modern: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimal Shelf Bracket - Strong, Lightweight & Modern: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 212
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
    'K3D-MW-113', 'Height Pods - Sculpted Desktop Shelf Legs 48-180mm', 'height-pods---sculpted-desktop-shelf-legs-48-180mm', 'Height Pods - Sculpted Desktop Shelf Legs 48-180mm: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Height Pods - Sculpted Desktop Shelf Legs 48-180mm: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 213
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
    'K3D-MW-114', 'ESP32 Plane Radar - Live ADS-B on a Round Display', 'esp32-plane-radar---live-ads-b-on-a-round-display', 'ESP32 Plane Radar - Live ADS-B on a Round Display: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'ESP32 Plane Radar - Live ADS-B on a Round Display: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 214
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
    'K3D-MW-115', 'Soap Dish Collection with Removable Inserts', 'soap-dish-collection-with-removable-inserts', 'Soap Dish Collection with Removable Inserts: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Dish Collection with Removable Inserts: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 215
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
    'K3D-MW-116', 'QR Code Visit Card, NFC Tag / Logo Customizable', 'qr-code-visit-card-nfc-tag-logo-customizable', 'QR Code Visit Card, NFC Tag / Logo Customizable: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'QR Code Visit Card, NFC Tag / Logo Customizable: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 216
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
    'K3D-MW-117', 'Lamp With Modern Aesthetic', 'lamp-with-modern-aesthetic', 'Lamp With Modern Aesthetic: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lamp With Modern Aesthetic: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 217
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
    'K3D-MW-118', 'Soap dish (always dry soap)', 'soap-dish-always-dry-soap', 'Soap dish (always dry soap): 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap dish (always dry soap): 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 218
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
    'K3D-MW-119', 'Burrow Desk Organiser / Organizer', 'burrow-desk-organiser-organizer', 'Burrow Desk Organiser / Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Burrow Desk Organiser / Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 219
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
    'K3D-MW-120', 'Aesthetic Translucent Paper Bag Vase', 'aesthetic-translucent-paper-bag-vase', 'Aesthetic Translucent Paper Bag Vase: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Aesthetic Translucent Paper Bag Vase: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 220
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
    'K3D-MW-121', 'Ultra Slim iPhone 15 Pro Case', 'ultra-slim-iphone-15-pro-case', 'Ultra Slim iPhone 15 Pro Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Ultra Slim iPhone 15 Pro Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'phone-cases' LIMIT 1), 'ready_made', 'active', 'phonecases,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 221
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
    'K3D-MW-122', 'KOVA Modular Stackable Storage Box - Minimal Ribbed', 'kova-modular-stackable-storage-box---minimal-ribbed', 'KOVA Modular Stackable Storage Box - Minimal Ribbed: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'KOVA Modular Stackable Storage Box - Minimal Ribbed: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 222
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
    'K3D-MW-123', 'Lattice Stool', 'lattice-stool', 'Lattice Stool: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lattice Stool: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 223
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
    'K3D-MW-124', 'Hollow Storage Box with Lid (250mm)', 'hollow-storage-box-with-lid-250mm', 'Hollow Storage Box with Lid (250mm): 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Hollow Storage Box with Lid (250mm): 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 224
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
    'K3D-MW-125', 'Glass Block Lamp', 'glass-block-lamp', 'Glass Block Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Glass Block Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 225
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
    'K3D-MW-126', 'Transparent Plastic Bag Vase', 'transparent-plastic-bag-vase', 'Transparent Plastic Bag Vase: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Transparent Plastic Bag Vase: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 226
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
    'K3D-MW-127', 'Modern Ribbed Lamp with Inner Coloured Diffuser', 'modern-ribbed-lamp-with-inner-coloured-diffuser', 'Modern Ribbed Lamp with Inner Coloured Diffuser: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Ribbed Lamp with Inner Coloured Diffuser: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 227
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
    'K3D-MW-128', 'Mesh Bowl 2.0', 'mesh-bowl-2-0', 'Mesh Bowl 2.0: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Bowl 2.0: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 228
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
    'K3D-MW-129', 'Kraftique - Paper Reborn, Purpose Refined', 'kraftique---paper-reborn-purpose-refined', 'Kraftique - Paper Reborn, Purpose Refined: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Kraftique - Paper Reborn, Purpose Refined: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 229
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
    'K3D-MW-130', 'Modern Napkin Holder with Organic Design', 'modern-napkin-holder-with-organic-design', 'Modern Napkin Holder with Organic Design: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Napkin Holder with Organic Design: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 230
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
    'K3D-MW-131', 'Transparent Paper Bag Vase (Leak-Proof)', 'transparent-paper-bag-vase-leak-proof', 'Transparent Paper Bag Vase (Leak-Proof): 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Transparent Paper Bag Vase (Leak-Proof): 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 231
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
    'K3D-MW-132', 'Filté | Modern Catch All / Centerpiece / Bowl', 'filt-modern-catch-all-centerpiece-bowl', 'Filté | Modern Catch All / Centerpiece / Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Filté | Modern Catch All / Centerpiece / Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 232
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
    'K3D-MW-133', 'Mesh Bowl (Free Commercial License)', 'mesh-bowl-free-commercial-license', 'Mesh Bowl (Free Commercial License): 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Bowl (Free Commercial License): 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 233
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
    'K3D-MW-134', 'Spiral Lattice Bowl | Modern Centerpiece | 220mm', 'spiral-lattice-bowl-modern-centerpiece-220mm', 'Spiral Lattice Bowl | Modern Centerpiece | 220mm: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Spiral Lattice Bowl | Modern Centerpiece | 220mm: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 234
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
    'K3D-MW-135', 'Coral Catch All Bowl - Organically Grown Design', 'coral-catch-all-bowl---organically-grown-design', 'Coral Catch All Bowl - Organically Grown Design: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Coral Catch All Bowl - Organically Grown Design: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 235
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
    'K3D-MW-136', 'QR Generator', 'qr-generator', 'QR Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'QR Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 236
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
    'K3D-MW-137', 'Custom QR Shape Generator', 'custom-qr-shape-generator', 'Custom QR Shape Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Custom QR Shape Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 237
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
    'K3D-MW-138', 'Customizable QR Code V3.1', 'customizable-qr-code-v3-1', 'Customizable QR Code V3.1: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable QR Code V3.1: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 238
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
    'K3D-MW-139', 'Wavy Paper Tissue Box', 'wavy-paper-tissue-box', 'Wavy Paper Tissue Box: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wavy Paper Tissue Box: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 239
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
    'K3D-MW-140', 'Soap Tray - With Optional Drip Tray', 'soap-tray---with-optional-drip-tray', 'Soap Tray - With Optional Drip Tray: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Tray - With Optional Drip Tray: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 240
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
    'K3D-MW-141', 'Cable Organizer - One-Sided Winding', 'cable-organizer---one-sided-winding', 'Cable Organizer - One-Sided Winding: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Organizer - One-Sided Winding: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 241
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
    'K3D-MW-142', 'Instagram QR Code Keychain Generator', 'instagram-qr-code-keychain-generator', 'Instagram QR Code Keychain Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Instagram QR Code Keychain Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 242
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
    'K3D-MW-143', 'Soap Dish', 'soap-dish', 'Soap Dish: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Dish: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 243
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
    'K3D-MW-144', 'Self-watering pot with capillary system', 'self-watering-pot-with-capillary-system', 'Self-watering pot with capillary system: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Self-watering pot with capillary system: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 244
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
    'K3D-MW-145', 'Stylish Nut Bowl', 'stylish-nut-bowl', 'Stylish Nut Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stylish Nut Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 245
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
    'K3D-MW-146', 'Flashing adapter for ESP-01F', 'flashing-adapter-for-esp-01f', 'Flashing adapter for ESP-01F: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Flashing adapter for ESP-01F: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 246
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
    'K3D-MW-147', 'Automatic window tilter for Home Assistant', 'automatic-window-tilter-for-home-assistant', 'Automatic window tilter for Home Assistant: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Automatic window tilter for Home Assistant: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'home-hardware' LIMIT 1), 'ready_made', 'active', 'homehardware,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 247
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
    'K3D-MW-148', 'Soap Dish / Sponge Holder - Leaf Collection #4', 'soap-dish-sponge-holder---leaf-collection-4', 'Soap Dish / Sponge Holder - Leaf Collection #4: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Dish / Sponge Holder - Leaf Collection #4: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 248
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
    'K3D-MW-149', 'EDC Cable Winder', 'edc-cable-winder', 'EDC Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'EDC Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 249
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
    'K3D-MW-150', 'Compact Cable Reel Set for 0.5m-2m Cables', 'compact-cable-reel-set-for-0-5m-2m-cables', 'Compact Cable Reel Set for 0.5m-2m Cables: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Compact Cable Reel Set for 0.5m-2m Cables: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 250
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
    'K3D-MW-151', 'Easy Cable Winder', 'easy-cable-winder', 'Easy Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Easy Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 251
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
    'K3D-MW-152', 'Fast Funnel with Air outlet', 'fast-funnel-with-air-outlet', 'Fast Funnel with Air outlet: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Fast Funnel with Air outlet: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 252
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
    'K3D-MW-153', 'Door Stopper', 'door-stopper', 'Door Stopper: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Door Stopper: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'home-hardware' LIMIT 1), 'ready_made', 'active', 'homehardware,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 253
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
    'K3D-MW-154', 'WiFi QR-Code stand up', 'wifi-qr-code-stand-up', 'WiFi QR-Code stand up: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'WiFi QR-Code stand up: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 254
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
    'K3D-MW-155', 'Onami Headphone Stand', 'onami-headphone-stand', 'Onami Headphone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Onami Headphone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 255
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
    'K3D-MW-156', 'Customizable Pix Sign \"BRAZIL\" with Logo and QR Code', 'customizable-pix-sign-brazil-with-logo-and-qr-code', 'Customizable Pix Sign \"BRAZIL\" with Logo and QR Code: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable Pix Sign \"BRAZIL\" with Logo and QR Code: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 256
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
    'K3D-MW-157', 'UltraLock Zip Ties - 3D Print Optimized', 'ultralock-zip-ties---3d-print-optimized', 'UltraLock Zip Ties - 3D Print Optimized: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'UltraLock Zip Ties - 3D Print Optimized: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 257
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
    'K3D-MW-158', 'Cable Organizer Box / Cable Winder', 'cable-organizer-box-cable-winder', 'Cable Organizer Box / Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Organizer Box / Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 258
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
    'K3D-MW-159', 'AEVUM - The Perpetual Calendar', 'aevum---the-perpetual-calendar', 'AEVUM - The Perpetual Calendar: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AEVUM - The Perpetual Calendar: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 259
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
    'K3D-MW-160', 'QR Code Keychain Generator', 'qr-code-keychain-generator', 'QR Code Keychain Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'QR Code Keychain Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 260
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
    'K3D-MW-161', 'Oval Soap Dish + 4 Dish Insert', 'oval-soap-dish-4-dish-insert', 'Oval Soap Dish + 4 Dish Insert: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Oval Soap Dish + 4 Dish Insert: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 261
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
    'K3D-MW-162', 'Customizable Parametric QR Code Generator', 'customizable-parametric-qr-code-generator', 'Customizable Parametric QR Code Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable Parametric QR Code Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 262
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
    'K3D-MW-163', 'Turbo Cable Organizer - Fast winding', 'turbo-cable-organizer---fast-winding', 'Turbo Cable Organizer - Fast winding: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Turbo Cable Organizer - Fast winding: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 263
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
    'K3D-MW-164', 'TRAC Cable Management - TRAC D (1m)', 'trac-cable-management---trac-d-1m', 'TRAC Cable Management - TRAC D (1m): 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'TRAC Cable Management - TRAC D (1m): 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 264
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
    'K3D-MW-165', 'Generative Headphone Stand', 'generative-headphone-stand', 'Generative Headphone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Generative Headphone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 265
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
    'K3D-MW-166', 'Propagation Vase | PV03', 'propagation-vase-pv03', 'Propagation Vase | PV03: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Propagation Vase | PV03: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 266
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
    'K3D-MW-167', 'Sticky Bubblegum Headphone Stand', 'sticky-bubblegum-headphone-stand', 'Sticky Bubblegum Headphone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Sticky Bubblegum Headphone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 267
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
    'K3D-MW-168', 'Flicket - Do Tricks!', 'flicket---do-tricks', 'Flicket - Do Tricks!: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Flicket - Do Tricks!: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 268
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
    'K3D-MW-169', 'New-Generation USB Cable Winder (Low Resistance)', 'new-generation-usb-cable-winder-low-resistance', 'New-Generation USB Cable Winder (Low Resistance): 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'New-Generation USB Cable Winder (Low Resistance): 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 269
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
    'K3D-MW-170', 'Press-to-Seal Bag Clip | Food Sealing Clip', 'press-to-seal-bag-clip-food-sealing-clip', 'Press-to-Seal Bag Clip | Food Sealing Clip: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Press-to-Seal Bag Clip | Food Sealing Clip: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 270
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
    'K3D-MW-171', 'Retractable Cable Organizer - With Stop', 'retractable-cable-organizer---with-stop', 'Retractable Cable Organizer - With Stop: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Retractable Cable Organizer - With Stop: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 271
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
    'K3D-MW-172', 'Customizable Two-Sided Keychain | QR, Text & Logo', 'customizable-two-sided-keychain-qr-text-logo', 'Customizable Two-Sided Keychain | QR, Text & Logo: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable Two-Sided Keychain | QR, Text & Logo: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 272
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
    'K3D-MW-173', 'QR Code Generator', 'qr-code-generator', 'QR Code Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'QR Code Generator: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 273
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
    'K3D-MW-174', 'Cable Organizer - Cable Winder', 'cable-organizer---cable-winder', 'Cable Organizer - Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Organizer - Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 274
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
    'K3D-MW-175', 'Customizable QR code with stand', 'customizable-qr-code-with-stand', 'Customizable QR code with stand: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable QR code with stand: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 275
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
    'K3D-MW-176', 'Aqua Pen - Water Prank Pen', 'aqua-pen---water-prank-pen', 'Aqua Pen - Water Prank Pen: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Aqua Pen - Water Prank Pen: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 276
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
    'K3D-MW-177', 'Foldable Stand + Card Holder for CMF Phone 2 Pro/1', 'foldable-stand-card-holder-for-cmf-phone-2-pro-1', 'Foldable Stand + Card Holder for CMF Phone 2 Pro/1: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Foldable Stand + Card Holder for CMF Phone 2 Pro/1: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 277
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
    'K3D-MW-178', 'Soldering Tool Holder with Flexible Helping Hands', 'soldering-tool-holder-with-flexible-helping-hands', 'Soldering Tool Holder with Flexible Helping Hands: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soldering Tool Holder with Flexible Helping Hands: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 278
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
    'K3D-MW-179', 'Double Cigarette Adapter', 'double-cigarette-adapter', 'Double Cigarette Adapter: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Double Cigarette Adapter: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 279
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
    'K3D-MW-180', 'The Last Clip - Clip for Bags and Other Stuff', 'the-last-clip---clip-for-bags-and-other-stuff', 'The Last Clip - Clip for Bags and Other Stuff: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'The Last Clip - Clip for Bags and Other Stuff: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 280
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
    'K3D-MW-181', 'Design Trophy - Award', 'design-trophy---award', 'Design Trophy - Award: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Design Trophy - Award: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 281
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
    'K3D-MW-182', 'Micro Status Light for Home Assistant', 'micro-status-light-for-home-assistant', 'Micro Status Light for Home Assistant: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Micro Status Light for Home Assistant: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 282
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
    'K3D-MW-183', 'Draining Bathroom Soap Dish for Sink', 'draining-bathroom-soap-dish-for-sink', 'Draining Bathroom Soap Dish for Sink: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Draining Bathroom Soap Dish for Sink: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 283
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
    'K3D-MW-184', 'Minimalist Fidget slider', 'minimalist-fidget-slider', 'Minimalist Fidget slider: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Fidget slider: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 284
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
    'K3D-MW-185', '120mm Fan BentoBox', '120mm-fan-bentobox', '120mm Fan BentoBox: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '120mm Fan BentoBox: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 285
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
    'K3D-MW-186', 'Pocket Flip Phone Stand Keychain', 'pocket-flip-phone-stand-keychain', 'Pocket Flip Phone Stand Keychain: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Pocket Flip Phone Stand Keychain: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 286
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
    'K3D-MW-187', 'Customizable Desk Skadis Board (Parametric)', 'customizable-desk-skadis-board-parametric', 'Customizable Desk Skadis Board (Parametric): 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable Desk Skadis Board (Parametric): 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 287
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
    'K3D-MW-188', 'Musical Note Paperclips & Bookmark', 'musical-note-paperclips-bookmark', 'Musical Note Paperclips & Bookmark: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Musical Note Paperclips & Bookmark: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 288
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
    'K3D-MW-189', 'Organic Headphones Stand - No Supports', 'organic-headphones-stand---no-supports', 'Organic Headphones Stand - No Supports: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Headphones Stand - No Supports: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 289
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
    'K3D-MW-190', 'UEFA Champions League trophy', 'uefa-champions-league-trophy', 'UEFA Champions League trophy: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'UEFA Champions League trophy: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 290
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
    'K3D-MW-191', 'Minimalist Multicolor Frame for a 140mm Case Fan', 'minimalist-multicolor-frame-for-a-140mm-case-fan', 'Minimalist Multicolor Frame for a 140mm Case Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Multicolor Frame for a 140mm Case Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 291
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
    'K3D-MW-192', 'PC Fan Modular Air Duct 40 60 80 92 120 140', 'pc-fan-modular-air-duct-40-60-80-92-120-140', 'PC Fan Modular Air Duct 40 60 80 92 120 140: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'PC Fan Modular Air Duct 40 60 80 92 120 140: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 292
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
    'K3D-MW-193', '80/92/120/140mm Fan Dust Filter', '80-92-120-140mm-fan-dust-filter', '80/92/120/140mm Fan Dust Filter: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '80/92/120/140mm Fan Dust Filter: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 293
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
    'K3D-MW-194', 'Dust filter mesh 140×140mm', 'dust-filter-mesh-140-140mm', 'Dust filter mesh 140×140mm: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dust filter mesh 140×140mm: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 294
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
    'K3D-MW-195', 'NZXT H1 V1 Back Fan Mod', 'nzxt-h1-v1-back-fan-mod', 'NZXT H1 V1 Back Fan Mod: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'NZXT H1 V1 Back Fan Mod: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 295
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
    'K3D-MW-196', 'Modular 140mm Fan Enclosure System', 'modular-140mm-fan-enclosure-system', 'Modular 140mm Fan Enclosure System: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modular 140mm Fan Enclosure System: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 296
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
    'K3D-MW-197', 'Steam Controller + Puck Mount', 'steam-controller-puck-mount', 'Steam Controller + Puck Mount: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Steam Controller + Puck Mount: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 297
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
    'K3D-MW-198', 'Steam Controller + Puck Mount for Skadis', 'steam-controller-puck-mount-for-skadis', 'Steam Controller + Puck Mount for Skadis: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Steam Controller + Puck Mount for Skadis: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 298
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
    'K3D-MW-199', 'DIY Desktop Speakers (Logitech Z333/Dayton PS95-8)', 'diy-desktop-speakers-logitech-z333-dayton-ps95-8', 'DIY Desktop Speakers (Logitech Z333/Dayton PS95-8): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'DIY Desktop Speakers (Logitech Z333/Dayton PS95-8): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 299
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
    'K3D-MW-200', 'Customizable Keycaps', 'customizable-keycaps', 'Customizable Keycaps: 3D printed keyboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Customizable Keycaps: 3D printed keyboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'keyboards' LIMIT 1), 'ready_made', 'active', 'keyboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 300
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
    'K3D-MW-201', 'Apple Watch 10 Phone-Style Case', 'apple-watch-10-phone-style-case', 'Apple Watch 10 Phone-Style Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Apple Watch 10 Phone-Style Case: 3D printed phone case, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'phone-cases' LIMIT 1), 'ready_made', 'active', 'phonecases,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 301
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
    'K3D-MW-202', 'Soap Holder', 'soap-holder-2', 'Soap Holder: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Holder: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 302
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
    'K3D-MW-203', 'Stackable Large Square Storage Basket', 'stackable-large-square-storage-basket', 'Stackable Large Square Storage Basket: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stackable Large Square Storage Basket: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 303
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
    'K3D-MW-204', 'Hexagonal Skadis type board v2', 'hexagonal-skadis-type-board-v2', 'Hexagonal Skadis type board v2: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Hexagonal Skadis type board v2: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 304
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
    'K3D-MW-205', 'Bio Egg Dispenser', 'bio-egg-dispenser', 'Bio Egg Dispenser: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Bio Egg Dispenser: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 305
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
    'K3D-MW-206', 'Skadis Boards EASY Install', 'skadis-boards-easy-install', 'Skadis Boards EASY Install: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Skadis Boards EASY Install: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 306
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
    'K3D-MW-207', 'Modular Pegboard Panel (IKEA compatible)', 'modular-pegboard-panel-ikea-compatible', 'Modular Pegboard Panel (IKEA compatible): 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modular Pegboard Panel (IKEA compatible): 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 307
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
    'K3D-MW-208', 'PlugGuard - 17 Minutes, 5 Grams', 'plugguard---17-minutes-5-grams', 'PlugGuard - 17 Minutes, 5 Grams: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'PlugGuard - 17 Minutes, 5 Grams: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 308
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
    'K3D-MW-209', 'Cable Holder | TPU', 'cable-holder-tpu', 'Cable Holder | TPU: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Holder | TPU: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 309
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
    'K3D-MW-210', 'Soap Dish / Sponge Holder Collection #2', 'soap-dish-sponge-holder-collection-2', 'Soap Dish / Sponge Holder Collection #2: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap Dish / Sponge Holder Collection #2: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 310
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
    'K3D-MW-211', 'A1 Bin Minimal Design', 'a1-bin-minimal-design', 'A1 Bin Minimal Design: 3D printed trash bin, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'A1 Bin Minimal Design: 3D printed trash bin, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'trash-bins' LIMIT 1), 'ready_made', 'active', 'trashbins,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 311
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
    'K3D-MW-212', 'Organic Geodesic Fruit Bowl', 'organic-geodesic-fruit-bowl', 'Organic Geodesic Fruit Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Organic Geodesic Fruit Bowl: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 312
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
    'K3D-MW-213', 'Portable Phone Stand | Print in Place', 'portable-phone-stand-print-in-place', 'Portable Phone Stand | Print in Place: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Portable Phone Stand | Print in Place: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 313
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
    'K3D-MW-214', 'Stamp (with interchangeable designs)', 'stamp-with-interchangeable-designs', 'Stamp (with interchangeable designs): 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stamp (with interchangeable designs): 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 314
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
    'K3D-MW-215', 'MakerRoll - Custom Text Roller - Parametric', 'makerroll---custom-text-roller---parametric', 'MakerRoll - Custom Text Roller - Parametric: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'MakerRoll - Custom Text Roller - Parametric: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 315
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
    'K3D-MW-216', 'Business Card Embosser - Level up your cards!', 'business-card-embosser---level-up-your-cards', 'Business Card Embosser - Level up your cards!: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Business Card Embosser - Level up your cards!: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 316
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
    'K3D-MW-217', 'Stamp Maker - Customizable Stamps', 'stamp-maker---customizable-stamps', 'Stamp Maker - Customizable Stamps: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stamp Maker - Customizable Stamps: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 317
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
    'K3D-MW-218', 'Image To Stamp', 'image-to-stamp', 'Image To Stamp: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Image To Stamp: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 318
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
    'K3D-MW-219', 'SKADENSE – High-Density SKADIS Pegboard', 'skadense-high-density-skadis-pegboard', 'SKADENSE – High-Density SKADIS Pegboard: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'SKADENSE – High-Density SKADIS Pegboard: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 319
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
    'K3D-MW-220', 'Pocket-Sized Yen Coin Holder', 'pocket-sized-yen-coin-holder', 'Pocket-Sized Yen Coin Holder: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Pocket-Sized Yen Coin Holder: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 320
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
    'K3D-MW-221', 'WORBY AirPods Pro 3: MagSafe, USB-C & Storage', 'worby-airpods-pro-3-magsafe-usb-c-storage', 'WORBY AirPods Pro 3: MagSafe, USB-C & Storage: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'WORBY AirPods Pro 3: MagSafe, USB-C & Storage: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 321
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
    'K3D-MW-222', 'Essential Daily Tools Keychain', 'essential-daily-tools-keychain', 'Essential Daily Tools Keychain: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Essential Daily Tools Keychain: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 322
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
    'K3D-MW-223', 'Dali Wall Clock', 'dali-wall-clock', 'Dali Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dali Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 323
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
    'K3D-MW-224', 'Snap.mdo - Desk Organizer - Modular', 'snap-mdo---desk-organizer---modular', 'Snap.mdo - Desk Organizer - Modular: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Snap.mdo - Desk Organizer - Modular: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 324
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
    'K3D-MW-225', 'Stadium, modern wall clock', 'stadium-modern-wall-clock', 'Stadium, modern wall clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stadium, modern wall clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 325
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
    'K3D-MW-226', 'Concrete-Like Desktop Clock', 'concrete-like-desktop-clock', 'Concrete-Like Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Concrete-Like Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 326
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
    'K3D-MW-227', 'RelOJos (cross-eyed clock)', 'relojos-cross-eyed-clock', 'RelOJos (cross-eyed clock): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'RelOJos (cross-eyed clock): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 327
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
    'K3D-MW-228', 'FIVE O\'CLOCK - Modern Design', 'five-o-clock---modern-design', 'FIVE O\'CLOCK - Modern Design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'FIVE O\'CLOCK - Modern Design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 328
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
    'K3D-MW-229', 'Gridfinity Holder for AirPods Pro 3 with Case', 'gridfinity-holder-for-airpods-pro-3-with-case', 'Gridfinity Holder for AirPods Pro 3 with Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Gridfinity Holder for AirPods Pro 3 with Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 329
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
    'K3D-MW-230', 'Hard Drive Clock', 'hard-drive-clock', 'Hard Drive Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Hard Drive Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 330
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
    'K3D-MW-231', 'Miss Minutes Clock (Loki)', 'miss-minutes-clock-loki', 'Miss Minutes Clock (Loki): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Miss Minutes Clock (Loki): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 331
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
    'K3D-MW-232', 'Modern Lamp Angular', 'modern-lamp-angular', 'Modern Lamp Angular: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Lamp Angular: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 332
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
    'K3D-MW-233', 'Desk Stranding - The Death Stranding Desk Lamp', 'desk-stranding---the-death-stranding-desk-lamp', 'Desk Stranding - The Death Stranding Desk Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desk Stranding - The Death Stranding Desk Lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 333
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
    'K3D-MW-234', 'Iris lamp', 'iris-lamp', 'Iris lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Iris lamp: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 334
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
    'K3D-MW-235', 'Print-in-Place Smooth Marble Run XL - Fidget Toy', 'print-in-place-smooth-marble-run-xl---fidget-toy', 'Print-in-Place Smooth Marble Run XL - Fidget Toy: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Print-in-Place Smooth Marble Run XL - Fidget Toy: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 335
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
    'K3D-MW-236', 'Soap bubble pipe', 'soap-bubble-pipe', 'Soap bubble pipe: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soap bubble pipe: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 336
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
    'K3D-MW-237', 'PC Fan Adapter with Grille, Filter 60 80 92 120', 'pc-fan-adapter-with-grille-filter-60-80-92-120', 'PC Fan Adapter with Grille, Filter 60 80 92 120: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'PC Fan Adapter with Grille, Filter 60 80 92 120: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 337
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
    'K3D-MW-238', 'Universal Fan stand - Flat & Angled', 'universal-fan-stand---flat-angled', 'Universal Fan stand - Flat & Angled: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Universal Fan stand - Flat & Angled: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 338
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
    'K3D-MW-239', 'Fan 120mm and 80mm for 130 dc motor', 'fan-120mm-and-80mm-for-130-dc-motor', 'Fan 120mm and 80mm for 130 dc motor: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Fan 120mm and 80mm for 130 dc motor: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 339
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
    'K3D-MW-240', 'Fan to Duct Adapter', 'fan-to-duct-adapter', 'Fan to Duct Adapter: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Fan to Duct Adapter: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 340
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
    'K3D-MW-241', 'Voronoi adjustable fan stand (120mm fan)', 'voronoi-adjustable-fan-stand-120mm-fan', 'Voronoi adjustable fan stand (120mm fan): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Voronoi adjustable fan stand (120mm fan): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 341
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
    'K3D-MW-242', 'Retro Desktop Fan 120mm', 'retro-desktop-fan-120mm', 'Retro Desktop Fan 120mm: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Retro Desktop Fan 120mm: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 342
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
    'K3D-MW-243', 'Dome Desk Fan', 'dome-desk-fan', 'Dome Desk Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dome Desk Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 343
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
    'K3D-MW-244', 'Compact Airfilter for 120x120mm Fan', 'compact-airfilter-for-120x120mm-fan', 'Compact Airfilter for 120x120mm Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Compact Airfilter for 120x120mm Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 344
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
    'K3D-MW-245', 'Cooler holder for fans', 'cooler-holder-for-fans', 'Cooler holder for fans: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cooler holder for fans: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 345
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
    'K3D-MW-246', 'Reusable Cable Ties Set - Strong, Slim & Easy Release', 'reusable-cable-ties-set---strong-slim-easy-release', 'Reusable Cable Ties Set - Strong, Slim & Easy Release: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Reusable Cable Ties Set - Strong, Slim & Easy Release: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 346
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
    'K3D-MW-247', 'Simple CAD Joystick', 'simple-cad-joystick', 'Simple CAD Joystick: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Simple CAD Joystick: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 347
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
    'K3D-MW-248', 'Kepler Tray', 'kepler-tray', 'Kepler Tray: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Kepler Tray: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 348
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
    'K3D-MW-249', 'Soldering Tool Dock', 'soldering-tool-dock', 'Soldering Tool Dock: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Soldering Tool Dock: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 349
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
    'K3D-MW-250', 'EXTREMELY STRONG HRC SERIES CLAMP', 'extremely-strong-hrc-series-clamp', 'EXTREMELY STRONG HRC SERIES CLAMP: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'EXTREMELY STRONG HRC SERIES CLAMP: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 350
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
    'K3D-MW-251', 'Mega powerbank DIY with flashlight', 'mega-powerbank-diy-with-flashlight', 'Mega powerbank DIY with flashlight: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mega powerbank DIY with flashlight: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 351
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
    'K3D-MW-252', 'NASA Chainmail Fabric Bracelet M - Clasp - 20 Sizes', 'nasa-chainmail-fabric-bracelet-m---clasp---20-sizes', 'NASA Chainmail Fabric Bracelet M - Clasp - 20 Sizes: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'NASA Chainmail Fabric Bracelet M - Clasp - 20 Sizes: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 352
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
    'K3D-MW-253', 'Message Launcher V2 - Secret Shooter', 'message-launcher-v2---secret-shooter', 'Message Launcher V2 - Secret Shooter: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Message Launcher V2 - Secret Shooter: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 353
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
    'K3D-MW-254', 'Cable Tie Set TPU', 'cable-tie-set-tpu', 'Cable Tie Set TPU: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Tie Set TPU: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 354
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
    'K3D-MW-255', 'Easy-Unlock Cable Clip (Pinch to Unlock)', 'easy-unlock-cable-clip-pinch-to-unlock', 'Easy-Unlock Cable Clip (Pinch to Unlock): 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Easy-Unlock Cable Clip (Pinch to Unlock): 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 355
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
    'K3D-MW-256', 'Cable Organiser/Cable Clip', 'cable-organiser-cable-clip', 'Cable Organiser/Cable Clip: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Organiser/Cable Clip: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 356
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
    'K3D-MW-257', 'Cable Organizer v2 | Cable Clip | Cable Winder', 'cable-organizer-v2-cable-clip-cable-winder', 'Cable Organizer v2 | Cable Clip | Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Organizer v2 | Cable Clip | Cable Winder: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 357
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
    'K3D-MW-258', 'Universal Table Hanger | Bag Hanger | Desk Hook', 'universal-table-hanger-bag-hanger-desk-hook', 'Universal Table Hanger | Bag Hanger | Desk Hook: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Universal Table Hanger | Bag Hanger | Desk Hook: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 358
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
    'K3D-MW-259', 'Minimalist Wall Hook - Parametric', 'minimalist-wall-hook---parametric', 'Minimalist Wall Hook - Parametric: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Wall Hook - Parametric: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 359
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
    'K3D-MW-260', 'Wall Hanger', 'wall-hanger', 'Wall Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wall Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 360
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
    'K3D-MW-261', 'Tilting Wall Hook - Modern and Functional Design', 'tilting-wall-hook---modern-and-functional-design', 'Tilting Wall Hook - Modern and Functional Design: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Tilting Wall Hook - Modern and Functional Design: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 361
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
    'K3D-MW-262', 'Carabiner Double S-Hook with Safety Side', 'carabiner-double-s-hook-with-safety-side', 'Carabiner Double S-Hook with Safety Side: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Carabiner Double S-Hook with Safety Side: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 362
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
    'K3D-MW-263', 'Folding Wall Hook', 'folding-wall-hook', 'Folding Wall Hook: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Folding Wall Hook: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 363
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
    'K3D-MW-264', 'Modern Minimalistic - Foldable Wall Hook', 'modern-minimalistic---foldable-wall-hook', 'Modern Minimalistic - Foldable Wall Hook: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Minimalistic - Foldable Wall Hook: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 364
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
    'K3D-MW-265', 'Foldable Clothes Hanger (print-in-place)', 'foldable-clothes-hanger-print-in-place', 'Foldable Clothes Hanger (print-in-place): 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Foldable Clothes Hanger (print-in-place): 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 365
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
    'K3D-MW-266', 'Side-Lying Phone Stand', 'side-lying-phone-stand', 'Side-Lying Phone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Side-Lying Phone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 366
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
    'K3D-MW-267', 'Foldable Small Smartphone Stand | Pocket Stand', 'foldable-small-smartphone-stand-pocket-stand', 'Foldable Small Smartphone Stand | Pocket Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Foldable Small Smartphone Stand | Pocket Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 367
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
    'K3D-MW-268', 'Small Smartphone Stand V2 - Direct Print', 'small-smartphone-stand-v2---direct-print', 'Small Smartphone Stand V2 - Direct Print: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Small Smartphone Stand V2 - Direct Print: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 368
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
    'K3D-MW-269', '(Ring-shaped) Cable Protector', 'ring-shaped-cable-protector', '(Ring-shaped) Cable Protector: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '(Ring-shaped) Cable Protector: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 369
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
    'K3D-MW-270', 'Little Prince Crown Hair Accessory', 'little-prince-crown-hair-accessory', 'Little Prince Crown Hair Accessory: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Little Prince Crown Hair Accessory: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 370
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
    'K3D-MW-271', 'Large Spring Toothbrush/Toothpaste Holder Organizer', 'large-spring-toothbrush-toothpaste-holder-organizer', 'Large Spring Toothbrush/Toothpaste Holder Organizer: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Large Spring Toothbrush/Toothpaste Holder Organizer: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 371
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
    'K3D-MW-272', 'Cute Sleeping Kitten Keychain', 'cute-sleeping-kitten-keychain', 'Cute Sleeping Kitten Keychain: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cute Sleeping Kitten Keychain: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 372
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
    'K3D-MW-273', 'No-slot Cable Protector', 'no-slot-cable-protector', 'No-slot Cable Protector: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'No-slot Cable Protector: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 373
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
    'K3D-MW-274', 'Data Cable Protector', 'data-cable-protector', 'Data Cable Protector: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Data Cable Protector: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 374
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
    'K3D-MW-275', 'Airpods 2 choco case', 'airpods-2-choco-case', 'Airpods 2 choco case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Airpods 2 choco case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 375
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
    'K3D-MW-276', 'Retro Gameboy Airpods 4 Case', 'retro-gameboy-airpods-4-case', 'Retro Gameboy Airpods 4 Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Retro Gameboy Airpods 4 Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 376
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
    'K3D-MW-277', 'Gameboy Airpods Case', 'gameboy-airpods-case', 'Gameboy Airpods Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Gameboy Airpods Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 377
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
    'K3D-MW-278', 'Cover airpods pro/pro 2 Voronoi', 'cover-airpods-pro-pro-2-voronoi', 'Cover airpods pro/pro 2 Voronoi: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cover airpods pro/pro 2 Voronoi: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 378
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
    'K3D-MW-279', 'Luffy Airpods pro gen 2 case', 'luffy-airpods-pro-gen-2-case', 'Luffy Airpods pro gen 2 case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Luffy Airpods pro gen 2 case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 379
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
    'K3D-MW-280', 'Irregular Airpods pro headphone case', 'irregular-airpods-pro-headphone-case', 'Irregular Airpods pro headphone case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Irregular Airpods pro headphone case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 380
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
    'K3D-MW-281', 'Airpods Pro 2 Case [Antilion] for TPU', 'airpods-pro-2-case-antilion-for-tpu', 'Airpods Pro 2 Case [Antilion] for TPU: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Airpods Pro 2 Case [Antilion] for TPU: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 381
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
    'K3D-MW-282', 'AirPods 4th Generation - Coral Reef - Earphone Case', 'airpods-4th-generation---coral-reef---earphone-case', 'AirPods 4th Generation - Coral Reef - Earphone Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AirPods 4th Generation - Coral Reef - Earphone Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 382
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
    'K3D-MW-283', 'COVER AIRPODS', 'cover-airpods', 'COVER AIRPODS: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'COVER AIRPODS: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 383
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
    'K3D-MW-284', 'Retro Radio AirPods Pro Case Cover', 'retro-radio-airpods-pro-case-cover', 'Retro Radio AirPods Pro Case Cover: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Retro Radio AirPods Pro Case Cover: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 384
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
    'K3D-MW-285', 'AirPods Pro case - Apple earbuds', 'airpods-pro-case---apple-earbuds', 'AirPods Pro case - Apple earbuds: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AirPods Pro case - Apple earbuds: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 385
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
    'K3D-MW-286', 'AirPods Pro 3 case in hammered texture', 'airpods-pro-3-case-in-hammered-texture', 'AirPods Pro 3 case in hammered texture: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AirPods Pro 3 case in hammered texture: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 386
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
    'K3D-MW-287', 'AirPods Pro Case', 'airpods-pro-case', 'AirPods Pro Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AirPods Pro Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 387
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
    'K3D-MW-288', 'AirPods Pro 2 Voronoi Case', 'airpods-pro-2-voronoi-case', 'AirPods Pro 2 Voronoi Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AirPods Pro 2 Voronoi Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 388
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
    'K3D-MW-289', 'Flat-Edged AirPods Pro (2) Case', 'flat-edged-airpods-pro-2-case', 'Flat-Edged AirPods Pro (2) Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Flat-Edged AirPods Pro (2) Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 389
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
    'K3D-MW-290', 'AirPods Pro 2 Honeycomb Case', 'airpods-pro-2-honeycomb-case', 'AirPods Pro 2 Honeycomb Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AirPods Pro 2 Honeycomb Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 390
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
    'K3D-MW-291', 'Honeycomb Desktop Clock', 'honeycomb-desktop-clock', 'Honeycomb Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Honeycomb Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 391
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
    'K3D-MW-292', 'Minimalist Wall Clock', 'minimalist-wall-clock', 'Minimalist Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 392
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
    'K3D-MW-293', 'Small Retro Table Clock', 'small-retro-table-clock', 'Small Retro Table Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Small Retro Table Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 393
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
    'K3D-MW-294', 'AXIS CLOCK', 'axis-clock', 'AXIS CLOCK: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'AXIS CLOCK: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 394
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
    'K3D-MW-295', 'Shoe Horn', 'shoe-horn', 'Shoe Horn: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Shoe Horn: 3D printed home hardware piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'home-hardware' LIMIT 1), 'ready_made', 'active', 'homehardware,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 395
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
    'K3D-MW-296', 'Advanced Ergonomic Nasal Dilator NEW v2', 'advanced-ergonomic-nasal-dilator-new-v2', 'Advanced Ergonomic Nasal Dilator NEW v2: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Advanced Ergonomic Nasal Dilator NEW v2: 3D printed gadget, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'gadgets' LIMIT 1), 'ready_made', 'active', 'gadgets,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 396
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
    'K3D-MW-297', 'Glove Clips', 'glove-clips', 'Glove Clips: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Glove Clips: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 397
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
    'K3D-MW-298', 'Magic Clothes Hanger (print-in-place)', 'magic-clothes-hanger-print-in-place', 'Magic Clothes Hanger (print-in-place): 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Magic Clothes Hanger (print-in-place): 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 398
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
    'K3D-MW-299', 'Backpack Hanger | Bag Hook | Bag Coat Hanger', 'backpack-hanger-bag-hook-bag-coat-hanger', 'Backpack Hanger | Bag Hook | Bag Coat Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Backpack Hanger | Bag Hook | Bag Coat Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 399
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
    'K3D-MW-300', 'PET Plastic filament recycler', 'pet-plastic-filament-recycler', 'PET Plastic filament recycler: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'PET Plastic filament recycler: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 400
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
    'K3D-MW-301', 'USB cable organizer', 'usb-cable-organizer', 'USB cable organizer: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'USB cable organizer: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 401
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
    'K3D-MW-302', 'Desk Bin Trash _ No supports needed', 'desk-bin-trash-no-supports-needed', 'Desk Bin Trash _ No supports needed: 3D printed trash bin, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desk Bin Trash _ No supports needed: 3D printed trash bin, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'trash-bins' LIMIT 1), 'ready_made', 'active', 'trashbins,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 402
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
    'K3D-MW-303', 'Mesh Cup - Universal Storage Container', 'mesh-cup---universal-storage-container', 'Mesh Cup - Universal Storage Container: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mesh Cup - Universal Storage Container: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 403
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
    'K3D-MW-304', '5 Grams Cable Clip', '5-grams-cable-clip', '5 Grams Cable Clip: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '5 Grams Cable Clip: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 404
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
    'K3D-MW-305', 'Travel Case', 'travel-case', 'Travel Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Travel Case: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 405
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
    'K3D-MW-306', 'Bauho • Organiser', 'bauho-organiser', 'Bauho • Organiser: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Bauho • Organiser: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 406
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
    'K3D-MW-307', 'Mini Bag Clip', 'mini-bag-clip', 'Mini Bag Clip: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mini Bag Clip: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 407
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
    'K3D-MW-308', 'Pocket Rubber Band Racer', 'pocket-rubber-band-racer', 'Pocket Rubber Band Racer: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Pocket Rubber Band Racer: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 408
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
    'K3D-MW-309', 'Minimal Modern Clock - Clock Components Kit 011', 'minimal-modern-clock---clock-components-kit-011', 'Minimal Modern Clock - Clock Components Kit 011: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimal Modern Clock - Clock Components Kit 011: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 409
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
    'K3D-MW-310', 'Lampada HeadPhone – Modern Desk Light', 'lampada-headphone-modern-desk-light', 'Lampada HeadPhone – Modern Desk Light: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Lampada HeadPhone – Modern Desk Light: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 410
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
    'K3D-MW-311', 'Modern Wall Clock - Parametric Minimalist Home Decor', 'modern-wall-clock---parametric-minimalist-home-decor', 'Modern Wall Clock - Parametric Minimalist Home Decor: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Wall Clock - Parametric Minimalist Home Decor: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 411
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
    'K3D-MW-312', 'Moku Parametric Desk Organizer - Japandi Style Pen Holder', 'moku-parametric-desk-organizer---japandi-style-pen-holder', 'Moku Parametric Desk Organizer - Japandi Style Pen Holder: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Moku Parametric Desk Organizer - Japandi Style Pen Holder: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 412
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
    'K3D-MW-313', 'Labx Mini Stand – Phone & Tablet Stand', 'labx-mini-stand-phone-tablet-stand', 'Labx Mini Stand – Phone & Tablet Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Labx Mini Stand – Phone & Tablet Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 413
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
    'K3D-MW-314', 'Desktop Clock - Modular Office Clock Kit', 'desktop-clock---modular-office-clock-kit', 'Desktop Clock - Modular Office Clock Kit: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desktop Clock - Modular Office Clock Kit: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 414
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
    'K3D-MW-315', 'Mori Series - Japandi Self-Watering Cube Planters', 'mori-series---japandi-self-watering-cube-planters', 'Mori Series - Japandi Self-Watering Cube Planters: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mori Series - Japandi Self-Watering Cube Planters: 3D printed home decor piece, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'decor' LIMIT 1), 'ready_made', 'active', 'decor,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 415
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
    'K3D-MW-316', 'Small Smartphone Stand - Print-in-Place Design', 'small-smartphone-stand---print-in-place-design', 'Small Smartphone Stand - Print-in-Place Design: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Small Smartphone Stand - Print-in-Place Design: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 416
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
    'K3D-MW-317', 'Phone Holder Collection – Zen Designs', 'phone-holder-collection-zen-designs', 'Phone Holder Collection – Zen Designs: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Phone Holder Collection – Zen Designs: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 417
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
    'K3D-MW-318', 'Sparkcase', 'sparkcase', 'Sparkcase: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Sparkcase: 3D printed carry accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'carry-gear' LIMIT 1), 'ready_made', 'active', 'carrygear,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 418
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
    'K3D-MW-319', 'Outdoor Phone Stand - Compact and Durable', 'outdoor-phone-stand---compact-and-durable', 'Outdoor Phone Stand - Compact and Durable: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Outdoor Phone Stand - Compact and Durable: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 419
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
    'K3D-MW-320', 'Pocket Phone Stand (Print-in-Place)', 'pocket-phone-stand-print-in-place', 'Pocket Phone Stand (Print-in-Place): 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Pocket Phone Stand (Print-in-Place): 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 420
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
    'K3D-MW-321', 'Minimalist Phone Stand', 'minimalist-phone-stand', 'Minimalist Phone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Phone Stand: 3D printed stand, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'stands' LIMIT 1), 'ready_made', 'active', 'stands,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 421
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
    'K3D-MW-322', 'Nodum Keychain - Spinning Cores', 'nodum-keychain---spinning-cores', 'Nodum Keychain - Spinning Cores: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Nodum Keychain - Spinning Cores: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 422
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
    'K3D-MW-323', 'Auto-Locking Hanger - Gravity Towel Hook - Ribbed', 'auto-locking-hanger---gravity-towel-hook---ribbed', 'Auto-Locking Hanger - Gravity Towel Hook - Ribbed: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Auto-Locking Hanger - Gravity Towel Hook - Ribbed: 3D printed bathroom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'bathroom' LIMIT 1), 'ready_made', 'active', 'bathroom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 423
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
    'K3D-MW-324', 'Clip for 1 kg Coffee Bag', 'clip-for-1-kg-coffee-bag', 'Clip for 1 kg Coffee Bag: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Clip for 1 kg Coffee Bag: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 424
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
    'K3D-MW-325', 'Moku - Modular Desk System - Clock', 'moku---modular-desk-system---clock', 'Moku - Modular Desk System - Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Moku - Modular Desk System - Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 425
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
    'K3D-MW-326', 'HATCH Desk Clock', 'hatch-desk-clock', 'HATCH Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'HATCH Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 426
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
    'K3D-MW-327', 'Dieter Rams Clock', 'dieter-rams-clock', 'Dieter Rams Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dieter Rams Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 427
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
    'K3D-MW-328', 'Desktop Clock', 'desktop-clock', 'Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 428
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
    'K3D-MW-329', 'Japandi Clock (JUMU) - Desk Clock & Pen Holder', 'japandi-clock-jumu---desk-clock-pen-holder', 'Japandi Clock (JUMU) - Desk Clock & Pen Holder: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Japandi Clock (JUMU) - Desk Clock & Pen Holder: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 429
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
    'K3D-MW-330', 'Vexel · Desk Clock', 'vexel-desk-clock', 'Vexel · Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Vexel · Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 430
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
    'K3D-MW-331', 'Desk Clock - Wavy Arches', 'desk-clock---wavy-arches', 'Desk Clock - Wavy Arches: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desk Clock - Wavy Arches: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 431
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
    'K3D-MW-332', 'Desktop Upright Small Tree Clock', 'desktop-upright-small-tree-clock', 'Desktop Upright Small Tree Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desktop Upright Small Tree Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 432
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
    'K3D-MW-333', 'Clock', 'clock', 'Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 433
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
    'K3D-MW-334', 'Mini Clock – Cute Desk Decoration', 'mini-clock-cute-desk-decoration', 'Mini Clock – Cute Desk Decoration: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mini Clock – Cute Desk Decoration: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 434
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
    'K3D-MW-335', 'DiscTime Clock', 'disctime-clock', 'DiscTime Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'DiscTime Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 435
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
    'K3D-MW-336', 'Simple small modern clock, hidden matrix', 'simple-small-modern-clock-hidden-matrix', 'Simple small modern clock, hidden matrix: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Simple small modern clock, hidden matrix: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 436
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
    'K3D-MW-337', 'Elegant Desktop Clock', 'elegant-desktop-clock', 'Elegant Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Elegant Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 437
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
    'K3D-MW-338', 'Minimalist Desk Clock - Kit 011 Compatible', 'minimalist-desk-clock---kit-011-compatible', 'Minimalist Desk Clock - Kit 011 Compatible: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Desk Clock - Kit 011 Compatible: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 438
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
    'K3D-MW-339', 'Fried Egg Wall Clock', 'fried-egg-wall-clock', 'Fried Egg Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Fried Egg Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 439
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
    'K3D-MW-340', 'Grid Minimalist Clock', 'grid-minimalist-clock', 'Grid Minimalist Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Grid Minimalist Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 440
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
    'K3D-MW-341', 'Swirl Clock', 'swirl-clock', 'Swirl Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Swirl Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 441
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
    'K3D-MW-342', 'Decorative Table Clock – Modular Design', 'decorative-table-clock-modular-design', 'Decorative Table Clock – Modular Design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Decorative Table Clock – Modular Design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 442
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
    'K3D-MW-343', 'Wall Clock', 'wall-clock', 'Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 443
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
    'K3D-MW-344', 'Charcoal / Wood Clock', 'charcoal-wood-clock', 'Charcoal / Wood Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Charcoal / Wood Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 444
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
    'K3D-MW-345', 'Modern Minimalist Waving Clock', 'modern-minimalist-waving-clock', 'Modern Minimalist Waving Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Minimalist Waving Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 445
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
    'K3D-MW-346', 'Clock - snap.mdo - Kit 011', 'clock---snap-mdo---kit-011', 'Clock - snap.mdo - Kit 011: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Clock - snap.mdo - Kit 011: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 446
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
    'K3D-MW-347', 'Modern Desk Clock', 'modern-desk-clock', 'Modern Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 447
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
    'K3D-MW-348', 'Minimalist Desk Clock', 'minimalist-desk-clock', 'Minimalist Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 448
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
    'K3D-MW-349', 'Table clock design', 'table-clock-design', 'Table clock design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Table clock design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 449
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
    'K3D-MW-350', 'Table clock', 'table-clock', 'Table clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Table clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 450
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
    'K3D-MW-351', 'Bambu Cube Clock', 'bambu-cube-clock', 'Bambu Cube Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Bambu Cube Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 451
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
    'K3D-MW-352', 'Minimalista Clock', 'minimalista-clock', 'Minimalista Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalista Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 452
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
    'K3D-MW-353', 'Aesthetic Modern Mesh Clock.', 'aesthetic-modern-mesh-clock', 'Aesthetic Modern Mesh Clock.: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Aesthetic Modern Mesh Clock.: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 453
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
    'K3D-MW-354', 'Modern Simple Clock', 'modern-simple-clock', 'Modern Simple Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Simple Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 454
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
    'K3D-MW-355', 'Minimal Desk Clock', 'minimal-desk-clock', 'Minimal Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimal Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 455
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
    'K3D-MW-356', 'Minimalist Design Wall Clock', 'minimalist-design-wall-clock', 'Minimalist Design Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Design Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 456
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
    'K3D-MW-357', 'Bambu Clock Kit Desk Organizer & Pen Holder', 'bambu-clock-kit-desk-organizer-pen-holder', 'Bambu Clock Kit Desk Organizer & Pen Holder: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Bambu Clock Kit Desk Organizer & Pen Holder: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 457
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
    'K3D-MW-358', 'Dot Clock. small desk clock modular kit', 'dot-clock-small-desk-clock-modular-kit', 'Dot Clock. small desk clock modular kit: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dot Clock. small desk clock modular kit: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 458
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
    'K3D-MW-359', 'Minimalist Desk Clock Design', 'minimalist-desk-clock-design', 'Minimalist Desk Clock Design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Desk Clock Design: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 459
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
    'K3D-MW-360', 'Elegant Desktop Clock - With Second Hand (Q_Craft)', 'elegant-desktop-clock---with-second-hand-q-craft', 'Elegant Desktop Clock - With Second Hand (Q_Craft): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Elegant Desktop Clock - With Second Hand (Q_Craft): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 460
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
    'K3D-MW-361', 'Desktop Clock - A Minimalist Modular Clock System', 'desktop-clock---a-minimalist-modular-clock-system', 'Desktop Clock - A Minimalist Modular Clock System: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desktop Clock - A Minimalist Modular Clock System: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 461
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
    'K3D-MW-362', 'Desktop Clock. A Modern, Modular Clock System', 'desktop-clock-a-modern-modular-clock-system', 'Desktop Clock. A Modern, Modular Clock System: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desktop Clock. A Modern, Modular Clock System: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 462
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
    'K3D-MW-363', 'Desk Clock · Assembly', 'desk-clock-assembly', 'Desk Clock · Assembly: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desk Clock · Assembly: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 463
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
    'K3D-MW-364', 'Desktop Clock - A Modern, Modular Office Desk Clock', 'desktop-clock---a-modern-modular-office-desk-clock', 'Desktop Clock - A Modern, Modular Office Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desktop Clock - A Modern, Modular Office Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 464
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
    'K3D-MW-365', 'Clock - custom kit 011', 'clock---custom-kit-011', 'Clock - custom kit 011: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Clock - custom kit 011: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 465
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
    'K3D-MW-366', 'Switch Clock - Clock with Switchable Front Panels', 'switch-clock---clock-with-switchable-front-panels', 'Switch Clock - Clock with Switchable Front Panels: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Switch Clock - Clock with Switchable Front Panels: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 466
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
    'K3D-MW-367', 'Desk Clock With Airpod Charger and Storage.', 'desk-clock-with-airpod-charger-and-storage', 'Desk Clock With Airpod Charger and Storage.: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Desk Clock With Airpod Charger and Storage.: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 467
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
    'K3D-MW-368', 'Ripple Clock', 'ripple-clock', 'Ripple Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Ripple Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 468
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
    'K3D-MW-369', 'Wall Clock - Two-Tone Minimalist Satisfying Clock', 'wall-clock---two-tone-minimalist-satisfying-clock', 'Wall Clock - Two-Tone Minimalist Satisfying Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wall Clock - Two-Tone Minimalist Satisfying Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 469
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
    'K3D-MW-370', 'Design Clock - Sunburst', 'design-clock---sunburst', 'Design Clock - Sunburst: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Design Clock - Sunburst: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 470
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
    'K3D-MW-371', 'Clock', 'clock-2', 'Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 471
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
    'K3D-MW-372', 'Corner Wall Clock', 'corner-wall-clock', 'Corner Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Corner Wall Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 472
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
    'K3D-MW-373', 'RTX 4090 Founders Edition - Desk Clock', 'rtx-4090-founders-edition---desk-clock', 'RTX 4090 Founders Edition - Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'RTX 4090 Founders Edition - Desk Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 473
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
    'K3D-MW-374', 'Wavy Clock', 'wavy-clock', 'Wavy Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wavy Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 474
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
    'K3D-MW-375', 'Simple Clock', 'simple-clock', 'Simple Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Simple Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 475
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
    'K3D-MW-376', 'Minimalist Clock (Clock Components Kit 011)', 'minimalist-clock-clock-components-kit-011', 'Minimalist Clock (Clock Components Kit 011): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Minimalist Clock (Clock Components Kit 011): 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 476
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
    'K3D-MW-377', 'Rotating dial clock', 'rotating-dial-clock', 'Rotating dial clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Rotating dial clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 477
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
    'K3D-MW-378', 'Modern Desktop Clock, Modular Clock Kit', 'modern-desktop-clock-modular-clock-kit', 'Modern Desktop Clock, Modular Clock Kit: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modern Desktop Clock, Modular Clock Kit: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 478
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
    'K3D-MW-379', 'DESK ORBITAL CLOCK VERSION 2.0', 'desk-orbital-clock-version-2-0', 'DESK ORBITAL CLOCK VERSION 2.0: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'DESK ORBITAL CLOCK VERSION 2.0: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 479
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
    'K3D-MW-380', 'Colorful Desktop Clock', 'colorful-desktop-clock', 'Colorful Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Colorful Desktop Clock: 3D printed clock, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'clocks' LIMIT 1), 'ready_made', 'active', 'clocks,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 480
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
    'K3D-MW-381', 'Naruto Uzumaki - Desk Buddy', 'naruto-uzumaki---desk-buddy', 'Naruto Uzumaki - Desk Buddy: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Naruto Uzumaki - Desk Buddy: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 481
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
    'K3D-MW-382', 'One-Way Ratchet Hand Fan with Spring Return', 'one-way-ratchet-hand-fan-with-spring-return', 'One-Way Ratchet Hand Fan with Spring Return: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'One-Way Ratchet Hand Fan with Spring Return: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 482
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
    'K3D-MW-383', 'Goku Chibi – Dragon Ball', 'goku-chibi-dragon-ball', 'Goku Chibi – Dragon Ball: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Goku Chibi – Dragon Ball: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 483
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
    'K3D-MW-384', 'Breeze Buddy Pro', 'breeze-buddy-pro', 'Breeze Buddy Pro: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Breeze Buddy Pro: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 484
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
    'K3D-MW-385', 'Home Assistant compatible desk fan (120mm)', 'home-assistant-compatible-desk-fan-120mm', 'Home Assistant compatible desk fan (120mm): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Home Assistant compatible desk fan (120mm): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 485
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
    'K3D-MW-386', 'Fanilator 9000 Desk Fan', 'fanilator-9000-desk-fan', 'Fanilator 9000 Desk Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Fanilator 9000 Desk Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 486
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
    'K3D-MW-387', '14025 Desktop fan', '14025-desktop-fan', '14025 Desktop fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '14025 Desktop fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 487
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
    'K3D-MW-388', 'Silent Breeze: The 200mm Travel Fan (Noctua)', 'silent-breeze-the-200mm-travel-fan-noctua', 'Silent Breeze: The 200mm Travel Fan (Noctua): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Silent Breeze: The 200mm Travel Fan (Noctua): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 488
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
    'K3D-MW-389', 'Portable Pocket Fan (Powerful and Foldable)', 'portable-pocket-fan-powerful-and-foldable', 'Portable Pocket Fan (Powerful and Foldable): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Portable Pocket Fan (Powerful and Foldable): 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 489
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
    'K3D-MW-390', 'Manual Fan V2.0', 'manual-fan-v2-0', 'Manual Fan V2.0: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Manual Fan V2.0: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 490
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
    'K3D-MW-391', 'Design desk fan, Portable, usb powered, DIY', 'design-desk-fan-portable-usb-powered-diy', 'Design desk fan, Portable, usb powered, DIY: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Design desk fan, Portable, usb powered, DIY: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 491
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
    'K3D-MW-392', 'Retro Desk Fan', 'retro-desk-fan', 'Retro Desk Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Retro Desk Fan: 3D printed fan and cooling accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'fans-cooling' LIMIT 1), 'ready_made', 'active', 'fanscooling,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 492
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
    'K3D-MW-393', 'Cable Clip - 3 different Pattern Designs', 'cable-clip---3-different-pattern-designs', 'Cable Clip - 3 different Pattern Designs: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cable Clip - 3 different Pattern Designs: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 493
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
    'K3D-MW-394', 'Naruto 4 Tails - Fox Form NO AMS', 'naruto-4-tails---fox-form-no-ams', 'Naruto 4 Tails - Fox Form NO AMS: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Naruto 4 Tails - Fox Form NO AMS: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 494
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
    'K3D-MW-395', 'PLA Welding Rods - Recycle Your Scraps!', 'pla-welding-rods---recycle-your-scraps', 'PLA Welding Rods - Recycle Your Scraps!: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'PLA Welding Rods - Recycle Your Scraps!: 3D printed utility tool, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'tools-clips' LIMIT 1), 'ready_made', 'active', 'toolsclips,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 495
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
    'K3D-MW-396', 'Dice Mold', 'dice-mold', 'Dice Mold: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Dice Mold: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 496
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
    'K3D-MW-397', 'Telescopic little ghost fidget toy', 'telescopic-little-ghost-fidget-toy', 'Telescopic little ghost fidget toy: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Telescopic little ghost fidget toy: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 497
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
    'K3D-MW-398', 'Space Saving Hanger', 'space-saving-hanger', 'Space Saving Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Space Saving Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 498
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
    'K3D-MW-399', 'Hangs - Wall Hanger', 'hangs---wall-hanger', 'Hangs - Wall Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Hangs - Wall Hanger: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 499
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
    'K3D-MW-400', 'Modular drawer dividers', 'modular-drawer-dividers', 'Modular drawer dividers: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modular drawer dividers: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 500
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
    'K3D-MW-401', 'Voronoi Classic Mustang - 3D Printable Car Model', 'voronoi-classic-mustang---3d-printable-car-model', 'Voronoi Classic Mustang - 3D Printable Car Model: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Voronoi Classic Mustang - 3D Printable Car Model: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 501
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
    'K3D-MW-402', 'Aeolian Collection | Wave Pendant Lamp IKEA STRALA', 'aeolian-collection-wave-pendant-lamp-ikea-strala', 'Aeolian Collection | Wave Pendant Lamp IKEA STRALA: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Aeolian Collection | Wave Pendant Lamp IKEA STRALA: 3D printed lamp, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'lamps' LIMIT 1), 'ready_made', 'active', 'lamps,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 502
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
    'K3D-MW-403', 'Wall-Mounted Phone Holder with Cable Management', 'wall-mounted-phone-holder-with-cable-management', 'Wall-Mounted Phone Holder with Cable Management: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Wall-Mounted Phone Holder with Cable Management: 3D printed cable accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'cables' LIMIT 1), 'ready_made', 'active', 'cables,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 503
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
    'K3D-MW-404', 'Mug Station', 'mug-station', 'Mug Station: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Mug Station: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 504
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
    'K3D-MW-405', 'Nescafe Gold Coffee Dispenser', 'nescafe-gold-coffee-dispenser', 'Nescafe Gold Coffee Dispenser: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Nescafe Gold Coffee Dispenser: 3D printed kitchen accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'kitchen' LIMIT 1), 'ready_made', 'active', 'kitchen,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 505
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
    'K3D-MW-406', 'Home Foot Relaxation Tool | Foot Massage Roller', 'home-foot-relaxation-tool-foot-massage-roller', 'Home Foot Relaxation Tool | Foot Massage Roller: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Home Foot Relaxation Tool | Foot Massage Roller: 3D printed custom accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'qr-custom' LIMIT 1), 'ready_made', 'active', 'qrcustom,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 506
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
    'K3D-MW-407', 'Cute Mini Articulated Xenomorph', 'cute-mini-articulated-xenomorph', 'Cute Mini Articulated Xenomorph: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Cute Mini Articulated Xenomorph: 3D printed fun print, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'toys-figures' LIMIT 1), 'ready_made', 'active', 'toysfigures,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 507
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
    'K3D-MW-408', 'Gridfinity Vertical Cases', 'gridfinity-vertical-cases', 'Gridfinity Vertical Cases: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Gridfinity Vertical Cases: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 508
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
    'K3D-MW-409', 'CubeForm - Modular Desk Organization System', 'cubeform---modular-desk-organization-system', 'CubeForm - Modular Desk Organization System: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'CubeForm - Modular Desk Organization System: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 509
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
    'K3D-MW-410', 'Easy-Pour Stackable Storage Box | Small Parts', 'easy-pour-stackable-storage-box-small-parts', 'Easy-Pour Stackable Storage Box | Small Parts: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Easy-Pour Stackable Storage Box | Small Parts: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 510
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
    'K3D-MW-411', 'Stackable Desktop Drawers - Organizer', 'stackable-desktop-drawers---organizer', 'Stackable Desktop Drawers - Organizer: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Stackable Desktop Drawers - Organizer: 3D printed storage organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'storage' LIMIT 1), 'ready_made', 'active', 'storage,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 511
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
    'K3D-MW-412', 'IKEA Skadis desk mount (parametric)', 'ikea-skadis-desk-mount-parametric', 'IKEA Skadis desk mount (parametric): 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'IKEA Skadis desk mount (parametric): 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 512
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
    'K3D-MW-413', 'Modular Shelf for Wall / Floor / Desk', 'modular-shelf-for-wall-floor-desk', 'Modular Shelf for Wall / Floor / Desk: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Modular Shelf for Wall / Floor / Desk: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 513
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
    'K3D-MW-414', 'WORBY - Wall Organizer with Red, Blue, and Ye', 'worby---wall-organizer-with-red-blue-and-ye', 'WORBY - Wall Organizer with Red, Blue, and Ye: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'WORBY - Wall Organizer with Red, Blue, and Ye: 3D printed wall mount, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'wall-mounts' LIMIT 1), 'ready_made', 'active', 'wallmounts,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 514
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
    'K3D-MW-415', 'Spinning Desk Organizer', 'spinning-desk-organizer', 'Spinning Desk Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Spinning Desk Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 515
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
    'K3D-MW-416', 'Ribbed Oval Desk Organizers – 11 Variants', 'ribbed-oval-desk-organizers-11-variants', 'Ribbed Oval Desk Organizers – 11 Variants: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Ribbed Oval Desk Organizers – 11 Variants: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 516
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
    'K3D-MW-417', 'SKADIS Compatible Rotating Desk Organizer', 'skadis-compatible-rotating-desk-organizer', 'SKADIS Compatible Rotating Desk Organizer: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'SKADIS Compatible Rotating Desk Organizer: 3D printed pegboard accessory, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'pegboards' LIMIT 1), 'ready_made', 'active', 'pegboards,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 517
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
    'K3D-MW-418', 'Rotating organizer', 'rotating-organizer', 'Rotating organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', 'Rotating organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 518
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
    'K3D-MW-419', '360 Rotating Desk Organizer', '360-rotating-desk-organizer', '360 Rotating Desk Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.', '360 Rotating Desk Organizer: 3D printed desk organizer, made to order in Dhaka, Bangladesh. Message KERF 3D on WhatsApp for the price.

Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh. Direct order and custom material inquiry available via WhatsApp (+8801754550297).',
    (SELECT `id` FROM `categories` WHERE `slug` = 'organizers' LIMIT 1), 'ready_made', 'active', 'organizers,makerworld,3dprinted,dhaka,kerf3d,custom-print',
    0.00, 0.20, 20, 1,
    'Kerf 3D Studio', 'Standard Commercial', 'Curated MakerWorld specimen manufactured by Kerf 3D Studio Dhaka', 519
) ON DUPLICATE KEY UPDATE
    `short_description` = VALUES(`short_description`),
    `description` = VALUES(`description`),
    `status` = 'active';

