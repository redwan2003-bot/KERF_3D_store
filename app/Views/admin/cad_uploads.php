<?= $this->extend('layouts/admin') ?>

<?= $this->section('content') ?>

<div class="admin-page-header">
    <div>
        <h1 class="admin-page-title">Customer CAD Intake & Mesh Archive</h1>
        <p class="admin-page-desc">STL / OBJ / 3MF Meshes Streamed Directly to Google Drive &bull; Bambu Lab A1 Verification</p>
    </div>
    <div>
        <a href="/admin" class="admin-btn secondary">&larr; Back to Dashboard</a>
    </div>
</div>

<!-- Search & Controls Toolbar -->
<div style="background: var(--admin-panel); border: 1px solid var(--admin-border); padding: 18px 24px; margin-bottom: 24px; display: flex; gap: 16px; align-items: center; justify-content: space-between; flex-wrap: wrap;">
    <div style="position: relative; flex: 1 1 320px; max-width: 480px;">
        <input type="text" id="admin-cad-search" placeholder="Type to search CAD files (Filename, Format, Material)..." 
               style="width: 100%; box-sizing: border-box; background: var(--admin-bg); border: 1px solid var(--admin-border-light); color: #fff; font-family: var(--font-mono); font-size: 13px; padding: 10px 14px; outline: none;">
        <button type="button" id="admin-cad-clear" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: transparent; border: 0; color: var(--admin-muted); cursor: pointer; display: none; font-size: 14px;">✕</button>
    </div>
    <div style="display: flex; gap: 12px; align-items: center;">
        <span style="font-family: var(--font-mono); font-size: 12px; color: var(--admin-muted);">
            SHOWING <strong id="admin-cad-visible" style="color: #fff;"><?= count($uploads) ?></strong> OF <strong><?= count($uploads) ?></strong> MESHES
        </span>
        <a href="/quote" target="_blank" rel="noopener" class="admin-btn sm secondary">Test 3D Quoter ↗</a>
    </div>
</div>

<div class="admin-card">
    <div class="admin-table-wrap">
        <table class="admin-table" id="admin-cad-table">
            <thead>
                <tr>
                    <th>Filename</th>
                    <th>Format</th>
                    <th>Size (MB)</th>
                    <th>Est. Weight</th>
                    <th>Material Target</th>
                    <th>A1 Fit</th>
                    <th>Quoted Total</th>
                    <th>Upload Time</th>
                    <th>Bambu Studio Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($uploads)): ?>
                    <tr id="admin-cad-empty-row">
                        <td colspan="9" style="text-align:center; padding:48px; color:var(--admin-muted);">
                            No customer CAD meshes recorded yet. Files uploaded via <code>/quote</code> will stream directly to Google Drive.
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($uploads as $u): ?>
                        <tr class="admin-cad-row"
                            data-filename="<?= esc(strtolower($u['original_filename'])) ?>"
                            data-format="<?= esc(strtolower($u['file_extension'])) ?>"
                            data-material="<?= esc(strtolower($u['material_name'] ?? 'pla')) ?>">
                            <td>
                                <strong style="color:#fff;"><?= esc($u['original_filename']) ?></strong>
                            </td>
                            <td class="admin-mono-cell" style="font-weight:700; color:var(--admin-purple); text-transform:uppercase;">
                                <?= esc($u['file_extension']) ?>
                            </td>
                            <td class="admin-mono-cell">
                                <?= round($u['file_size_bytes'] / 1024 / 1024, 2) ?> MB
                            </td>
                            <td class="admin-mono-cell">
                                <?= !empty($u['estimated_grams']) ? esc($u['estimated_grams']) . 'g' : '&mdash;' ?>
                            </td>
                            <td>
                                <?= !empty($u['material_name']) ? esc($u['material_name']) : 'PLA (Default)' ?>
                            </td>
                            <td>
                                <span class="admin-badge badge-paid" style="font-size:9px;">
                                    <?= $u['fits_build_volume'] ? '256³ OK' : 'OVERSIZED' ?>
                                </span>
                            </td>
                            <td class="admin-mono-cell" style="font-weight:700;">
                                <?= !empty($u['quote_total_bdt']) ? '৳' . number_format((float) $u['quote_total_bdt'], 2) : '&mdash;' ?>
                            </td>
                            <td class="admin-mono-cell" style="font-size:11px; color:var(--admin-muted);">
                                <?= date('Y-m-d H:i', strtotime($u['uploaded_at'])) ?>
                            </td>
                            <td>
                                <div style="display: flex; gap: 6px; align-items: center;">
                                    <?php if (!empty($u['drive_file_id'])): ?>
                                        <a href="https://drive.google.com/uc?export=download&id=<?= esc($u['drive_file_id']) ?>" class="admin-btn sm" style="background:#10b981; border-color:#059669; color:#fff;" title="Direct download file for Bambu Studio slicing">
                                            Download ↓
                                        </a>
                                    <?php endif; ?>
                                    <a href="<?= esc($u['drive_url']) ?>" target="_blank" rel="noopener" class="admin-btn sm secondary" title="View file in Google Drive">
                                        Drive ↗
                                    </a>
                                </div>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    <tr id="admin-cad-search-empty" style="display: none;">
                        <td colspan="9" style="text-align:center; padding:48px; color:var(--admin-muted); font-family:var(--font-mono);">
                            NO CAD MESHES MATCH SEARCH QUERY.
                        </td>
                    </tr>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script>
(function() {
    const searchInput = document.getElementById('admin-cad-search');
    const clearBtn = document.getElementById('admin-cad-clear');
    const visibleCount = document.getElementById('admin-cad-visible');
    const rows = Array.from(document.querySelectorAll('.admin-cad-row'));
    const emptyRow = document.getElementById('admin-cad-search-empty');
    const totalCount = rows.length;

    if (!searchInput) return;

    function filterCad() {
        const query = searchInput.value.trim().toLowerCase();
        let matches = 0;

        if (!query) {
            rows.forEach(r => r.style.display = '');
            if (clearBtn) clearBtn.style.display = 'none';
            if (emptyRow) emptyRow.style.display = 'none';
            if (visibleCount) visibleCount.innerText = totalCount;
            return;
        }

        if (clearBtn) clearBtn.style.display = 'block';

        rows.forEach(r => {
            const file = r.getAttribute('data-filename') || '';
            const fmt = r.getAttribute('data-format') || '';
            const mat = r.getAttribute('data-material') || '';
            const haystack = file + ' ' + fmt + ' ' + mat;

            if (haystack.includes(query)) {
                r.style.display = '';
                matches++;
            } else {
                r.style.display = 'none';
            }
        });

        if (visibleCount) visibleCount.innerText = matches;
        if (emptyRow) {
            emptyRow.style.display = (matches === 0) ? '' : 'none';
        }
    }

    searchInput.addEventListener('input', filterCad);
    if (clearBtn) {
        clearBtn.addEventListener('click', function() {
            searchInput.value = '';
            filterCad();
            searchInput.focus();
        });
    }
})();
</script>
<?= $this->endSection() ?>
