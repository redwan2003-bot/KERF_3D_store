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

<div class="admin-card">
    <div class="admin-card-header">
        <h2 class="admin-card-title">CAD Meshes in /KERF_3D_MEDIA/Customer_Uploads/</h2>
        <a href="/quote" target="_blank" class="admin-btn sm secondary">Test CAD Quoter ↗</a>
    </div>

    <div class="admin-table-wrap">
        <table class="admin-table">
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
                    <th>Google Drive</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($uploads)): ?>
                    <tr>
                        <td colspan="9" style="text-align:center; padding:48px; color:var(--admin-muted);">
                            No customer CAD meshes recorded yet. Files uploaded via <code>/quote</code> will stream directly to Google Drive.
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($uploads as $u): ?>
                        <tr>
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
                                <a href="<?= esc($u['drive_url']) ?>" target="_blank" class="admin-btn sm" style="background:#4a321f; border-color:#6d482c;">
                                    Inspect in Drive ↗
                                </a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection() ?>
