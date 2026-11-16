<?php

// ============================================================
// KERF 3D Studio - Flagship Campaign Rescheduler
// ============================================================

require __DIR__ . '/social_manager.php';

$campaign = [
    [
        'title' => 'Broken Gaming Laptop Case by Irudimen',
        'slug' => 'broken-gaming-laptop-case',
        'headline' => 'SPECIMEN NO. 452 // BROKEN GAMING LAPTOP CHASSIS',
        'desc' => "Don't discard dead gaming laptops. Engineered by Irudimen, this custom additive chassis salvages working motherboards, dual blower fans, and cooling heatpipes into a standalone high-performance desktop or homelab server.\n\nFeaturing acrylic viewing panel integration and perimeter LED illumination channels.",
        'tags' => '#KERF3D #3DPrintingDhaka #BambuLab #DeskSetup #PCModding #CustomPC #Cyberdeck #Homelab #IndustrialDesign',
        'day_offset' => 1 // Tomorrow 7:30 PM BST (13:30 UTC)
    ],
    [
        'title' => 'Old Laptop Custom Case by Irudimen',
        'slug' => 'old-laptop-custom-case',
        'headline' => 'SPECIMEN NO. 453 // UPRIGHT MINI MEDIA LAB',
        'desc' => "Transforming retired laptop hardware into a sleek, vertical mini media server. Designed for precise component elevation on brass standoffs to ensure zero thermal warping during continuous operation.\n\nFabricated to order in Dhaka with engineered heat-tolerant filaments.",
        'tags' => '#KERF3D #CustomPC #HomeServer #3DPrintingBangladesh #MiniPC #BambuLabA1 #DeskAesthetics',
        'day_offset' => 2
    ],
    [
        'title' => 'Niche 01 Brutalist Lamp',
        'slug' => 'niche-01-brutalist-lamp',
        'headline' => 'SPECIMEN NO. 421 // NICHE 01 BRUTALIST LAMP',
        'desc' => "Monolithic geometric presence. Cast in matte architectural filament with internal light diffusion cavities that emit warm, glare-free workspace illumination.\n\nCalibrated to 0.20mm layer height on Bambu Lab A1 hardware.",
        'tags' => '#KERF3D #BrutalistDesign #DeskLamp #Japandi #ArchitecturalLighting #MinimalistDesk #DhakaCraft',
        'day_offset' => 3
    ],
    [
        'title' => 'Skadis Kumiko Tile (Lightweight Strength Edition)',
        'slug' => 'skadis-kumiko-tile-lightweight-strength-edition',
        'headline' => 'SPECIMEN NO. 422 // SKADIS KUMIKO ARCHITECTURE',
        'desc' => "Traditional Japanese woodworking lattice geometry engineered for modern workshop pegboards. Provides structural rigidity with minimal mass, creating an elevated tactile backdrop for your tools.",
        'tags' => '#KERF3D #Kumiko #IkeaSkadis #Pegboard #WorkshopGoals #JapaneseCraft #3DPrinting',
        'day_offset' => 4
    ],
    [
        'title' => 'Cheese Keycaps (Artisan MX Keycaps)',
        'slug' => 'cheese-keycaps',
        'headline' => 'SPECIMEN NO. 425 // CHEESE KEYCAP ARTISAN',
        'desc' => "Playful tactile geometry meets mechanical keyboard precision. Cast in high-density matte yellow infill with crisp surface contours for standard MX mechanical stems.",
        'tags' => '#KERF3D #ArtisanKeycaps #MechanicalKeyboard #Keebs #DeskAccessories #CustomKeycaps',
        'day_offset' => 5
    ],
    [
        'title' => 'Modular Panel V2',
        'slug' => 'modular-panel-v2',
        'headline' => 'SPECIMEN NO. 429 // MODULAR WORKSPACE PANEL',
        'desc' => "Interlocking desktop and wall organization panels. Engineered with zero-play tolerances so accessories, bins, and cable docks slot securely into place without fasteners.",
        'tags' => '#KERF3D #DeskOrganization #ModularDesign #DeskSetup #MinimalistWorkspace #Productivity',
        'day_offset' => 6
    ],
    [
        'title' => 'Knitted Texture Decorative Tray',
        'slug' => 'knitted-texture-decorative-tray',
        'headline' => 'SPECIMEN NO. 424 // KNITTED TEXTURE CATCHALL',
        'desc' => "Textile micro-relief simulated entirely through precise filament deposition. A tactile countertop dish for everyday carry items, watches, and desk essentials.",
        'tags' => '#KERF3D #EverydayCarry #EDC #CatchallTray #IndustrialDesign #TactileDesign',
        'day_offset' => 7
    ],
    [
        'title' => 'ESPHome Voice Assistant Speaker',
        'slug' => 'esphome-voice-assistant-speaker',
        'headline' => 'SPECIMEN NO. 433 // ESPHOME HARDWARE ENCLOSURE',
        'desc' => "Engineered for local, privacy-first smart home enthusiasts. Acoustic damping chamber and precision porting for custom ESP32 voice satellite hardware.",
        'tags' => '#KERF3D #HomeAssistant #ESPHome #SmartHome #OpenHardware #3DPrintingDhaka',
        'day_offset' => 8
    ],
    [
        'title' => 'PH60Slim Choc Low Profile Mechanical Keyboard',
        'slug' => 'ph60slim-choc-low-profile-mechanical-keyboard',
        'headline' => 'SPECIMEN NO. 434 // PH60SLIM CHOC KEYBOARD CHASSIS',
        'desc' => "Ultra-compact typing ergonomics. Machined specifically for low-profile Kailh Choc switches, reducing wrist strain and offering maximum portability.",
        'tags' => '#KERF3D #MechanicalKeyboards #Ergonomics #CustomKeyboards #LowProfileKeebs #KeebLife',
        'day_offset' => 9
    ],
    [
        'title' => 'Translucent OLED Enclosure Orbital Space Clock',
        'slug' => 'translucent-oled-enclosure-orbital-space-clock',
        'headline' => 'SPECIMEN NO. 431 // ORBITAL SPACE TIMEPIECE',
        'desc' => "Translucent retro-futuristic desktop timekeeper. Features internal structural ribbing that catches ambient room light while framing an illuminated OLED display.",
        'tags' => '#KERF3D #DesktopClock #RetroFuturism #OLED #DeskToy #ModernArtifact #DhakaStudio',
        'day_offset' => 10
    ]
];

