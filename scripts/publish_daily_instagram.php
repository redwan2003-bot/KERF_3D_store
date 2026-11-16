<?php

// ============================================================
// KERF 3D Studio - Instagram Campaign Publisher
// ============================================================

require __DIR__ . '/social_manager.php';

$campaign = [
    1 => [
        'date' => '2026-11-17',
        'title' => 'Broken Gaming Laptop Case by Irudimen',
        'slug' => 'broken-gaming-laptop-case',
        'headline' => 'SPECIMEN NO. 452 // BROKEN GAMING LAPTOP CHASSIS',
        'desc' => "Don't discard dead gaming laptops. Engineered by Irudimen, this custom additive chassis salvages working motherboards, dual blower fans, and cooling heatpipes into a standalone high-performance desktop or homelab server.\n\nFeaturing acrylic viewing panel integration and perimeter LED illumination channels.",
        'tags' => "#KERF3D #3DPrintingDhaka #BambuLab #DeskSetup #PCModding #CustomPC #Cyberdeck #Homelab #IndustrialDesign #DhakaTech"
    ],
    2 => [
        'date' => '2026-11-18',
        'title' => 'Old Laptop Custom Case by Irudimen',
        'slug' => 'old-laptop-custom-case',
        'headline' => 'SPECIMEN NO. 453 // UPRIGHT MINI MEDIA LAB',
        'desc' => "Transforming retired laptop hardware into a sleek, vertical mini media server. Designed for precise component elevation on brass standoffs to ensure zero thermal warping during continuous operation.\n\nFabricated to order in Dhaka with engineered heat-tolerant filaments.",
        'tags' => "#KERF3D #CustomPC #HomeServer #3DPrintingBangladesh #MiniPC #BambuLabA1 #DeskAesthetics #HardwareHacking"
    ],
    3 => [
        'date' => '2026-11-19',
        'title' => 'Niche 01 Brutalist Lamp',
        'slug' => 'niche-01-brutalist-lamp',
        'headline' => 'SPECIMEN NO. 421 // NICHE 01 BRUTALIST LAMP',
        'desc' => "Monolithic geometric presence. Cast in matte architectural filament with internal light diffusion cavities that emit warm, glare-free workspace illumination.\n\nCalibrated to 0.20mm layer height on Bambu Lab A1 hardware.",
        'tags' => "#KERF3D #BrutalistDesign #DeskLamp #Japandi #ArchitecturalLighting #MinimalistDesk #DhakaCraft #AmbientLighting"
    ],
    4 => [
        'date' => '2026-11-20',
        'title' => 'Skadis Kumiko Tile (Lightweight Strength Edition)',
        'slug' => 'skadis-kumiko-tile-lightweight-strength-edition',
        'headline' => 'SPECIMEN NO. 422 // SKADIS KUMIKO ARCHITECTURE',
        'desc' => "Traditional Japanese woodworking lattice geometry engineered for modern workshop pegboards. Provides structural rigidity with minimal mass, creating an elevated tactile backdrop for your tools.",
        'tags' => "#KERF3D #Kumiko #IkeaSkadis #Pegboard #WorkshopGoals #JapaneseCraft #3DPrinting #WorkspaceInspo"
    ],
    5 => [
        'date' => '2026-11-21',
        'title' => 'Cheese Keycaps (Artisan MX Keycaps)',
        'slug' => 'cheese-keycaps',
        'headline' => 'SPECIMEN NO. 425 // CHEESE KEYCAP ARTISAN',
        'desc' => "Playful tactile geometry meets mechanical keyboard precision. Cast in high-density matte yellow infill with crisp surface contours for standard MX mechanical stems.",
        'tags' => "#KERF3D #ArtisanKeycaps #MechanicalKeyboard #Keebs #DeskAccessories #CustomKeycaps #MechanicalKeyboards"
    ],
    6 => [
        'date' => '2026-11-22',
        'title' => 'Modular Panel V2',
        'slug' => 'modular-panel-v2',
        'headline' => 'SPECIMEN NO. 429 // MODULAR WORKSPACE PANEL',
        'desc' => "Interlocking desktop and wall organization panels. Engineered with zero-play tolerances so accessories, bins, and cable docks slot securely into place without fasteners.",
        'tags' => "#KERF3D #DeskOrganization #ModularDesign #DeskSetup #MinimalistWorkspace #Productivity #CleanDesk"
    ],
    7 => [
        'date' => '2026-11-23',
        'title' => 'Knitted Texture Decorative Tray',
        'slug' => 'knitted-texture-decorative-tray',
        'headline' => 'SPECIMEN NO. 424 // KNITTED TEXTURE CATCHALL',
        'desc' => "Textile micro-relief simulated entirely through precise filament deposition. A tactile countertop dish for everyday carry items, watches, and desk essentials.",
        'tags' => "#KERF3D #EverydayCarry #EDC #CatchallTray #IndustrialDesign #TactileDesign #ProductDesign"
    ],
    8 => [
        'date' => '2026-11-24',
        'title' => 'ESPHome Voice Assistant Speaker',
        'slug' => 'esphome-voice-assistant-speaker',
        'headline' => 'SPECIMEN NO. 433 // ESPHOME HARDWARE ENCLOSURE',
        'desc' => "Engineered for local, privacy-first smart home enthusiasts. Acoustic damping chamber and precision porting for custom ESP32 voice satellite hardware.",
        'tags' => "#KERF3D #HomeAssistant #ESPHome #SmartHome #OpenHardware #3DPrintingDhaka #SmartLiving"
    ],
    9 => [
        'date' => '2026-11-25',
        'title' => 'PH60Slim Choc Low Profile Mechanical Keyboard',
        'slug' => 'ph60slim-choc-low-profile-mechanical-keyboard',
        'headline' => 'SPECIMEN NO. 434 // PH60SLIM CHOC KEYBOARD CHASSIS',
        'desc' => "Ultra-compact typing ergonomics. Machined specifically for low-profile Kailh Choc switches, reducing wrist strain and offering maximum portability.",
        'tags' => "#KERF3D #MechanicalKeyboards #Ergonomics #CustomKeyboards #LowProfileKeebs #KeebLife #CustomKeeb"
    ],
    10 => [
        'date' => '2026-11-26',
        'title' => 'Translucent OLED Enclosure Orbital Space Clock',
        'slug' => 'translucent-oled-enclosure-orbital-space-clock',
        'headline' => 'SPECIMEN NO. 431 // ORBITAL SPACE TIMEPIECE',
        'desc' => "Translucent retro-futuristic desktop timekeeper. Features internal structural ribbing that catches ambient room light while framing an illuminated OLED display.",
        'tags' => "#KERF3D #DesktopClock #RetroFuturism #OLED #DeskToy #ModernArtifact #DhakaStudio #CyberpunkDesk"
    ]
];

