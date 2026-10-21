<?= $this->extend('layouts/admin') ?>

<?= $this->section('content') ?>

<div class="admin-page-header">
    <div>
        <h1 class="admin-page-title">Google Drive Media CDN Synchronization</h1>
        <p class="admin-page-desc">Direct Cloud Sync &bull; Zero Local Images &bull; High-Speed Google CDN Delivery</p>
    </div>
    <div>
        <form action="/admin/drive-sync/run" method="POST" style="margin:0;">
            <?= csrf_field() ?>
            <button type="submit" class="admin-btn emerald" onclick="this.innerHTML='Syncing Drive...'; this.style.opacity='0.7';">
                &#x21bb; Run Drive Sync Now
            </button>
        </form>
    </div>
</div>

<!-- Metrics summary strip -->
<div class="admin-metrics-grid" style="grid-template-columns: repeat(3, 1fr);">
    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Indexed CDN Product Images</div>
        <div class="admin-metric-val" style="color: #10b981;"><?= (int) $totalImages ?></div>
        <div class="admin-metric-sub">Stored in MariaDB (lh3.googleusercontent.com/d/{id})</div>
    </div>
    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Linked Specimen Folders</div>
        <div class="admin-metric-val"><?= count($products) ?></div>
        <div class="admin-metric-sub">Target: /KERF_3D_MEDIA/Products/{slug}/</div>
    </div>
    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Sync Service Account</div>
        <div class="admin-metric-val" style="font-size: 20px; font-family: var(--font-mono); color: var(--admin-cyan);">
            kerf-3d-studio
        </div>
        <div class="admin-metric-sub">OAuth2 Service Account Token Valid</div>
    </div>
</div>

<!-- Product Drive Folders Directory -->
<div class="admin-card">
    <div class="admin-card-header">
        <h2 class="admin-card-title">Product Folder Direct Access on Google Drive</h2>
        <span style="font-family:var(--font-mono); font-size:11px; color:var(--admin-muted);">Drop images directly into these folders</span>
    </div>

    <div class="admin-table-wrap">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Product Specimen</th>
                    <th>Folder Slug</th>
                    <th>Google Drive Folder ID</th>
                    <th>Drive Action</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($products as $p): ?>
                    <tr>
                        <td><strong style="color:#fff;"><?= esc($p['name']) ?></strong></td>
                        <td class="admin-mono-cell" style="color:var(--admin-rust);"><?= esc($p['slug']) ?></td>
                        <td class="admin-mono-cell" style="font-size:11px;">
                            <?= !empty($p['drive_folder_id']) ? esc($p['drive_folder_id']) : '<span style="color:var(--admin-muted);">Unlinked</span>' ?>
                        </td>
                        <td>
                            <?php if (!empty($p['drive_folder_url'])): ?>
                                <a href="<?= esc($p['drive_folder_url']) ?>" target="_blank" class="admin-btn sm secondary">
                                    Open in Google Drive ↗
                                </a>
                            <?php else: ?>
                                <span style="font-family:var(--font-mono); font-size:11px; color:var(--admin-muted);">&mdash;</span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Drive Sync Execution Logs -->
<div class="admin-card">
    <div class="admin-card-header">
        <h2 class="admin-card-title">Recent Sync Operation History</h2>
    </div>

    <div class="admin-table-wrap">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Log ID</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Synced</th>
                    <th>Added</th>
                    <th>Updated</th>
                    <th>Removed</th>
                    <th>Started At</th>
                    <th>Completed At</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($recentLogs)): ?>
                    <tr>
                        <td colspan="9" style="text-align:center; padding:32px; color:var(--admin-muted);">
                            No sync history recorded yet. Click "Run Drive Sync Now" above to initiate.
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($recentLogs as $log): ?>
                        <tr>
                            <td class="admin-mono-cell">#<?= esc($log['id']) ?></td>
                            <td class="admin-mono-cell" style="text-transform:uppercase; font-size:11px;"><?= esc($log['sync_type']) ?></td>
                            <td>
                                <span class="admin-badge badge-<?= esc($log['status']) ?>">
                                    <?= esc($log['status']) ?>
                                </span>
                            </td>
                            <td class="admin-mono-cell"><?= (int) $log['products_synced'] ?></td>
                            <td class="admin-mono-cell" style="color:#10b981;">+<?= (int) $log['images_added'] ?></td>
                            <td class="admin-mono-cell" style="color:#f59e0b;">~<?= (int) $log['images_updated'] ?></td>
                            <td class="admin-mono-cell" style="color:#ef4444;">-<?= (int) $log['images_removed'] ?></td>
                            <td class="admin-mono-cell" style="font-size:11px;"><?= esc($log['started_at']) ?></td>
                            <td class="admin-mono-cell" style="font-size:11px;"><?= esc($log['completed_at'] ?? '&mdash;') ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection() ?>
