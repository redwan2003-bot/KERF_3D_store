<?= $this->extend('layouts/admin') ?>

<?= $this->section('content') ?>

<div class="admin-page-header">
    <div>
        <h1 class="admin-page-title">Workshop Command Dashboard</h1>
        <p class="admin-page-desc">Precision FDM Manufacturing Intake & Google Drive CDN Telemetry</p>
    </div>
    <div>
        <a href="/admin/orders" class="admin-btn">View All Orders &rarr;</a>
    </div>
</div>

<!-- 3D Neural Lattice Command Viewport -->
<div class="admin-3d-card">
    <div class="admin-3d-header">
        <div class="admin-3d-title">
            <span style="display:inline-block; width:10px; height:10px; background:#c86446;"></span>
            Studio State Neural Lattice // Live 3D Additive Telemetry
        </div>
        <div style="font-family: var(--font-mono); font-size: 11px; color: var(--admin-muted);">
            WebGL 2.0 &bull; Three.js r128 &bull; 60 FPS
        </div>
    </div>

    <div class="admin-3d-viewport" id="k3d-3d-canvas-container">
        <!-- Telemetry HUD Overlay -->
        <div class="admin-3d-hud" id="k3d-telemetry-hud">
            <div><strong>CORE TELEMETRY:</strong> <span style="color:#10b981">ONLINE</span></div>
            <div>Bambu A1 Jobs: <strong><?= (int) $printingOrders ?> Active / <?= (int) $receivedOrders ?> Queued</strong></div>
            <div>Nozzle: <strong>220&deg;C</strong> | Bed: <strong>60&deg;C</strong></div>
            <div>Drive CDN: <strong style="color:#10b981"><?= esc(strtoupper($lastSync['status'] ?? 'READY')) ?></strong></div>
            <div>CAD Intake: <strong><?= (int) $uploadsCount ?> Meshes</strong></div>
        </div>

        <!-- Interactive Hint -->
        <div class="admin-3d-controls-hint">
            &circlearrowright; Drag to rotate in 3D &bull; Real-time node orbital tracking
        </div>

        <!-- Nodes Legend -->
        <div class="admin-3d-nodes-legend">
            <div class="admin-legend-item">
                <span class="admin-legend-dot" style="background:#f59e0b;"></span>
                <span>Bambu A1</span>
            </div>
            <div class="admin-legend-item">
                <span class="admin-legend-dot" style="background:#10b981;"></span>
                <span>Drive CDN</span>
            </div>
            <div class="admin-legend-item">
                <span class="admin-legend-dot" style="background:#06b6d4;"></span>
                <span>MFS Ledger</span>
            </div>
            <div class="admin-legend-item">
                <span class="admin-legend-dot" style="background:#a855f7;"></span>
                <span>CAD Intake</span>
            </div>
        </div>
    </div>
</div>

<!-- Key Performance Metrics Grid -->
<div class="admin-metrics-grid">
    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Total Workshop Orders</div>
        <div class="admin-metric-val"><?= (int) $ordersCount ?></div>
        <div class="admin-metric-sub"><?= (int) $deliveredOrders ?> Delivered &bull; <?= (int) $receivedOrders ?> Received</div>
    </div>

    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Bambu Lab A1 Queue</div>
        <div class="admin-metric-val" style="color: #f59e0b;"><?= (int) $printingOrders ?></div>
        <div class="admin-metric-sub">Active Printing Bed Jobs</div>
    </div>

    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Pending MFS Verifications</div>
        <div class="admin-metric-val" style="color: <?= $pendingPayments > 0 ? '#ef4444' : '#10b981' ?>;">
            <?= (int) $pendingPayments ?>
        </div>
        <div class="admin-metric-sub">bKash / Nagad TrxIDs awaiting review</div>
    </div>

    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Total Inflow Volume</div>
        <div class="admin-metric-val" style="color: #10b981;">৳<?= number_format($totalGross, 2) ?></div>
        <div class="admin-metric-sub">Verified & On-hold Revenue (BDT)</div>
    </div>

    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Active Catalog Artifacts</div>
        <div class="admin-metric-val"><?= (int) $productsCount ?></div>
        <div class="admin-metric-sub">Curated Ready-Made Specimens</div>
    </div>

    <div class="admin-metric-card">
        <div class="admin-metric-kicker">Customer CAD Meshes</div>
        <div class="admin-metric-val" style="color: #a855f7;"><?= (int) $uploadsCount ?></div>
        <div class="admin-metric-sub">Stored on Google Drive</div>
    </div>