$arg = $argv[1] ?? 'help';
$dryRun = in_array('--dry-run', $argv);
$force = in_array('--force', $argv);

$logFile = __DIR__ . '/../backups/instagram_published_log.json';
$publishedLog = file_exists($logFile) ? json_decode(file_get_contents($logFile), true) : [];

if ($arg === 'list') {
    echo "============================================================\n";
    echo "KERF 3D STUDIO - INSTAGRAM CAMPAIGN QUEUE\n";
    echo "============================================================\n";
    foreach ($campaign as $idx => $item) {
        $jpg = "https://kerf3d.store/assets/images/products/{$item['slug']}.jpg";
        $status = isset($publishedLog[$idx]) ? "✔ PUBLISHED (ID: {$publishedLog[$idx]['media_id']})" : "⏳ PENDING ({$item['date']} 7:30 PM BST)";
        echo " [{$idx}] {$item['headline']}\n";
        echo "     Date:   {$item['date']} 07:30 PM BST\n";
        echo "     Status: {$status}\n";
        echo "     Image:  {$jpg}\n";
        echo "     Link:   https://kerf3d.store/product/{$item['slug']}\n\n";
    }
    exit(0);
}

// Auto dispatch mode: finds today's campaign post
if ($arg === 'auto' || $arg === 'today') {
    $today = date('Y-m-d', time() + 21600); // UTC+6 (Dhaka)
    $targetIdx = null;
    foreach ($campaign as $idx => $item) {
        if ($item['date'] === $today) {
            $targetIdx = $idx;
            break;
        }
    }

    if (!$targetIdx) {
        echo "No campaign post scheduled for today ({$today}).\n";
        exit(0);
    }

    if (isset($publishedLog[$targetIdx]) && !$force) {
        echo "Specimen [{$targetIdx}] for today ({$today}) was ALREADY published (Media ID: {$publishedLog[$targetIdx]['media_id']}). Skipping.\n";
        exit(0);
    }

    $arg = (string)$targetIdx;
    echo "Auto-detected campaign specimen [{$arg}] for today ({$today})...\n";
}

