<?= $this->extend('layouts/admin') ?>

<?= $this->section('content') ?>

<div class="admin-page-header">
    <div>
        <h1 class="admin-page-title">Google Drive Media CDN Synchronization</h1>
        <p class="admin-page-desc">Direct Cloud Sync &bull; Zero Local Images &bull; High-Speed Google CDN Delivery</p>
    </div>
    <div>
        <form action="/admin/drive-sync/run" method="POST" style="margin:0;" onsubmit="const b = this.querySelector('button'); b.disabled = true; b.innerHTML = '&#x21bb; Synchronizing Google Drive CDN...'; b.style.opacity = '0.75';">
            <?= csrf_field() ?>
            <button type="submit" class="admin-btn emerald">
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

<!-- Product Drive Folders Directory with Real-Time Search -->
<div class="admin-card">
    <div class="admin-card-header" style="flex-wrap: wrap; gap: 12px;">
        <div>
            <h2 class="admin-card-title">Product Folder Directory on Google Drive</h2>
            <span style="font-family:var(--font-mono); font-size:11px; color:var(--admin-muted);">425 Linked Specimen Folders</span>
        </div>
        <div style="position: relative; width: 340px;">
            <input type="text" id="admin-drive-search" placeholder="Type to filter folders (Name, Slug, Folder ID)..." 
                   style="width: 100%; box-sizing: border-box; background: var(--admin-bg); border: 1px solid var(--admin-border-light); color: #fff; font-family: var(--font-mono); font-size: 12px; padding: 8px 12px; outline: none;">
            <button type="button" id="admin-drive-clear" style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%); background: transparent; border: 0; color: var(--admin-muted); cursor: pointer; display: none; font-size: 13px;">✕</button>
        </div>
    </div>

    <div class="admin-table-wrap" style="max-height: 520px; overflow-y: auto;">
        <table class="admin-table" id="admin-drive-table">
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
                    <tr class="admin-drive-row"
                        data-name="<?= esc(strtolower($p['name'])) ?>"
                        data-slug="<?= esc(strtolower($p['slug'])) ?>"
                        data-folderid="<?= esc(strtolower($p['drive_folder_id'] ?? '')) ?>">
                        <td><strong style="color:#fff;"><?= esc($p['name']) ?></strong></td>
                        <td class="admin-mono-cell" style="color:var(--admin-rust);"><?= esc($p['slug']) ?></td>
                        <td class="admin-mono-cell" style="font-size:11px;">
                            <?= !empty($p['drive_folder_id']) ? esc($p['drive_folder_id']) : '<span style="color:var(--admin-muted);">Unlinked</span>' ?>
                        </td>
                        <td>
                            <?php if (!empty($p['drive_folder_url'])): ?>
                                <a href="<?= esc($p['drive_folder_url']) ?>" target="_blank" rel="noopener" class="admin-btn sm secondary">
                                    Open in Google Drive ↗
                                </a>
                            <?php else: ?>
                                <span style="font-family:var(--font-mono); font-size:11px; color:var(--admin-muted);">&mdash;</span>
                            <?php endif; ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
                <tr id="admin-drive-search-empty" style="display: none;">
                    <td colspan="4" style="text-align:center; padding:36px; color:var(--admin-muted); font-family:var(--font-mono);">
                        NO SPECIMEN FOLDERS MATCH SEARCH QUERY.
                    </td>
                </tr>
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
                            No sync runs recorded yet. Click "Run Drive Sync Now" above to initiate a scan.
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($recentLogs as $log): ?>
                        <tr>
                            <td class="admin-mono-cell">#<?= esc($log['id']) ?></td>
                            <td class="admin-mono-cell"><?= esc($log['sync_type']) ?></td>
                            <td>
                                <span class="admin-badge badge-<?= $log['status'] === 'success' ? 'verified' : ($log['status'] === 'failed' ? 'failed' : 'pending') ?>">
                                    <?= esc(strtoupper($log['status'])) ?>
                                </span>
                            </td>
                            <td class="admin-mono-cell"><?= (int) $log['products_synced'] ?></td>
                            <td class="admin-mono-cell"><?= (int) $log['images_added'] ?></td>
                            <td class="admin-mono-cell"><?= (int) $log['images_updated'] ?></td>
                            <td class="admin-mono-cell"><?= (int) $log['images_removed'] ?></td>
                            <td class="admin-mono-cell" style="font-size:11px; color:var(--admin-muted);">
                                <?= esc($log['started_at']) ?>
                            </td>
                            <td class="admin-mono-cell" style="font-size:11px; color:var(--admin-muted);">
                                <?= esc($log['completed_at'] ?? 'In Progress') ?>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script>
(function() {
    const searchInput = document.getElementById('admin-drive-search');
    const clearBtn = document.getElementById('admin-drive-clear');
    const rows = Array.from(document.querySelectorAll('.admin-drive-row'));
    const emptyRow = document.getElementById('admin-drive-search-empty');

    if (!searchInput) return;

    function filterDrive() {
        const query = searchInput.value.trim().toLowerCase();
        let matches = 0;

        if (!query) {
            rows.forEach(r => r.style.display = '');
            if (clearBtn) clearBtn.style.display = 'none';
            if (emptyRow) emptyRow.style.display = 'none';
            return;
        }

        if (clearBtn) clearBtn.style.display = 'block';

        rows.forEach(r => {
            const name = r.getAttribute('data-name') || '';
            const slug = r.getAttribute('data-slug') || '';
            const fid = r.getAttribute('data-folderid') || '';
            const haystack = name + ' ' + slug + ' ' + fid;

            if (haystack.includes(query)) {
                r.style.display = '';
                matches++;
            } else {
                r.style.display = 'none';
            }
        });

        if (emptyRow) {
            emptyRow.style.display = (matches === 0) ? '' : 'none';
        }
    }

    searchInput.addEventListener('input', filterDrive);
    if (clearBtn) {
        clearBtn.addEventListener('click', function() {
            searchInput.value = '';
            filterDrive();
            searchInput.focus();
        });
    }
})();
</script>
<?= $this->endSection() ?>
