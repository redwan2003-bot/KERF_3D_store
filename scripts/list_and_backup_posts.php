<?php

require __DIR__ . '/social_manager.php';

$allPosts = [];
$url = "{$pageId}/feed?fields=id,message,created_time,permalink_url,shares,reactions.summary(true),comments.summary(true)&limit=50";

do {
    $res = apiGet($url, $pageToken);
    if (!empty($res['data']['data'])) {
        foreach ($res['data']['data'] as $p) {
            $allPosts[] = $p;
        }
    }
    $url = null;
    if (!empty($res['data']['paging']['next'])) {
        $nextUrl = $res['data']['paging']['next'];
        // Parse endpoint from full nextUrl
        $parts = parse_url($nextUrl);
        $url = ltrim($parts['path'], '/') . '?' . $parts['query'];
    }
} while ($url);

echo "Total Facebook posts found: " . count($allPosts) . "\n";

// Save full backup
$backupFile = __DIR__ . '/../backups/facebook_posts_backup_' . date('Ymd_His') . '.json';
if (!is_dir(dirname($backupFile))) {
    mkdir(dirname($backupFile), 0777, true);
}
file_put_contents($backupFile, json_encode($allPosts, JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
echo "Saved backup to: $backupFile\n";

foreach ($allPosts as $idx => $p) {
    $num = $idx + 1;
    $date = date('Y-m-d H:i', strtotime($p['created_time']));
    $msg = $p['message'] ?? '(No text caption)';
    echo "\n#{$num} [ID: {$p['id']}] Date: {$date}\n";
    echo "   Caption: \"" . substr($msg, 0, 100) . (strlen($msg) > 100 ? '...' : '') . "\"\n";
}
