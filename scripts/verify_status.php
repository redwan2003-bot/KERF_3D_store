<?php

function loadEnv($file) {
    if (!file_exists($file)) return [];
    $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    $data = [];
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) continue;
        if (strpos($line, '=') !== false) {
            list($key, $val) = explode('=', $line, 2);
            $data[trim($key)] = trim(trim($val), '"\'');
        }
    }
    return $data;
}

$env = loadEnv(__DIR__ . '/../config/social.env');
$pageToken = $env['FB_PAGE_ACCESS_TOKEN'] ?? null;
$pageId    = $env['FB_PAGE_ID'] ?? null;
$igId      = $env['IG_BUSINESS_ACCOUNT_ID'] ?? null;

echo "============================================================\n";
echo "KERF 3D - LIVE SOCIAL STATUS CHECK\n";
echo "============================================================\n";

// 1. Check live posts on Facebook feed
$feedUrl = "https://graph.facebook.com/v19.0/{$pageId}/feed?fields=id,created_time,message&limit=10&access_token=" . urlencode($pageToken);
$feedRes = @file_get_contents($feedUrl);
$feedData = json_decode($feedRes, true);
$liveCount = count($feedData['data'] ?? []);
echo "Current Live Posts on Facebook Feed: {$liveCount}\n";

// 2. Check scheduled posts on Facebook
$schedUrl = "https://graph.facebook.com/v19.0/{$pageId}/scheduled_posts?fields=id,scheduled_publish_time,message&limit=20&access_token=" . urlencode($pageToken);
$schedRes = @file_get_contents($schedUrl);
$schedData = json_decode($schedRes, true);
$schedPosts = $schedData['data'] ?? [];
echo "Currently Scheduled Posts on Facebook: " . count($schedPosts) . "\n";
foreach ($schedPosts as $sp) {
    $dhakaTime = date('Y-m-d H:i:s T', $sp['scheduled_publish_time']);
    $firstLine = strtok($sp['message'] ?? '', "\n");
    echo "  • ID: {$sp['id']} | Slated: {$dhakaTime} | {$firstLine}\n";
}

// 3. Check Instagram Business Account status
$igUrl = "https://graph.facebook.com/v19.0/{$igId}?fields=username,name,biography,website,profile_picture_url,followers_count,media_count&access_token=" . urlencode($pageToken);
$igRes = @file_get_contents($igUrl);
$igData = json_decode($igRes, true);
echo "\nInstagram Account Status (@" . ($igData['username'] ?? 'N/A') . "):\n";
echo "  • Name: " . ($igData['name'] ?? 'N/A') . "\n";
echo "  • Followers: " . ($igData['followers_count'] ?? 0) . " | Media: " . ($igData['media_count'] ?? 0) . "\n";
echo "  • Bio: " . (!empty($igData['biography']) ? $igData['biography'] : '[EMPTY - Needs Setup]') . "\n";
echo "  • Website: " . (!empty($igData['website']) ? $igData['website'] : '[MISSING - Needs Setup]') . "\n";
