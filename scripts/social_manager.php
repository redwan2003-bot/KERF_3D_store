<?php

// ============================================================
// KERF 3D Studio - Meta Graph API Social Manager
// ============================================================

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
$userToken = $env['META_USER_ACCESS_TOKEN'] ?? null;
$pageToken = $env['FB_PAGE_ACCESS_TOKEN'] ?? null;
$pageId    = $env['FB_PAGE_ID'] ?? null;
$igId      = $env['IG_BUSINESS_ACCOUNT_ID'] ?? null;

function apiGet($endpoint, $token) {
    $url = "https://graph.facebook.com/v19.0/" . ltrim($endpoint, '/') . (strpos($endpoint, '?') !== false ? '&' : '?') . "access_token=" . urlencode($token);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 15);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Kerf3dStudio/1.0');
    $res = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return ['code' => $code, 'data' => json_decode($res, true)];
}

function apiPost($endpoint, $payload, $token) {
    $url = "https://graph.facebook.com/v19.0/" . ltrim($endpoint, '/') . "?access_token=" . urlencode($token);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload));
    curl_setopt($ch, CURLOPT_TIMEOUT, 20);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Kerf3dStudio/1.0');
    $res = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return ['code' => $code, 'data' => json_decode($res, true)];
}

$action = $argv[1] ?? 'audit';

if ($action === 'audit') {
    echo "============================================================\n";
    echo "KERF 3D STUDIO - SOCIAL AUDIT REPORT (Meta Graph API)\n";
    echo "============================================================\n";

    // 1. Facebook Page Audit
    echo "\n[1] FACEBOOK BUSINESS PAGE AUDIT:\n";
    $pInfo = apiGet("{$pageId}?fields=name,about,description,fan_count,followers_count,link,website,phone,category,single_line_address", $pageToken);
    if ($pInfo['code'] === 200) {
        $p = $pInfo['data'];
        echo " - Name: " . ($p['name'] ?? 'N/A') . "\n";
        echo " - Page ID: " . ($p['id'] ?? 'N/A') . "\n";
        echo " - Category: " . ($p['category'] ?? 'N/A') . "\n";
        echo " - Followers / Fans: " . ($p['followers_count'] ?? $p['fan_count'] ?? 0) . "\n";
        echo " - Website Linked: " . ($p['website'] ?? 'Missing') . "\n";
        echo " - Phone: " . ($p['phone'] ?? 'Missing') . "\n";
        echo " - Bio / About: " . ($p['about'] ?? 'Missing') . "\n";
    } else {
        echo " Error fetching Page details: " . json_encode($pInfo['data']) . "\n";
    }

    // 2. Instagram Profile Audit
    echo "\n[2] INSTAGRAM BUSINESS PROFILE AUDIT:\n";
    if ($igId) {
        $igInfo = apiGet("{$igId}?fields=username,name,biography,website,followers_count,follows_count,media_count,profile_picture_url", $pageToken);
        if ($igInfo['code'] === 200) {
            $ig = $igInfo['data'];
            echo " - Username: @" . ($ig['username'] ?? 'N/A') . "\n";
            echo " - Display Name: " . ($ig['name'] ?? 'N/A') . "\n";
            echo " - Instagram ID: " . ($ig['id'] ?? 'N/A') . "\n";
            echo " - Followers: " . ($ig['followers_count'] ?? 0) . "\n";
            echo " - Following: " . ($ig['follows_count'] ?? 0) . "\n";
            echo " - Media / Posts Count: " . ($ig['media_count'] ?? 0) . "\n";
            echo " - Bio: " . (!empty($ig['biography']) ? $ig['biography'] : '(Empty - Needs optimization)') . "\n";
            echo " - Website: " . (!empty($ig['website']) ? $ig['website'] : '(Missing - Needs https://kerf3d.store)') . "\n";
        } else {
            echo " Error fetching Instagram details: " . json_encode($igInfo['data']) . "\n";
        }
    } else {
        echo " No Instagram Business Account connected.\n";
    }

    // 3. Permission Capabilities Check
    echo "\n[3] PERMISSIONS & CAPABILITIES AUDIT:\n";
    $perms = apiGet("me/permissions", $userToken);
    $activePerms = [];
    if (isset($perms['data']['data'])) {
        foreach ($perms['data']['data'] as $perm) {
            if ($perm['status'] === 'granted') {
                $activePerms[] = $perm['permission'];
            }
        }
    }
    
    $required = [
        'pages_show_list' => 'Identify connected pages',
        'pages_read_engagement' => 'Read engagement & metrics',
        'pages_manage_posts' => 'Publish & schedule posts to Facebook',
        'pages_read_user_content' => 'Read page posts & comments',
        'instagram_basic' => 'Access Instagram profile & media',
        'instagram_content_publish' => 'Publish & schedule posts to Instagram feed',
        'read_insights' => 'Read analytics & reach insights'
    ];

    foreach ($required as $r => $desc) {
        $status = in_array($r, $activePerms) ? "✔ GRANTED" : "✖ MISSING (Optional for advanced scheduling)";
        echo " - {$r}: {$status} ({$desc})\n";
    }
}
