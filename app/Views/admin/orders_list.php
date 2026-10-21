<?= $this->extend('layouts/admin') ?>

<?= $this->section('content') ?>

<div class="admin-page-header">
    <div>
        <h1 class="admin-page-title">Workshop Order Intake & Fulfillment</h1>
        <p class="admin-page-desc">Order Queue &bull; Payment Verification &bull; Bambu Lab A1 Dispatch</p>
    </div>
    <div>
        <a href="/admin" class="admin-btn secondary">&larr; Back to Dashboard</a>
    </div>
</div>

<!-- Filter Bar -->
<div class="admin-filter-bar">
    <span style="font-family: var(--font-mono); font-size: 11px; color: var(--admin-muted); text-transform: uppercase;">Filter Status:</span>
    <a href="/admin/orders" class="admin-btn sm <?= empty($statusFilter) && empty($payFilter) ? '' : 'secondary' ?>">All Orders</a>
    <a href="/admin/orders?status=received" class="admin-btn sm <?= $statusFilter === 'received' ? '' : 'secondary' ?>">Received</a>
    <a href="/admin/orders?status=printing" class="admin-btn sm <?= $statusFilter === 'printing' ? '' : 'secondary' ?>">Printing (Bambu A1)</a>
    <a href="/admin/orders?status=dispatched" class="admin-btn sm <?= $statusFilter === 'dispatched' ? '' : 'secondary' ?>">Dispatched</a>
    <a href="/admin/orders?status=delivered" class="admin-btn sm <?= $statusFilter === 'delivered' ? '' : 'secondary' ?>">Delivered</a>
    <a href="/admin/orders?payment=on_hold" class="admin-btn sm <?= $payFilter === 'on_hold' ? '' : 'secondary' ?>" style="border-color:#f59e0b; color:#fcd34d;">Pending TrxID</a>
</div>

<div class="admin-card">
    <div class="admin-table-wrap">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>Order #</th>
                    <th>Customer Name & Contact</th>
                    <th>Zone</th>
                    <th>Total (BDT)</th>
                    <th>Payment Method</th>
                    <th>TrxID</th>
                    <th>Payment Status</th>
                    <th>Order Status</th>
                    <th>Date Received</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($orders)): ?>
                    <tr>
                        <td colspan="10" style="text-align:center; padding:48px; color:var(--admin-muted);">
                            No orders matching the selected filter.
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($orders as $o): ?>
                        <tr>
                            <td class="admin-mono-cell">
                                <a href="/admin/orders/<?= esc($o['id']) ?>" style="color:#fff; font-weight:700; text-decoration:underline;">
                                    <?= esc($o['order_number']) ?>
                                </a>
                            </td>
                            <td>
                                <strong><?= esc($o['customer_name'] ?? 'Guest Customer') ?></strong><br>
                                <span style="font-size:12px; color:var(--admin-muted); font-family:var(--font-mono);"><?= esc($o['customer_phone'] ?? '-') ?></span>
                            </td>
                            <td class="admin-mono-cell" style="font-size:11px;">
                                <?= $o['shipping_zone'] === 'inside_dhaka' ? 'Dhaka (৳70)' : 'Outside (৳130)' ?>
                            </td>
                            <td class="admin-mono-cell" style="font-weight:700;">৳<?= number_format((float) $o['total_bdt'], 2) ?></td>
                            <td class="admin-mono-cell" style="text-transform:uppercase; font-size:11px;">
                                <?= esc($o['payment_method']) ?>
                            </td>
                            <td class="admin-mono-cell">
                                <?= !empty($o['trx_id']) ? esc($o['trx_id']) : '<span style="color:var(--admin-muted);">&mdash;</span>' ?>
                            </td>
                            <td>
                                <span class="admin-badge badge-<?= esc($o['payment_status']) ?>">
                                    <?= esc($o['payment_status']) ?>
                                </span>
                            </td>
                            <td>
                                <span class="admin-badge badge-<?= esc($o['order_status']) ?>">
                                    <?= esc($o['order_status']) ?>
                                </span>
                            </td>
                            <td class="admin-mono-cell" style="font-size:11px; color:var(--admin-muted);">
                                <?= date('Y-m-d H:i', strtotime($o['created_at'])) ?>
                            </td>
                            <td>
                                <a href="/admin/orders/<?= esc($o['id']) ?>" class="admin-btn sm secondary">Manage &rarr;</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?= $this->endSection() ?>
