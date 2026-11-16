<?php

// ============================================================
// KERF 3D Studio - Promote Instagram Page on Facebook Feed
// ============================================================

require __DIR__ . '/social_manager.php';

echo "============================================================\n";
echo "PUBLISHING INSTAGRAM LAUNCH PROMOTION ON FACEBOOK FEED\n";
echo "============================================================\n";

$message = "KERF 3D STUDIO // NOW ON INSTAGRAM\n\n";
$message .= "We are officially establishing our visual engineering archive on Instagram: @kerf3d\n\n";
$message .= "What to expect on our Instagram feed:\n";
$message .= "• High-precision additive manufacturing & timelapse telemetry\n";
$message .= "• Bambu Lab A1 0.20mm micro-layer print fidelity\n";
$message .= "• Custom cyberdeck, homelab, and PC chassis builds\n";
$message .= "• Brutalist desk accessories, modular organization & artisan mechanical keycaps\n";
$message .= "• Early design previews, prototyping updates & bespoke commission slots\n\n";
$message .= "Join our community of builders, designers, and PC modders in Dhaka:\n";
$message .= "👉 Follow @kerf3d on Instagram: https://www.instagram.com/kerf3d/\n";
$message .= "👉 Explore our inaugural launch post: https://www.instagram.com/p/Df0WQuJEspc/\n\n";
$message .= "Shop the complete catalog with direct home delivery:\n";
$message .= "🌐 https://kerf3d.store\n\n";
$message .= "#KERF3D #3DPrintingDhaka #BambuLab #InstagramLaunch #DeskSetup #PCModding #CustomPC #Cyberdeck #IndustrialDesign #DhakaTech #MechanicalKeyboards";

$imageUrl = "https://kerf3d.store/assets/images/products/broken-gaming-laptop-case.jpg";

echo "Publishing photo post to Facebook Page...\n";
$payload = [
    'url'     => $imageUrl,
    'message' => $message
];

$res = apiPost("{$pageId}/photos", $payload, $pageToken);

if (!empty($res['data']['id'])) {
    $photoId = $res['data']['id'];
    $postId = $res['data']['post_id'] ?? $photoId;
    echo "✔ Successfully published Instagram Promotion on Facebook!\n";
    echo "  • Photo ID: {$photoId}\n";
    echo "  • Post ID:  {$postId}\n";
    echo "  • Link: https://www.facebook.com/{$postId}\n";
} else {
    echo "✖ Failed to publish promo post: " . json_encode($res['data']) . "\n";
}
