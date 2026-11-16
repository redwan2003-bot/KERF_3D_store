<?php

// ============================================================
// KERF 3D Studio - Meta Graph API Social Manager (Production)
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
    return ['code' => $code, 'data' => json_decode($res, true), 'raw' => $res];
}

function apiPost($endpoint, $payload, $token) {
    $url = "https://graph.facebook.com/v19.0/" . ltrim($endpoint, '/') . "?access_token=" . urlencode($token);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($payload));
    curl_setopt($ch, CURLOPT_TIMEOUT, 25);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Kerf3dStudio/1.0');
    $res = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return ['code' => $code, 'data' => json_decode($res, true), 'raw' => $res];
}

function apiDelete($endpoint, $token) {
    $url = "https://graph.facebook.com/v19.0/" . ltrim($endpoint, '/') . "?access_token=" . urlencode($token);
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "DELETE");
    curl_setopt($ch, CURLOPT_TIMEOUT, 20);
    curl_setopt($ch, CURLOPT_USERAGENT, 'Kerf3dStudio/1.0');
    $res = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    curl_close($ch);
    return ['code' => $code, 'data' => json_decode($res, true), 'raw' => $res];
}

$action = $argv[1] ?? 'audit';

if ($action === 'audit') {
    echo "============================================================\n";
    echo "KERF 3D STUDIO - FULL META GRAPH SOCIAL AUDIT\n";
    echo "============================================================\n";

    $pInfo = apiGet("{$pageId}?fields=name,about,fan_count,followers_count,website,phone,category", $pageToken);
    if ($pInfo['code'] === 200) {
        $p = $pInfo['data'];
        echo "Facebook Page: " . ($p['name'] ?? 'N/A') . " (ID: {$pageId})\n";
        echo "Followers: " . ($p['followers_count'] ?? 0) . " | Category: " . ($p['category'] ?? 'N/A') . "\n";
    }

    $igInfo = apiGet("{$igId}?fields=username,name,biography,website,followers_count,media_count", $pageToken);
    if ($igInfo['code'] === 200) {
        $ig = $igInfo['data'];
        echo "\nInstagram: @" . ($ig['username'] ?? 'N/A') . " (ID: {$igId})\n";
        echo "Followers: " . ($ig['followers_count'] ?? 0) . " | Media: " . ($ig['media_count'] ?? 0) . "\n";
        echo "Bio: " . ($ig['biography'] ?: '[Empty]') . "\n";
        echo "Website: " . ($ig['website'] ?: '[Missing]') . "\n";
    }
} elseif ($action === 'test-delete') {
    $targetId = $argv[2] ?? null;
    if (!$targetId) {
        die("Provide post id: php social_manager.php test-delete <post_id>\n");
    }
    echo "Attempting to delete post: $targetId\n";
    $res = apiDelete($targetId, $pageToken);
    print_r($res);
} elseif ($action === 'delete-all-posts') {
    $confirm = $argv[2] ?? '';
    if ($confirm !== '--confirm') {
        die("Safety check: must pass --confirm to delete all existing Facebook posts.\n");
    }

    // First fetch all posts
    $allPosts = [];
    $url = "{$pageId}/feed?fields=id,message,created_time&limit=50";
    do {
        $res = apiGet($url, $pageToken);
        if (!empty($res['data']['data'])) {
            foreach ($res['data']['data'] as $p) {
                $allPosts[] = $p;
            }
        }
        $url = null;
        if (!empty($res['data']['paging']['next'])) {
            $parts = parse_url($res['data']['paging']['next']);
            $url = ltrim($parts['path'], '/') . '?' . ($parts['query'] ?? '');
        }
    } while ($url);

    echo "Found " . count($allPosts) . " posts to delete.\n";
    $deleted = 0;
    foreach ($allPosts as $p) {
        $del = apiDelete($p['id'], $pageToken);
        if (!empty($del['data']['success'])) {
            $deleted++;
            echo "✔ Deleted: {$p['id']}\n";
        } else {
            echo "✖ Failed deleting {$p['id']}: " . json_encode($del['data']) . "\n";
        }
        usleep(300000); // 300ms pause to respect rate limits
    }
    echo "Completed! Deleted $deleted of " . count($allPosts) . " posts.\n";
} elseif ($action === 'publish-fb-post') {
    $message = $argv[2] ?? 'Test from Kerf 3D';
    $link = $argv[3] ?? 'https://kerf3d.store/';
    $scheduledTime = $argv[4] ?? null; // UNIX timestamp

    $payload = [
        'message' => $message,
        'link'    => $link
    ];

    if ($scheduledTime) {
        $payload['published'] = 'false';
        $payload['scheduled_publish_time'] = $scheduledTime;
    }

    $res = apiPost("{$pageId}/feed", $payload, $pageToken);
    print_r($res);
} elseif ($action === 'publish-ig-post') {
    $imageUrl = $argv[2] ?? null;
    $caption  = $argv[3] ?? '';

    if (!$imageUrl) {
        die("Usage: php social_manager.php publish-ig-post <image_url> <caption>\n");
    }

    // Step 1: Create media container
    echo "Creating Instagram media container...\n";
    $containerRes = apiPost("{$igId}/media", [
        'image_url' => $imageUrl,
        'caption'   => $caption
    ], $pageToken);

    if (empty($containerRes['data']['id'])) {
        die("Failed creating container: " . json_encode($containerRes) . "\n");
    }

    $containerId = $containerRes['data']['id'];
    echo "Container created: $containerId\n";

    // Wait 3 seconds for Meta to fetch and process the image
    sleep(3);

    // Step 2: Publish container
    echo "Publishing container to Instagram feed...\n";
    $pubRes = apiPost("{$igId}/media_publish", [
        'creation_id' => $containerId
    ], $pageToken);

    print_r($pubRes);
}
