<?php

$slugs = [
    'broken-gaming-laptop-case',
    'old-laptop-custom-case',
    'niche-01-brutalist-lamp',
    'skadis-kumiko-tile-lightweight-strength-edition',
    'cheese-keycaps',
    'modular-panel-v2',
    'knitted-texture-decorative-tray',
    'esphome-voice-assistant-speaker',
    'ph60slim-choc-low-profile-mechanical-keyboard',
    'translucent-oled-enclosure-orbital-space-clock'
];

$dirs = [
    __DIR__ . '/../public/assets/images/products/',
    __DIR__ . '/../assets/images/products/'
];

foreach ($slugs as $slug) {
    foreach ($dirs as $dir) {
        $webpPath = $dir . $slug . '.webp';
        $jpgPath = $dir . $slug . '.jpg';

        if (!file_exists($webpPath)) {
            echo "Missing: {$webpPath}\n";
            continue;
        }

        $img = @imagecreatefromwebp($webpPath);
        if (!$img) {
            echo "Failed reading WebP: {$webpPath}\n";
            continue;
        }

        // Convert to truecolor with white background if transparent
        $w = imagesx($img);
        $h = imagesy($img);
        $trueColor = imagecreatetruecolor($w, $h);
        $white = imagecolorallocate($trueColor, 255, 255, 255);
        imagefilledrectangle($trueColor, 0, 0, $w, $h, $white);
        imagecopy($trueColor, $img, 0, 0, 0, 0, $w, $h);

        // Save high quality JPEG
        imagejpeg($trueColor, $jpgPath, 92);
        imagedestroy($img);
        imagedestroy($trueColor);

        echo "Created JPEG: {$jpgPath} (" . filesize($jpgPath) . " bytes)\n";
    }
}
