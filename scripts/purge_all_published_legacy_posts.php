<?php

// ============================================================
// KERF 3D Studio - Comprehensive Facebook Feed Purge
// ============================================================

require __DIR__ . '/social_manager.php';

echo "============================================================\n";
echo "KERF 3D - COMPREHENSIVE FEED PURGE (RUNNING UNTIL ZERO)\n";
echo "============================================================\n";

// 1. Identify all scheduled post IDs to protect
$schedRes = apiGet("{$pageId}/scheduled_posts?fields=id&limit=100", $pageToken);
$scheduledIds = [];
if (!empty($schedRes['data']['data'])) {
    foreach ($schedRes['data']['data'] as $sp) {
        $scheduledIds[$sp['id']] = true;
    }
}
echo "Identified " . count($scheduledIds) . " scheduled posts to protect.\n";

$totalDeleted = 0;
$iteration = 0;

// 2. Loop continuously on published_posts until count is 0
while (true) {
    $iteration++;
    echo "\n--- Batch #{$iteration}: Fetching published posts ---\n";
    $res = apiGet("{$pageId}/published_posts?fields=id,message,created_time&limit=100", $pageToken);
    $posts = $res['data']['data'] ?? [];
    
    $batchToDelete = [];
    foreach ($posts as $p) {
        if (!isset($scheduledIds[$p['id']])) {
            $batchToDelete[] = $p;
        }
    }

    $count = count($batchToDelete);
    echo "Found {$count} posts in this batch.\n";

    if ($count === 0) {
        echo "No more posts found in published_posts!\n";
        break;
    }

    // Save batch backup
    $backupFile = __DIR__ . "/../backups/legacy_batch_{$iteration}_" . date('Ymd_His') . ".json";
    file_put_contents($backupFile, json_encode($batchToDelete, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));

    foreach ($batchToDelete as $i => $post) {
        $idx = $i + 1;
        $dRes = apiDelete($post['id'], $pageToken);
        if (!empty($dRes['data']['success'])) {
            $totalDeleted++;
            echo " [{$idx}/{$count}] (Total: {$totalDeleted}) ✔ Deleted: {$post['id']}\n";
        } else {
            echo " [{$idx}/{$count}] ✖ Failed: {$post['id']} - " . json_encode($dRes['data']) . "\n";
        }
        usleep(200000); // 200ms delay
    }
}

// 3. Final Sweep: Check /feed for any orphaned user posts or shared posts
echo "\n--- Final Sweep: Checking /feed for any remaining posts ---\n";
$feedRes = apiGet("{$pageId}/feed?fields=id,is_published,scheduled_publish_time&limit=100", $pageToken);
$feedPosts = $feedRes['data']['data'] ?? [];
$orphaned = 0;
foreach ($feedPosts as $fp) {
    if (!isset($scheduledIds[$fp['id']])) {
        $orphaned++;
        echo "Deleting orphaned feed item: {$fp['id']}...\n";
        apiDelete($fp['id'], $pageToken);
        $totalDeleted++;
        usleep(200000);
    }
}

echo "\n============================================================\n";
echo "PURGE FINISHED: Successfully deleted {$totalDeleted} legacy posts total!\n";
echo "============================================================\n";
