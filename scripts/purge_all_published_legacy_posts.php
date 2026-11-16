<?php

require __DIR__ . '/social_manager.php';

echo "============================================================\n";
echo "KERF 3D - PURGING ALL REMAINING PUBLISHED LEGACY POSTS\n";
echo "============================================================\n";

// 1. Get all scheduled post IDs to make 100% sure we don't touch them
$schedUrl = "{$pageId}/scheduled_posts?fields=id&limit=100";
$schedRes = apiGet($schedUrl, $pageToken);
$scheduledIds = [];
if (!empty($schedRes['data']['data'])) {
    foreach ($schedRes['data']['data'] as $sp) {
        $scheduledIds[$sp['id']] = true;
    }
}
echo "Identified " . count($scheduledIds) . " scheduled posts to protect.\n";

// 2. Paginate through all published posts
$allLegacyPosts = [];
$url = "{$pageId}/published_posts?fields=id,message,created_time,shares,comments.summary(true),reactions.summary(true)&limit=50";

do {
    $res = apiGet($url, $pageToken);
    if (!empty($res['data']['data'])) {
        foreach ($res['data']['data'] as $post) {
            // Only add if not in scheduled
            if (!isset($scheduledIds[$post['id']])) {
                $allLegacyPosts[] = $post;
            }
        }
    }
    $url = null;
    if (!empty($res['data']['paging']['next'])) {
        $parts = parse_url($res['data']['paging']['next']);
        $url = ltrim($parts['path'], '/') . '?' . ($parts['query'] ?? '');
    }
} while ($url);

echo "Found " . count($allLegacyPosts) . " published legacy posts to purge.\n";

if (empty($allLegacyPosts)) {
    echo "No legacy published posts found. Feed is clean!\n";
    exit(0);
}

// Backup before deletion
$backupFile = __DIR__ . '/../backups/legacy_posts_backup_' . date('Ymd_His') . '.json';
file_put_contents($backupFile, json_encode($allLegacyPosts, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
echo "Backed up " . count($allLegacyPosts) . " posts to {$backupFile}\n";

$deletedCount = 0;
foreach ($allLegacyPosts as $i => $post) {
    $num = $i + 1;
    $res = apiDelete($post['id'], $pageToken);
    if (!empty($res['data']['success'])) {
        $deletedCount++;
        echo "[{$num}/" . count($allLegacyPosts) . "] ✔ Deleted: {$post['id']}\n";
    } else {
        echo "[{$num}/" . count($allLegacyPosts) . "] ✖ Failed: {$post['id']} - " . json_encode($res['data']) . "\n";
    }
    usleep(250000); // 250ms sleep
}

echo "============================================================\n";
echo "PURGE COMPLETE: Deleted {$deletedCount} of " . count($allLegacyPosts) . " posts.\n";
echo "============================================================\n";
