<?php

// ============================================================
// KERF 3D Studio - 7-Day Social & Storefront Health Audit
// ============================================================

require __DIR__ . '/social_manager.php';

echo "============================================================\n";
echo "GENERATING 7-DAY KERF 3D STUDIO HEALTH & ENGAGEMENT AUDIT\n";
echo "============================================================\n";

$auditDate = date('Y-m-d H:i:s T');
$report = "# KERF 3D Studio — 7-Day Performance & Health Audit\n\n";
$report .= "**Audit Date:** {$auditDate}\n\n";

// 1. Facebook Telemetry
echo "Auditing Facebook Page...\n";
$fbInfo = apiGet("{$pageId}?fields=name,followers_count,fan_count,verification_status,category", $pageToken);
$fbSched = apiGet("{$pageId}/scheduled_posts?fields=id,scheduled_publish_time,message&limit=20", $pageToken);

$fbFollowers = $fbInfo['data']['followers_count'] ?? 0;
$fbSchedCount = count($fbSched['data']['data'] ?? []);

$report .= "## 1. Facebook Channel Telemetry\n\n";
$report .= "* **Page Name:** " . ($fbInfo['data']['name'] ?? 'KERF 3D') . "\n";
$report .= "* **Followers:** {$fbFollowers}\n";
$report .= "* **Scheduled Posts Active:** {$fbSchedCount}\n";
$report .= "* **Recent Posts:**\n";

$fbFeed = apiGet("{$pageId}/feed?fields=id,message,created_time,shares,reactions.summary(true),comments.summary(true)&limit=5", $pageToken);
foreach ($fbFeed['data']['data'] ?? [] as $post) {
    $firstLine = strtok($post['message'] ?? 'Media Post', "\n");
    $reacts = $post['reactions']['summary']['total_count'] ?? 0;
    $comments = $post['comments']['summary']['total_count'] ?? 0;
    $shares = $post['shares']['count'] ?? 0;
    $report .= "  • `{$post['id']}`: \"{$firstLine}\" | 👍 {$reacts} | 💬 {$comments} | 🔄 {$shares}\n";
}

// 2. Instagram Telemetry
echo "Auditing Instagram Business Account...\n";
$igInfo = apiGet("{$igId}?fields=username,name,biography,website,followers_count,media_count", $pageToken);
$igMedia = apiGet("{$igId}/media?fields=id,caption,media_type,permalink,timestamp,like_count,comments_count&limit=5", $pageToken);

$igFollowers = $igInfo['data']['followers_count'] ?? 0;
$igMediaCount = $igInfo['data']['media_count'] ?? 0;

$report .= "\n## 2. Instagram Channel Telemetry\n\n";
$report .= "* **Handle:** @" . ($igInfo['data']['username'] ?? 'kerf3d') . "\n";
$report .= "* **Followers:** {$igFollowers}\n";
$report .= "* **Total Media Published:** {$igMediaCount}\n";
$report .= "* **Store Link:** " . ($igInfo['data']['website'] ?? 'Missing') . "\n";
$report .= "* **Recent Media Performance:**\n";

foreach ($igMedia['data']['data'] ?? [] as $m) {
    $cap = strtok($m['caption'] ?? 'Media', "\n");
    $likes = $m['like_count'] ?? 0;
    $comm = $m['comments_count'] ?? 0;
    $link = $m['permalink'] ?? '#';
    $report .= "  • [Post Link]({$link}): \"{$cap}\" | ❤️ {$likes} | 💬 {$comm}\n";
}

// 3. Storefront & Database Health
echo "Auditing Storefront & MariaDB Database...\n";
$conn = @mysqli_connect('db', 'kerf3d_user', 'kerf3d_secret', 'kerf3d');
if ($conn) {
    $pRes = mysqli_query($conn, "SELECT COUNT(*) as cnt FROM products WHERE status = 'active'");
    $pRow = mysqli_fetch_assoc($pRes);
    $activeProducts = $pRow['cnt'] ?? 0;

    $pegRes = mysqli_query($conn, "
        SELECT COUNT(*) as cnt FROM products 
        WHERE status = 'active' AND (
            name LIKE '%pegboard%' OR name LIKE '%skadis%' OR name LIKE '%tile%' OR name LIKE '%hook%' 
            OR name LIKE '%mount%' OR name LIKE '%organizer%' OR name LIKE '%tray%' OR name LIKE '%panel%'
            OR description LIKE '%pegboard%' OR description LIKE '%skadis%'
        )
    ");
    $pegRow = mysqli_fetch_assoc($pegRes);
    $pegCount = $pegRow['cnt'] ?? 0;

    $report .= "\n## 3. Storefront & Catalog Telemetry\n\n";
    $report .= "* **Active Store Products:** {$activeProducts}\n";
    $report .= "* **Pegboard & Organization Cluster:** {$pegCount} items\n";
    $report .= "* **Database Connection:** Nominal (MariaDB active)\n";
}

// 4. Strategic Recommendations
$report .= "\n## 4. Content & Growth Directives\n\n";
$report .= "1. **Pegboard Focus:** Prioritize high-contrast video reels showing modular attachments (hooks, rotating carousels, Kumiko tiles) locking into Skadis slots.\n";
$report .= "2. **Community Crossposting:** Share mechanical keyboard specimens (#425 Cheese Keycaps & #434 PH60Slim) into Arekta Keyboard Group (AKG).\n";
$report .= "3. **Next Check-In:** Slated in 7 days.\n";

$outFile = __DIR__ . '/../backups/weekly_audit_' . date('Ymd_His') . '.md';
file_put_contents($outFile, $report);

echo "\nAudit Complete! Report saved to {$outFile}\n";
echo "Preview:\n";
echo $report;
