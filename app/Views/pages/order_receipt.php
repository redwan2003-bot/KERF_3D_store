<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Customer Receipt // <?= esc($order['order_number']) ?> — KERF 3D STUDIO</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    :root {
      --ink: #111317;
      --paper: #ffffff;
      --border: #e2ddd5;
      --rust: #b85d38;
      --meta: #6e655d;
      --mono: "Space Mono", monospace;
      --sans: "Plus Jakarta Sans", sans-serif;
    }

    * { box-sizing: border-box; }
    body {
      margin: 0;
      padding: 0;
      background: #f4efe6;
      color: var(--ink);
      font-family: var(--sans);
      font-size: 13px;
      line-height: 1.5;
    }

    /* Screen Action Bar */
    .receipt-actions {
      position: sticky;
      top: 0;
      background: var(--ink);
      color: #fff;
      padding: 12px 24px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      z-index: 100;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }
    .receipt-actions button, .receipt-actions a {
      font-family: var(--mono);
      font-size: 11px;
      font-weight: 700;
      text-transform: uppercase;
      padding: 8px 16px;
      border: 1px solid rgba(255,255,255,0.3);
      background: transparent;
      color: #fff;
      text-decoration: none;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }
    .receipt-actions button.btn-primary {
      background: var(--rust);
      border-color: var(--rust);
    }
    .receipt-actions button:hover, .receipt-actions a:hover {
      background: rgba(255,255,255,0.15);
    }
    .receipt-actions button.btn-primary:hover {
      background: #944525;
    }

    /* Page Canvas */
    .receipt-sheet {
      max-width: 800px;
      margin: 32px auto;
      background: var(--paper);
      padding: 48px;
      border: 1px solid var(--border);
      box-shadow: 0 10px 30px rgba(0,0,0,0.05);
    }

    /* Header */
    .receipt-head {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      border-bottom: 2px solid var(--ink);
      padding-bottom: 24px;
    }
    .brand-title {
      font-family: var(--mono);
      font-size: 20px;
      font-weight: 700;
      letter-spacing: -0.02em;
      margin: 0 0 4px;
    }
    .brand-sub {
      font-size: 11px;
      color: var(--meta);
      font-family: var(--mono);
      letter-spacing: 0.05em;
    }
    .invoice-tag {
      font-family: var(--mono);
      font-size: 12px;
      font-weight: 700;
      background: var(--ink);
      color: #fff;
      padding: 6px 12px;
      letter-spacing: 0.08em;
      text-align: right;
    }

    /* Meta Grid */
    .receipt-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 24px;
      margin: 28px 0;
      padding: 20px;
      background: #fbf9f5;
      border: 1px solid var(--border);
      font-family: var(--mono);
      font-size: 11px;
    }
    .meta-col strong {
      display: block;
      color: var(--meta);
      font-size: 9px;
      letter-spacing: 0.08em;
      margin-bottom: 4px;
    }
    .meta-col span {
      display: block;
      color: var(--ink);
      font-weight: 700;
      font-size: 13px;
    }
    .meta-col small {
      color: var(--meta);
      display: block;
      margin-top: 4px;
      font-family: var(--sans);
      font-size: 11px;
    }

    /* Items Table */
    .items-table {
      width: 100%;
      border-collapse: collapse;
      margin: 28px 0;
      font-family: var(--mono);
      font-size: 11px;
    }
    .items-table th {
      text-align: left;
      padding: 10px 8px;
      border-bottom: 2px solid var(--ink);
      font-size: 10px;
      letter-spacing: 0.08em;
      color: var(--meta);
    }
    .items-table td {
      padding: 14px 8px;
      border-bottom: 1px dashed var(--border);
      vertical-align: top;
    }
    .item-name {
      font-weight: 700;
      font-size: 12px;
      color: var(--ink);
    }
    .item-specs {
      font-size: 10px;
      color: var(--meta);
      display: block;
      margin-top: 2px;
    }

    /* Totals */
    .totals-wrap {
      display: flex;
      justify-content: flex-end;
      margin-top: 20px;
    }
    .totals-box {
      width: 320px;
      font-family: var(--mono);
      font-size: 11px;
    }
    .total-row {
      display: flex;
      justify-content: space-between;
      padding: 6px 0;
      color: var(--meta);
    }
    .total-row.grand {
      border-top: 2px solid var(--ink);
      margin-top: 8px;
      padding-top: 10px;
      font-size: 15px;
      font-weight: 700;
      color: var(--ink);
    }
    .total-row.grand b {
      color: var(--rust);
    }

    /* Quality Stamp */
    .quality-stamp {
      margin-top: 36px;
      padding: 16px 20px;
      border-left: 3px solid var(--rust);
      background: #faf7f2;
      font-size: 11px;
      color: var(--meta);
    }
    .quality-stamp strong {
      display: block;
      color: var(--ink);
      font-family: var(--mono);
      font-size: 11px;
      letter-spacing: 0.05em;
      margin-bottom: 4px;
    }

    /* Print Stylesheet */
    @media print {
      body {
        background: #fff;
        color: #000;
      }
      .receipt-actions {
        display: none !important;
      }
      .receipt-sheet {
        margin: 0;
        padding: 0;
        border: none;
        box-shadow: none;
        max-width: 100%;
      }
    }
  </style>
