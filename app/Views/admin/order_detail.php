<?= $this->extend('layouts/admin') ?>

<?= $this->section('content') ?>

<div class="admin-page-header">
    <div>
        <h1 class="admin-page-title">Order <?= esc($order['order_number']) ?></h1>
        <p class="admin-page-desc">Received on <?= date('F d, Y \a\t H:i', strtotime($order['created_at'])) ?></p>
    </div>
    <div style="display: flex; gap: 10px;">
        <a href="/admin/orders" class="admin-btn secondary">&larr; Back to Order Queue</a>
    </div>
</div>

<div class="admin-grid-2col">
    <!-- Left Column: Order Items & Customer Profile -->
    <div>
        <!-- Order Items -->
        <div class="admin-card">
            <div class="admin-card-header">
                <h2 class="admin-card-title">Order Items & Specifications</h2>
                <span class="admin-badge badge-<?= esc($order['order_status']) ?>"><?= esc($order['order_status']) ?></span>
            </div>
            <div class="admin-table-wrap">
                <table class="admin-table">
                    <thead>
                        <tr>
                            <th>Item / Artifact</th>
                            <th>Type</th>
                            <th>Specifications / Shade</th>
                            <th>Unit Price</th>
                            <th>Qty</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (empty($items)): ?>
                            <tr>
                                <td colspan="6" style="text-align:center; padding:24px; color:var(--admin-muted);">
                                    No item rows recorded for this order.
                                </td>
                            </tr>
                        <?php else: ?>
                            <?php foreach ($items as $item): ?>
                                <tr>
                                    <td><strong><?= esc($item['product_name_snapshot']) ?></strong></td>
                                    <td class="admin-mono-cell" style="font-size:11px; text-transform:uppercase;">
                                        <?= esc($item['item_type']) ?>
                                    </td>
                                    <td style="font-size:12px; color:var(--admin-muted);">
                                        <?= esc($item['specs_snapshot'] ?? $item['shade_snapshot'] ?? '&mdash;') ?>
                                    </td>
                                    <td class="admin-mono-cell">৳<?= number_format((float) $item['unit_price_bdt'], 2) ?></td>
                                    <td class="admin-mono-cell"><?= (int) $item['quantity'] ?></td>
                                    <td class="admin-mono-cell" style="font-weight:700;">৳<?= number_format((float) $item['line_total_bdt'], 2) ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>

            <!-- Financial Summary Strip -->
            <div style="padding: 20px 24px; background: #0f1014; border-top: 1px solid var(--admin-border);">
                <div style="max-width: 320px; margin-left: auto; font-family: var(--font-mono); font-size: 13px;">
                    <div style="display:flex; justify-content:space-between; margin-bottom:6px;">
                        <span style="color:var(--admin-muted);">Subtotal:</span>
                        <span>৳<?= number_format((float) $order['subtotal_bdt'], 2) ?></span>
                    </div>
                    <div style="display:flex; justify-content:space-between; margin-bottom:6px;">
                        <span style="color:var(--admin-muted);">Shipping (<?= $order['shipping_zone'] === 'inside_dhaka' ? 'Inside Dhaka' : 'Outside Dhaka' ?>):</span>
                        <span>৳<?= number_format((float) $order['shipping_cost_bdt'], 2) ?></span>
                    </div>
                    <div style="display:flex; justify-content:space-between; padding-top:8px; border-top:1px solid var(--admin-border); font-size:16px; font-weight:700; color:#fff;">
                        <span>Total Payable:</span>
                        <span style="color:#10b981;">৳<?= number_format((float) $order['total_bdt'], 2) ?></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Customer & Delivery Profile Card -->
        <div class="admin-card">
            <div class="admin-card-header">
                <h2 class="admin-card-title">Customer Shipping & Intake Details</h2>
            </div>
            <div style="padding: 24px;">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px;">
                    <div>
                        <div class="admin-label">Customer Name</div>
                        <div style="font-weight: 700; font-size: 16px; color: #fff;"><?= esc($order['customer_name'] ?? 'N/A') ?></div>
                    </div>
                    <div>
                        <div class="admin-label">Direct Phone Contact</div>
                        <div style="font-family: var(--font-mono); font-size: 15px; color: var(--admin-cyan);">
                            <a href="tel:<?= esc($order['customer_phone']) ?>" style="color:inherit; text-decoration:underline;">
                                <?= esc($order['customer_phone'] ?? 'N/A') ?>
                            </a>
                        </div>
                    </div>
                </div>

                <div style="margin-bottom: 20px;">
                    <div class="admin-label">Destination Address</div>
                    <div style="background: #0c0d10; border: 1px solid var(--admin-border); padding: 14px; font-size: 14px; line-height: 1.6; color: #f3f4f6;">
                        <?= nl2br(esc($order['address_line'] ?? 'No address entered')) ?>
                    </div>
                </div>

                <?php if (!empty($order['customer_notes'])): ?>
                    <div>
                        <div class="admin-label">Customer Order Instructions</div>
                        <div style="font-family: var(--font-mono); font-size: 12px; color: var(--admin-muted); background: #0c0d10; padding: 10px 14px; border: 1px solid var(--admin-border);">
                            <?= nl2br(esc($order['customer_notes'])) ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>

    <!-- Right Column: Payment Verification & Manufacturing Status -->
    <div>
        <!-- Payment Verification Panel -->
        <div class="admin-card">
            <div class="admin-card-header">
                <h2 class="admin-card-title">MFS Payment Status</h2>
                <span class="admin-badge badge-<?= esc($order['payment_status']) ?>"><?= esc($order['payment_status']) ?></span>
            </div>
            <div style="padding: 24px;">
                <div style="margin-bottom: 16px;">
                    <div class="admin-label">Payment Channel</div>
                    <div style="font-family: var(--font-mono); font-size: 14px; text-transform: uppercase; font-weight: 700;">
                        <?= esc($order['payment_method']) ?>
                    </div>
                </div>

                <div style="margin-bottom: 24px;">
                    <div class="admin-label">Reported Transaction ID (TrxID)</div>
                    <div style="background: #0c0d10; border: 1px solid var(--admin-border); padding: 12px; font-family: var(--font-mono); font-size: 16px; font-weight: 700; color: #f59e0b; word-break: break-all;">
                        <?= !empty($order['trx_id']) ? esc($order['trx_id']) : '<span style="color:var(--admin-muted); font-weight:400; font-size:13px;">No TrxID provided</span>' ?>
                    </div>
                </div>

                <form action="/admin/orders/<?= esc($order['id']) ?>/verify-payment" method="POST">
                    <?= csrf_field() ?>
                    <div class="admin-form-group">
                        <label class="admin-label">Update Payment State</label>
                        <select name="payment_status" class="admin-select">
                            <option value="verified" <?= $order['payment_status'] === 'verified' ? 'selected' : '' ?>>VERIFIED (Payment Confirmed)</option>
                            <option value="on_hold" <?= $order['payment_status'] === 'on_hold' ? 'selected' : '' ?>>ON HOLD (Awaiting Verification)</option>
                            <option value="pending" <?= $order['payment_status'] === 'pending' ? 'selected' : '' ?>>PENDING (No deposit yet)</option>
                            <option value="refunded" <?= $order['payment_status'] === 'refunded' ? 'selected' : '' ?>>REFUNDED</option>
                            <option value="failed" <?= $order['payment_status'] === 'failed' ? 'selected' : '' ?>>FAILED / INVALID TRXID</option>
                        </select>
                    </div>
                    <button type="submit" class="admin-btn emerald" style="width: 100%; justify-content: center;">
                        Confirm Payment State
                    </button>
                </form>
            </div>
        </div>

        <!-- Manufacturing & Fulfillment Lifecycle -->
        <div class="admin-card">
            <div class="admin-card-header">
                <h2 class="admin-card-title">Manufacturing Status</h2>
                <span class="admin-badge badge-<?= esc($order['order_status']) ?>"><?= esc($order['order_status']) ?></span>
            </div>
            <div style="padding: 24px;">
                <form action="/admin/orders/<?= esc($order['id']) ?>/status" method="POST">
                    <?= csrf_field() ?>
                    <div class="admin-form-group">
                        <label class="admin-label">Order Lifecycle Stage</label>
                        <select name="order_status" class="admin-select">
                            <option value="received" <?= $order['order_status'] === 'received' ? 'selected' : '' ?>>RECEIVED (In Intake Queue)</option>
                            <option value="slicing" <?= $order['order_status'] === 'slicing' ? 'selected' : '' ?>>SLICING (Preparing G-code in Bambu Studio)</option>
                            <option value="printing" <?= $order['order_status'] === 'printing' ? 'selected' : '' ?>>PRINTING (Running on Bambu Lab A1)</option>
                            <option value="dispatched" <?= $order['order_status'] === 'dispatched' ? 'selected' : '' ?>>DISPATCHED (Handed to Courier)</option>
                            <option value="delivered" <?= $order['order_status'] === 'delivered' ? 'selected' : '' ?>>DELIVERED (Fulfilled)</option>
                            <option value="cancelled" <?= $order['order_status'] === 'cancelled' ? 'selected' : '' ?>>CANCELLED</option>
                        </select>
                    </div>

                    <div class="admin-form-group">
                        <label class="admin-label">Courier Partner</label>
                        <input type="text" name="courier_provider" class="admin-input" placeholder="e.g. Steadfast / Pathao / RedX" value="<?= esc($order['courier_provider'] ?? '') ?>">
                    </div>

                    <div class="admin-form-group">
                        <label class="admin-label">Consignment / Tracking Number</label>
                        <input type="text" name="courier_tracking" class="admin-input" placeholder="e.g. SF-94827104" value="<?= esc($order['courier_tracking'] ?? '') ?>">
                    </div>

                    <div class="admin-form-group">
                        <label class="admin-label">Workshop Internal Notes</label>
                        <textarea name="admin_notes" class="admin-textarea" rows="3" placeholder="Filament batch used, nozzle wear notes, etc."><?= esc($order['admin_notes'] ?? '') ?></textarea>
                    </div>

                    <button type="submit" class="admin-btn" style="width: 100%; justify-content: center;">
                        Save Lifecycle Changes
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>