if (!is_numeric($arg) || !isset($campaign[(int)$arg])) {
    echo "Usage:\n";
    echo "  php scripts/publish_daily_instagram.php list\n";
    echo "  php scripts/publish_daily_instagram.php auto [--force]\n";
    echo "  php scripts/publish_daily_instagram.php <index 1-10> [--dry-run] [--force]\n";
    exit(1);
}

$targetIdx = (int)$arg;
if (isset($publishedLog[$targetIdx]) && !$force && !$dryRun) {
    echo "WARNING: Specimen [{$targetIdx}] was already marked published on {$publishedLog[$targetIdx]['published_at']}.\n";
    echo "Pass --force to publish again.\n";
    exit(0);
}

$item = $campaign[$targetIdx];
$imageUrl = "https://kerf3d.store/assets/images/products/{$item['slug']}.jpg";
$productUrl = "https://kerf3d.store/product/{$item['slug']}";

$caption = "{$item['headline']}\n\n";
$caption .= "{$item['desc']}\n\n";
$caption .= "⚙️ Additively manufactured to order on Bambu Lab A1 hardware in Dhaka.\n";
$caption .= "Direct inquiry & custom sizing available via WhatsApp (+8801754550297).\n\n";
$caption .= "👉 Explore & order: {$productUrl} (Link in bio)\n\n";
$caption .= $item['tags'];

echo "============================================================\n";
echo "PUBLISHING SPECIMEN [{$targetIdx}] TO INSTAGRAM: {$item['title']}\n";
echo "============================================================\n";
echo "Image URL: {$imageUrl}\n\n";

if ($dryRun) {
    echo "[DRY RUN] Creating media container only...\n";
    $cRes = apiPost("{$igId}/media", [
        'image_url' => $imageUrl,
        'caption'   => $caption
    ], $pageToken);
    print_r($cRes);
    exit(0);
}

// 1. Create media container
echo "Step 1: Creating Instagram media container...\n";
$cRes = apiPost("{$igId}/media", [
    'image_url' => $imageUrl,
    'caption'   => $caption
], $pageToken);

if (empty($cRes['data']['id'])) {
    die("✖ Error creating container: " . json_encode($cRes['data']) . "\n");
}

$containerId = $cRes['data']['id'];
echo "✔ Container created: {$containerId}\n";

// 2. Poll container status until FINISHED
echo "Step 2: Checking media container status...\n";
$attempts = 0;
do {
    sleep(3);
    $statusRes = apiGet("{$containerId}?fields=status_code", $pageToken);
    $statusCode = $statusRes['data']['status_code'] ?? 'UNKNOWN';
    echo "  • Container status: {$statusCode}\n";
    $attempts++;
    if ($statusCode === 'FINISHED') break;
    if ($statusCode === 'ERROR' || $statusCode === 'EXPIRED') {
        die("✖ Container failed with status: {$statusCode}\n");
    }
} while ($attempts < 5);

// 3. Publish container
echo "Step 3: Publishing to Instagram feed...\n";
$pubRes = apiPost("{$igId}/media_publish", [
    'creation_id' => $containerId
], $pageToken);

if (!empty($pubRes['data']['id'])) {
    $mediaId = $pubRes['data']['id'];
    echo "✔ Successfully published to Instagram! Media ID: {$mediaId}\n";

    // Fetch permalink
    $mInfo = apiGet("{$mediaId}?fields=permalink", $pageToken);
    $permalink = $mInfo['data']['permalink'] ?? "https://www.instagram.com/p/{$mediaId}/";
    echo "🔗 View live post: {$permalink}\n";

    // Update log
    $publishedLog[$targetIdx] = [
        'specimen'     => $item['headline'],
        'media_id'     => $mediaId,
        'permalink'    => $permalink,
        'published_at' => date('Y-m-d H:i:s T')
    ];
    file_put_contents($logFile, json_encode($publishedLog, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
    echo "✔ Logged to backups/instagram_published_log.json\n";
} else {
    echo "✖ Failed publishing: " . json_encode($pubRes['data']) . "\n";
}