</head>
<body>

  <!-- Screen Header Action Bar -->
  <header class="receipt-actions" aria-label="Receipt Print Bar">
    <div>
      <a href="/track?ticket=<?= esc($order['order_number']) ?>">&larr; Return to Tracking</a>
    </div>
    <div style="display: flex; gap: 10px;">
      <button type="button" class="btn-primary" onclick="window.print()">
        <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="6 9 6 2 18 2 18 9"></polyline><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><rect x="6" y="14" width="12" height="8"></rect></svg>
        Print or Save as PDF
      </button>
    </div>
  </header>

  <!-- Printable Invoice Document -->
  <main class="receipt-sheet">
    <div class="receipt-head">
      <div>
        <h1 class="brand-title">KERF 3D STUDIO</h1>
        <div class="brand-sub">PRECISION ADDITIVE MANUFACTURING · DHAKA ATELIER</div>
        <div style="font-size: 11px; color: var(--meta); margin-top: 4px;">
          Hotline: +880 1754-550297 · Web: https://kerf3d.store
        </div>
      </div>
      <div style="text-align: right;">
        <div class="invoice-tag">INVOICE &amp; RECEIPT</div>
        <div style="font-family: var(--mono); font-size: 11px; margin-top: 6px; font-weight: 700;">
          TICKET #<?= esc($order['order_number']) ?>
        </div>
      </div>
    </div>

    <!-- Order Metadata Grid -->
    <div class="receipt-grid">
      <div class="meta-col">
        <strong>DELIVERY RECIPIENT &amp; ADDRESS</strong>
        <span><?= esc($customer['name'] ?? 'Valued Customer') ?></span>
        <small><?= nl2br(esc($customer['address_line'] ?? 'Dhaka, Bangladesh')) ?></small>
        <small>Phone: <?= esc($customer['phone'] ?? 'N/A') ?></small>
      </div>
      <div class="meta-col">
        <strong>ORDER METRICS &amp; LOGISTICS</strong>
        <span><?= date('d M Y · H:i', strtotime($order['created_at'])) ?></span>
        <small>Region: <?= $order['shipping_zone'] === 'inside_dhaka' ? 'Inside Dhaka (24—48H Hub Courier)' : 'Outside Dhaka (Nationwide Courier)' ?></small>
        <small>Payment: <?= strtoupper(esc($order['payment_method'] ?? 'COD')) ?> (<?= strtoupper(esc($order['payment_status'] ?? 'PENDING')) ?>)</small>
        <?php if (!empty($order['trx_id'])): ?>
          <small>TrxID: <code><?= esc($order['trx_id']) ?></code></small>
        <?php endif; ?>
      </div>
    </div>

    <!-- Itemized Specimens Table -->
    <table class="items-table">
      <thead>
        <tr>
          <th>SPECIMEN ARTIFACT</th>
          <th>SPECIFICATIONS</th>
          <th style="text-align: right;">QTY</th>
          <th style="text-align: right;">UNIT</th>
          <th style="text-align: right;">TOTAL</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($items as $item): ?>
          <tr>
            <td>
              <div class="item-name"><?= esc($item['product_name_snapshot'] ?? 'Specimen Artifact') ?></div>
              <?php if (!empty($item['sku'])): ?>
                <span style="font-size: 9px; color: var(--meta);"><?= esc($item['sku']) ?></span>
              <?php endif; ?>
            </td>
            <td>
              <span class="item-specs"><?= esc($item['specs_snapshot'] ?? 'Standard Specifications') ?></span>
            </td>
            <td style="text-align: right;"><?= (int)$item['quantity'] ?></td>
            <td style="text-align: right;">৳<?= number_format((float)($item['unit_price_bdt'] ?? 0), 2) ?></td>
            <td style="text-align: right; font-weight: 700;">৳<?= number_format((float)($item['line_total_bdt'] ?? 0), 2) ?></td>
          </tr>
        <?php endforeach; ?>
      </tbody>
    </table>

    <!-- Financial Totals -->
    <div class="totals-wrap">
      <div class="totals-box">
        <div class="total-row">
          <span>ARTIFACTS SUBTOTAL:</span>
          <span>৳<?= number_format((float)($order['subtotal_bdt'] ?? 0), 2) ?></span>
        </div>
        <div class="total-row">
          <span>COURIER SHIPPING:</span>
          <span><?= ((float)($order['shipping_cost_bdt'] ?? 0) === 0.0) ? 'FREE (৳0.00)' : '৳' . number_format((float)$order['shipping_cost_bdt'], 2) ?></span>
        </div>
        <div class="total-row grand">
          <span>TOTAL AMOUNT:</span>
          <b>৳<?= number_format((float)($order['total_bdt'] ?? 0), 2) ?> BDT</b>
        </div>
      </div>
    </div>

    <!-- Workshop Quality Certificate -->
    <div class="quality-stamp">
      <strong>✦ BAMBU LAB A1 FABRICATION CERTIFICATION</strong>
      Every artifact in this batch has been sliced, calibrated, and extruded in our Dhaka studio. Fabricated on direct-drive Bambu Lab A1 systems with verified continuous layer adhesion. Retain this invoice as proof of purchase and warranty tracking.
    </div>

    <footer style="margin-top: 40px; padding-top: 16px; border-top: 1px dashed var(--border); display: flex; justify-content: space-between; font-family: var(--mono); font-size: 9px; color: var(--meta);">
      <span>KERF3D.STORE · ORDER TICKET #<?= esc($order['order_number']) ?></span>
      <span>OFFICIAL INTAKE &amp; DISPATCH LEDGER</span>
    </footer>
  </main>

</body>
</html>
