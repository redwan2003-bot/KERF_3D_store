<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Packing Slip — <?= esc($order['order_number']) ?> — KERF 3D Studio</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@500;700;800&family=Space+Mono:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        body {
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, sans-serif;
            color: #111;
            background: #f4f4f4;
            padding: 20px;
            font-size: 13px;
            line-height: 1.4;
        }
        .slip-container {
            max-width: 720px;
            margin: 0 auto;
            background: #fff;
            border: 2px solid #111;
            padding: 32px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        }
        .slip-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            border-bottom: 2px solid #111;
            padding-bottom: 16px;
            margin-bottom: 20px;
        }
        .slip-brand h1 {
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.02em;
            line-height: 1.1;
        }
        .slip-brand span {
            font-family: 'Space Mono', monospace;
            font-size: 10px;
            color: #666;
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }
        .slip-ticket-box {
            text-align: right;
            font-family: 'Space Mono', monospace;
        }
        .slip-ticket-num {
            font-size: 20px;
            font-weight: 700;
            color: #111;
        }
        .slip-date {
            font-size: 10px;
            color: #666;
        }
        .slip-grid {
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 24px;
            margin-bottom: 24px;
            padding-bottom: 20px;
            border-bottom: 1px dashed #ccc;
        }
        .slip-section-title {
            font-family: 'Space Mono', monospace;
            font-size: 10px;
            font-weight: 700;
            color: #888;
            letter-spacing: 0.08em;
            margin-bottom: 6px;
        }
        .customer-name {
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 4px;
        }
        .customer-phone {
            font-family: 'Space Mono', monospace;
            font-size: 16px;
            font-weight: 700;
            color: #111;
            margin-bottom: 6px;
            display: inline-block;
            background: #eee;
            padding: 2px 8px;
        }
        .customer-address {
            font-size: 13px;
            color: #333;
            line-height: 1.5;
        }
        .delivery-badge {
            display: inline-block;
            font-family: 'Space Mono', monospace;
            font-size: 11px;
            font-weight: 700;
            padding: 4px 10px;
            border: 1px solid #111;
            margin-top: 8px;
            background: <?= ($order['shipping_zone'] ?? '') === 'inside_dhaka' ? '#e0f2fe' : '#fef3c7' ?>;
        }
        .slip-meta-card {
            background: #f9f9f9;
            border: 1px solid #e5e5e5;
            padding: 12px 16px;
            font-family: 'Space Mono', monospace;
            font-size: 11px;
        }
        .slip-meta-card div {
            display: flex;
            justify-content: space-between;
            padding: 4px 0;
            border-bottom: 1px dashed #eee;
        }
        .slip-meta-card div:last-child {
            border-bottom: 0;
        }
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 24px;
        }
        .items-table th {
            font-family: 'Space Mono', monospace;
            font-size: 10px;
            text-align: left;
            padding: 8px 10px;
            background: #111;
            color: #fff;
            letter-spacing: 0.06em;
        }
        .items-table td {
            padding: 12px 10px;
            border-bottom: 1px solid #eee;
            font-size: 12px;
        }
        .items-table tr:last-child td {
            border-bottom: 2px solid #111;
        }
        .item-name {
            font-weight: 700;
            font-size: 13px;
        }
        .item-spec {
            font-family: 'Space Mono', monospace;
            font-size: 10px;
            color: #666;
            margin-top: 2px;
        }
        .money-cell {
            font-family: 'Space Mono', monospace;
            text-align: right;
            font-weight: 700;
        }
        .slip-totals {
            margin-left: auto;
            width: 280px;
            font-family: 'Space Mono', monospace;
            font-size: 11px;
            margin-bottom: 24px;
        }
        .slip-totals div {
            display: flex;
            justify-content: space-between;
            padding: 4px 0;
        }
        .total-due-row {
            border-top: 2px solid #111;
            border-bottom: 2px solid #111;
            padding: 8px 0 !important;
            margin-top: 6px;
            font-size: 14px;
            font-weight: 700;
        }
        .collect-cod-banner {
            background: #111;
            color: #fff;
            padding: 12px 16px;
            text-align: center;
            font-family: 'Space Mono', monospace;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 24px;
        }
        .slip-footer {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            font-family: 'Space Mono', monospace;
            font-size: 9px;
            color: #888;
            border-top: 1px dashed #ccc;
            padding-top: 14px;
        }
        .print-actions {
            max-width: 720px;
            margin: 0 auto 16px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .btn-print {
            background: #111;
            color: #fff;
            border: 0;
            padding: 10px 20px;
            font-family: 'Space Mono', monospace;
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
        }
        .btn-back {
            color: #111;
            text-decoration: underline;
            font-family: 'Space Mono', monospace;
            font-size: 11px;
        }
        @media print {
            body {
                background: #fff;
                padding: 0;
            }
            .slip-container {
                border: 0;
                padding: 0;
                box-shadow: none;
                max-width: 100%;
            }
            .print-actions {
                display: none !important;
            }
        }
    </style>
</head>
<body>

    <div class="print-actions">
        <a href="/admin/orders/<?= esc($order['id']) ?>" class="btn-back">&larr; Back to Order Details</a>
        <button class="btn-print" onclick="window.print()">PRINT PACKING SLIP ↗</button>
    </div>

    <div class="slip-container">
        <!-- Header -->
        <header class="slip-header">
            <div class="slip-brand">
                <h1>KERF 3D STUDIO</h1>
                <span>PRECISION ADDITIVE MANUFACTURING · DHAKA HUB</span>
            </div>
            <div class="slip-ticket-box">
                <div class="slip-ticket-num"><?= esc($order['order_number']) ?></div>
                <div class="slip-date"><?= date('d M Y · H:i', strtotime($order['created_at'])) ?></div>
            </div>
        </header>

        <!-- Customer & Dispatch Grid -->
        <div class="slip-grid">
            <div>
                <div class="slip-section-title">DELIVERY RECIPIENT</div>
                <div class="customer-name"><?= esc($order['customer_name'] ?? 'Guest Customer') ?></div>
                <div class="customer-phone">TEL: <?= esc($order['customer_phone'] ?? 'N/A') ?></div>
                <div class="customer-address"><?= nl2br(esc($order['address_line'] ?? 'No delivery address provided')) ?></div>
                <div class="delivery-badge">
                    <?= ($order['shipping_zone'] ?? '') === 'inside_dhaka' ? 'ZONE 01: INSIDE DHAKA (24—48H)' : 'ZONE 02: OUTSIDE DHAKA (NATIONWIDE)' ?>
                </div>
            </div>
            <div>
                <div class="slip-section-title">INTAKE METADATA</div>
                <div class="slip-meta-card">
                    <div><span>PAYMENT METHOD:</span><strong><?= strtoupper(esc($order['payment_method'])) ?></strong></div>
                    <div><span>PAYMENT STATE:</span><strong><?= strtoupper(esc($order['payment_status'])) ?></strong></div>
                    <?php if (!empty($order['trx_id'])): ?>
                        <div><span>TRX ID:</span><strong><?= esc($order['trx_id']) ?></strong></div>
                    <?php endif; ?>
                    <div><span>ORDER STAGE:</span><strong><?= strtoupper(esc($order['order_status'])) ?></strong></div>
                </div>
            </div>
        </div>

        <!-- Items Table -->
        <table class="items-table">
            <thead>
                <tr>
                    <th style="width: 55%;">SPECIMEN / ARTIFACT</th>
                    <th style="width: 15%; text-align: center;">QTY</th>
                    <th style="width: 15%; text-align: right;">UNIT</th>
                    <th style="width: 15%; text-align: right;">TOTAL</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach (($items ?? []) as $item): ?>
                    <tr>
                        <td>
                            <div class="item-name"><?= esc($item['product_name_snapshot']) ?></div>
                            <div class="item-spec"><?= esc($item['specs_snapshot'] ?? 'STANDARD SPECIMEN') ?></div>
                        </td>
                        <td style="text-align: center; font-family: 'Space Mono', monospace; font-weight: 700;">
                            <?= (int) $item['quantity'] ?>
                        </td>
                        <td class="money-cell">
                            ৳<?= number_format((float) $item['unit_price_bdt'], 2) ?>
                        </td>
                        <td class="money-cell">
                            ৳<?= number_format((float) $item['line_total_bdt'], 2) ?>
                        </td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <!-- Totals Block -->
        <div class="slip-totals">
            <div>
                <span>SUBTOTAL (ARTIFACTS):</span>
                <b>৳<?= number_format((float) ($order['subtotal_bdt'] ?? 0), 2) ?></b>
            </div>
            <div>
                <span>COURIER SHIPPING:</span>
                <b>৳<?= number_format((float) ($order['shipping_cost_bdt'] ?? 0), 2) ?></b>
            </div>
            <div class="total-due-row">
                <span>TOTAL AMOUNT:</span>
                <b>৳<?= number_format((float) ($order['total_bdt'] ?? 0), 2) ?> BDT</b>
            </div>
        </div>

        <!-- COD Banner if Cash on Delivery -->
        <?php if ($order['payment_method'] === 'cod' || $order['payment_status'] === 'pending'): ?>
            <div class="collect-cod-banner">
                CASH TO COLLECT ON DELIVERY: ৳<?= number_format((float) ($order['total_bdt'] ?? 0), 2) ?> BDT
            </div>
        <?php else: ?>
            <div class="collect-cod-banner" style="background: #16a34a;">
                PAID IN FULL VIA <?= strtoupper(esc($order['payment_method'])) ?> · DO NOT COLLECT CASH
            </div>
        <?php endif; ?>

        <!-- Footer -->
        <footer class="slip-footer">
            <span>PACKED &amp; CALIBRATED AT DHAKA ATELIER // BAMBU LAB A1 HARDWARE</span>
            <span>KERF3D.STORE // TRACK: /track?ticket=<?= esc($order['order_number']) ?></span>
        </footer>
    </div>

</body>
</html>