echo "============================================================\n";
echo "KERF 3D STUDIO - SCHEDULING 10-DAY FLAGSHIP CAMPAIGN\n";
echo "============================================================\n";

$baseTime = strtotime("today 13:30:00 UTC"); // 7:30 PM BST (Dhaka)
if ($baseTime < time()) {
    $baseTime += 86400; // start tomorrow if today's 7:30 PM has passed
}

$scheduledCount = 0;

foreach ($campaign as $item) {
    $targetTime = $baseTime + (($item['day_offset'] - 1) * 86400);
    $dhakaFormatted = date('Y-m-d h:i A', $targetTime + 21600); // UTC+6
    $link = "https://kerf3d.store/product/{$item['slug']}";
    $imageUrl = "https://kerf3d.store/assets/images/products/{$item['slug']}.webp";

    $message = "{$item['headline']}\n\n";
    $message .= "{$item['desc']}\n\n";
    $message .= "⚙️ Manufactured to order on high-precision Bambu Lab A1 hardware in Dhaka, Bangladesh.\n";
    $message .= "Direct order & custom sizing inquiry available via WhatsApp (+8801754550297).\n\n";
    $message .= "👉 View full telemetry & order: {$link}\n\n";
    $message .= $item['tags'];

    echo "\nScheduling: {$item['title']}\n";
    echo " • Slated Date: {$dhakaFormatted} BST (Timestamp: {$targetTime})\n";
    echo " • Target URL: {$link}\n";

    // Schedule on Facebook Page
    $payload = [
        'message' => $message,
        'link'    => $link,
        'published' => 'false',
        'scheduled_publish_time' => $targetTime
    ];

    $res = apiPost("{$pageId}/feed", $payload, $pageToken);
    if (!empty($res['data']['id'])) {
        $scheduledCount++;
        echo " ✔ Scheduled on Facebook! Post ID: {$res['data']['id']}\n";
    } else {
        echo " ✖ Error scheduling: " . json_encode($res['data']) . "\n";
    }

    usleep(500000); // 500ms safety rate limit
}

echo "\n============================================================\n";
echo "CAMPAIGN SCHEDULING SUMMARY: {$scheduledCount} of 10 posts slated successfully!\n";
echo "============================================================\n";