</div>

<!-- Two-Column Operational Workbench -->
<div class="admin-grid-2col">
    <!-- Left: Recent Orders Intake -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h2 class="admin-card-title">Recent Order Intake</h2>
            <a href="/admin/orders" class="admin-btn sm secondary">Full List &rarr;</a>
        </div>
        <div class="admin-table-wrap">
            <table class="admin-table">
                <thead>
                    <tr>
                        <th>Order</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>TrxID</th>
                        <th>Payment</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if (empty($recentOrders)): ?>
                        <tr>
                            <td colspan="7" style="text-align:center; padding:32px; color:var(--admin-muted);">
                                No orders in the system yet. Place a test checkout or await customer submission.
                            </td>
                        </tr>
                    <?php else: ?>
                        <?php foreach ($recentOrders as $order): ?>
                            <tr>
                                <td class="admin-mono-cell">
                                    <a href="/admin/orders/<?= esc($order['id']) ?>" style="color:#fff; text-decoration:underline;">
                                        <?= esc($order['order_number']) ?>
                                    </a>
                                </td>
                                <td>
                                    <strong><?= esc($order['customer_name'] ?? 'Guest Customer') ?></strong><br>
                                    <span style="font-size:11px; color:var(--admin-muted); font-family:var(--font-mono);"><?= esc($order['customer_phone'] ?? '-') ?></span>
                                </td>
                                <td class="admin-mono-cell">৳<?= number_format((float) $order['total_bdt'], 2) ?></td>
                                <td class="admin-mono-cell">
                                    <?= !empty($order['trx_id']) ? esc($order['trx_id']) : '<span style="color:var(--admin-muted);">&mdash;</span>' ?>
                                </td>
                                <td>
                                    <span class="admin-badge badge-<?= esc($order['payment_status']) ?>">
                                        <?= esc($order['payment_status']) ?>
                                    </span>
                                </td>
                                <td>
                                    <span class="admin-badge badge-<?= esc($order['order_status']) ?>">
                                        <?= esc($order['order_status']) ?>
                                    </span>
                                </td>
                                <td>
                                    <a href="/admin/orders/<?= esc($order['id']) ?>" class="admin-btn sm secondary">Manage</a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Right: Customer CAD Mesh Inflow -->
    <div class="admin-card">
        <div class="admin-card-header">
            <h2 class="admin-card-title">Customer CAD Intake</h2>
            <a href="/admin/cad-uploads" class="admin-btn sm secondary">Archive &rarr;</a>
        </div>
        <div style="padding: 16px 20px;">
            <?php if (empty($recentUploads)): ?>
                <div style="text-align: center; padding: 28px 0; color: var(--admin-muted); font-size: 13px;">
                    No custom CAD files uploaded yet.<br>
                    <a href="/quote" target="_blank" style="color:var(--admin-rust); text-decoration:underline; font-size:12px; margin-top:8px; display:inline-block;">Test /quote 3D Upload &rarr;</a>
                </div>
            <?php else: ?>
                <?php foreach ($recentUploads as $upl): ?>
                    <div style="padding: 12px 0; border-bottom: 1px solid var(--admin-border); display: flex; align-items: center; justify-content: space-between;">
                        <div>
                            <div style="font-weight: 600; color: #fff; font-size: 13px; word-break: break-all;">
                                <?= esc($upl['original_filename']) ?>
                            </div>
                            <div style="font-family: var(--font-mono); font-size: 11px; color: var(--admin-muted); margin-top: 2px;">
                                <?= esc(strtoupper($upl['file_extension'])) ?> &bull; <?= round($upl['file_size_bytes'] / 1024 / 1024, 2) ?> MB &bull; <?= date('M d, H:i', strtotime($upl['uploaded_at'])) ?>
                            </div>
                        </div>
                        <div>
                            <a href="<?= esc($upl['drive_url']) ?>" target="_blank" class="admin-btn sm secondary" title="View file on Google Drive">
                                Drive ↗
                            </a>
                        </div>
                    </div>
                <?php endforeach; ?>
            <?php endif; ?>
        </div>
    </div>
</div>

<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script src="/assets/js/admin-3d-neural.js"></script>
<?= $this->endSection() ?>
