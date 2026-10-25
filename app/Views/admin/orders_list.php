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

<!-- Search & Filter Controls Toolbar -->
<div style="background: var(--admin-panel); border: 1px solid var(--admin-border); padding: 18px 24px; margin-bottom: 24px;">
    <!-- Top Row: Real-Time Instant Search -->
    <div style="display: flex; gap: 16px; align-items: center; justify-content: space-between; flex-wrap: wrap; margin-bottom: 16px;">
        <div style="position: relative; flex: 1 1 320px; max-width: 480px;">
            <input type="text" id="admin-orders-search" placeholder="Type to search orders (Order #, Name, Phone, TrxID)..." 
                   style="width: 100%; box-sizing: border-box; background: var(--admin-bg); border: 1px solid var(--admin-border-light); color: #fff; font-family: var(--font-mono); font-size: 13px; padding: 10px 14px; outline: none;">
            <button type="button" id="admin-search-clear" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: transparent; border: 0; color: var(--admin-muted); cursor: pointer; display: none; font-size: 14px;">✕</button>
        </div>
        <div style="font-family: var(--font-mono); font-size: 12px; color: var(--admin-muted);">
            SHOWING <strong id="admin-visible-count" style="color: #fff;"><?= count($orders) ?></strong> OF <strong><?= count($orders) ?></strong> ORDERS
        </div>
    </div>

    <!-- Bottom Row: Filter Tabs -->
    <div class="admin-filter-bar" style="margin: 0; padding: 0; border: 0; background: transparent; flex-wrap: wrap;">
        <span style="font-family: var(--font-mono); font-size: 11px; color: var(--admin-muted); text-transform: uppercase;">Filter:</span>
        <a href="/admin/orders" class="admin-btn sm <?= empty($statusFilter) && empty($payFilter) ? '' : 'secondary' ?>">All Orders</a>
        <a href="/admin/orders?status=received" class="admin-btn sm <?= $statusFilter === 'received' ? '' : 'secondary' ?>">Received</a>
        <a href="/admin/orders?status=slicing" class="admin-btn sm <?= $statusFilter === 'slicing' ? '' : 'secondary' ?>" style="border-color:#38bdf8; color:#38bdf8;">Slicing</a>
        <a href="/admin/orders?status=printing" class="admin-btn sm <?= $statusFilter === 'printing' ? '' : 'secondary' ?>" style="border-color:#f59e0b; color:#fcd34d;">Printing (Bambu A1)</a>
        <a href="/admin/orders?status=dispatched" class="admin-btn sm <?= $statusFilter === 'dispatched' ? '' : 'secondary' ?>">Dispatched</a>
        <a href="/admin/orders?status=delivered" class="admin-btn sm <?= $statusFilter === 'delivered' ? '' : 'secondary' ?>">Delivered</a>
        <a href="/admin/orders?payment=on_hold" class="admin-btn sm <?= $payFilter === 'on_hold' ? '' : 'secondary' ?>" style="border-color:#f59e0b; color:#fcd34d;">Pending TrxID</a>
        <a href="/admin/orders?status=cancelled" class="admin-btn sm <?= $statusFilter === 'cancelled' ? '' : 'secondary' ?>" style="color:#ef4444;">Cancelled</a>
    </div>
</div>

<div class="admin-card">
    <div class="admin-table-wrap">
        <table class="admin-table" id="admin-orders-table">
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
                    <tr id="admin-no-orders-row">
                        <td colspan="10" style="text-align:center; padding:48px; color:var(--admin-muted);">
                            No orders matching the selected filter.
                            <div style="margin-top: 10px;">
                                <a href="/admin/orders" class="admin-btn sm secondary">Reset All Filters &rarr;</a>
                            </div>
                        </td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($orders as $o): ?>
                        <?php
                            $cleanPhone = preg_replace('/[^0-9]/', '', $o['customer_phone'] ?? '');
                            if (str_starts_with($cleanPhone, '01')) $cleanPhone = '88' . $cleanPhone;
                            $rowWaUrl = "https://wa.me/{$cleanPhone}?text=" . rawurlencode("Hello " . ($o['customer_name'] ?? 'Customer') . ", this is Kerf 3D Studio Dhaka regarding your Order #" . $o['order_number'] . ".");
                        ?>
                        <tr class="admin-order-row"
                            data-order-num="<?= esc(strtolower($o['order_number'])) ?>"
                            data-customer="<?= esc(strtolower($o['customer_name'] ?? '')) ?>"
                            data-phone="<?= esc(strtolower($o['customer_phone'] ?? '')) ?>"
                            data-trxid="<?= esc(strtolower($o['trx_id'] ?? '')) ?>">
                            <td class="admin-mono-cell">
                                <a href="/admin/orders/<?= esc($o['id']) ?>" style="color:#fff; font-weight:700; text-decoration:underline;">
                                    <?= esc($o['order_number']) ?>
                                </a>
                            </td>
                            <td>
                                <strong><?= esc($o['customer_name'] ?? 'Guest Customer') ?></strong><br>
                                <span style="font-size:12px; color:var(--admin-muted); font-family:var(--font-mono);">
                                    <a href="tel:<?= esc($o['customer_phone']) ?>" style="color:inherit; text-decoration:none;"><?= esc($o['customer_phone'] ?? '-') ?></a>
                                    <?php if (!empty($o['customer_phone'])): ?>
                                        <a href="<?= $rowWaUrl ?>" target="_blank" rel="noopener" style="color:#25D366; text-decoration:none; margin-left:6px; font-weight:bold;" title="Contact on WhatsApp">[WA ↗]</a>
                                    <?php endif; ?>
                                </span>
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
                    <tr id="admin-search-empty-row" style="display: none;">
                        <td colspan="10" style="text-align:center; padding:48px; color:var(--admin-muted); font-family:var(--font-mono);">
                            NO ORDERS MATCH SEARCH QUERY.
                            <div style="margin-top: 10px;">
                                <button type="button" onclick="document.getElementById('admin-orders-search').value=''; document.getElementById('admin-orders-search').dispatchEvent(new Event('input'));" class="admin-btn sm secondary">
                                    Clear Search Query
                                </button>
                            </div>
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
    const searchInput = document.getElementById('admin-orders-search');
    const clearBtn = document.getElementById('admin-search-clear');
    const visibleCount = document.getElementById('admin-visible-count');
    const rows = Array.from(document.querySelectorAll('.admin-order-row'));
    const emptyRow = document.getElementById('admin-search-empty-row');
    const totalCount = rows.length;

    if (!searchInput) return;

    function filterOrders() {
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
            const num = r.getAttribute('data-order-num') || '';
            const cust = r.getAttribute('data-customer') || '';
            const phone = r.getAttribute('data-phone') || '';
            const trx = r.getAttribute('data-trxid') || '';
            const haystack = num + ' ' + cust + ' ' + phone + ' ' + trx;

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

    searchInput.addEventListener('input', filterOrders);
    if (clearBtn) {
        clearBtn.addEventListener('click', function() {
            searchInput.value = '';
            filterOrders();
            searchInput.focus();
        });
    }
})();
</script>
<?= $this->endSection() ?>
