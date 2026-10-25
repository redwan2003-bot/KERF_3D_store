<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<?php
  // Format WhatsApp confirmation text with all MakerWorld model links
  $waItems = [];
  foreach (($orderItems ?? []) as $idx => $it) {
      $itemTitle = ($it['product_name_snapshot'] ?? 'Specimen');
      $itemSpecs = ($it['specs_snapshot'] ?? 'Standard');
      $itemQty   = (int) ($it['quantity'] ?? 1);
      $itemTotal = number_format((float) ($it['line_total_bdt'] ?? 0), 2);
      $mwUrl     = !empty($it['makerworld_url_snapshot']) ? trim($it['makerworld_url_snapshot']) : '';

      $line = ($idx + 1) . ". " . $itemTitle . " (Qty: {$itemQty}, ৳{$itemTotal})";
      if (!empty($itemSpecs)) {
          $line .= "\n   Specs: " . $itemSpecs;
      }
      if (!empty($mwUrl)) {
          $line .= "\n   MakerWorld: " . $mwUrl;
      }
      $waItems[] = $line;
  }
  $waItemsStr = implode("\n", $waItems);

  $orderNum  = esc($order['order_number'] ?? 'K3D-ORD');
  $custName  = esc($customer['name'] ?? 'Studio Customer');
  $custPhone = esc($customer['phone'] ?? '');
  $address   = esc($customer['address_line'] ?? '');
  $zone      = ($order['shipping_zone'] ?? 'inside_dhaka') === 'inside_dhaka' ? 'Inside Dhaka (৳70)' : 'Outside Dhaka (৳130)';
  $subtotal  = number_format((float) ($order['subtotal_bdt'] ?? 0), 2);
  $shipping  = number_format((float) ($order['shipping_cost_bdt'] ?? 70), 2);
  $total     = number_format((float) ($order['total_bdt'] ?? 0), 2);
  $payMethod = strtoupper(esc($order['payment_method'] ?? 'BKASH'));
  $trxId     = !empty($order['trx_id']) ? esc($order['trx_id']) : 'Pending Verification';

  $rawWaText = "KERF 3D STUDIO — ORDER CONFIRMATION\n"
             . "Order Ticket: #{$orderNum}\n"
             . "Customer: {$custName} ({$custPhone})\n"
             . "Address: {$address} [{$zone}]\n\n"
             . "ORDERED SPECIMENS:\n"
             . ($waItemsStr ?: "1. Custom Print Specimen") . "\n\n"
             . "Subtotal: ৳{$subtotal} BDT\n"
             . "Courier Dispatch: ৳{$shipping} BDT\n"
             . "Total Paid: ৳{$total} BDT\n"
             . "Payment Method: {$payMethod}\n"
             . "TrxID: {$trxId}";

  $waHref = "https://wa.me/8801754550297?text=" . rawurlencode($rawWaText);
?>

<div class="k3d-order-page">
  <div class="k3d-order-top">
    <p class="k3d-kicker">WORKSHOP TICKET / CONFIRMED</p>
    <div style="display: flex; gap: 10px;">
      <button class="k3d-print-button" type="button" onclick="navigator.clipboard.writeText(document.getElementById('k3d-wa-raw-msg').value); this.innerText='COPIED ✓'; setTimeout(() => this.innerText='COPY TICKET', 2000);">COPY TICKET</button>
      <button class="k3d-print-button" type="button" onclick="window.print()">PRINT TICKET ↗</button>
    </div>
  </div>

  <textarea id="k3d-wa-raw-msg" style="display:none;"><?= esc($rawWaText) ?></textarea>

  <div class="k3d-ticket">
    <header class="k3d-ticket-header">
      <div>
        <a href="/" aria-label="Kerf Homepage">
          <img src="/assets/images/logo.svg" alt="Kerf Logo" style="height: 38px; width: auto; display: block; margin-bottom: 12px;">
        </a>
        <strong>ORDER RECEIVED.</strong>
        <p>Your artifact order has entered our Dhaka studio manufacturing queue.</p>
      </div>
      <div class="k3d-ticket-mark"><a href="/"><img src="/assets/images/favicon.svg" alt="Kerf Mark" style="height: 36px; width: auto;"></a></div>
    </header>

    <div class="k3d-ticket-rule"></div>

    <div class="k3d-order-meta">
      <div>
        <span>UNIQUE ORDER ID</span>
        <strong style="color: var(--k3d-rust); font-size: 15px;">#<?= $orderNum ?></strong>
      </div>
      <div>
        <span>DATE / TIME</span>
        <strong><?= esc(date('d M Y / H:i', strtotime($order['created_at'] ?? 'now'))) ?></strong>
      </div>
      <div>
        <span>PAYMENT</span>
        <strong><?= $payMethod ?> / <?= strtoupper(esc($order['payment_status'] ?? 'PENDING')) ?></strong>
      </div>
    </div>

    <!-- ── High-Priority WhatsApp Confirmation Action ── -->
    <div class="k3d-wa-order-box" style="margin: 24px 0; padding: 20px 24px; background: #181818; color: #fff; border: 2px solid #181818; font-family: var(--k3d-mono);">
      <div style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
        <div>
          <span style="display: inline-block; background: #25D366; color: #fff; padding: 2px 8px; font-size: 10px; font-weight: bold; letter-spacing: 0.05em; margin-bottom: 6px;">
            ✦ WORKSHOP WHATSAPP CONFIRMATION DESK
          </span>
          <h3 style="margin: 0; font-family: var(--k3d-display); font-size: 18px; color: #fff; letter-spacing: -0.01em;">
            Connect with our manufacturing operator.
          </h3>
          <p style="margin: 6px 0 0 0; font-size: 11px; color: #bdb6ad; max-width: 500px; line-height: 1.5;">
            Send your unique ticket number and MakerWorld model links directly to our studio hotline for immediate slicer verification and print queue scheduling.
          </p>
        </div>
        <div>
          <a href="<?= $waHref ?>" target="_blank" rel="noopener" class="k3d-button is-style-fill" style="background: #25D366; color: #fff; border: 0; padding: 14px 22px; font-size: 11px; font-weight: bold; text-decoration: none; display: inline-flex; align-items: center; gap: 8px;">
            <span>SEND TO WHATSAPP (+880 1754-550297)</span>
            <span>&nearr;</span>
          </a>
        </div>
      </div>
    </div>

    <!-- ── Itemized Order Table with MakerWorld Links ── -->
    <section class="k3d-ticket-items-section" style="margin: 36px 0;">
      <h3 style="font-family: var(--k3d-mono); font-size: 11px; color: var(--k3d-meta); letter-spacing: 0.1em; margin-bottom: 12px; text-transform: uppercase;">
        01 / ITEMIZED ARTIFACT DOSSIER & MAKERWORLD MODELS
      </h3>

      <div style="border: 2px solid var(--k3d-ink); background: #fff;">
        <table style="width: 100%; border-collapse: collapse; font-family: var(--k3d-mono);">
          <thead>
            <tr style="background: rgba(24, 24, 24, 0.05); border-bottom: 2px solid var(--k3d-ink); font-size: 10px; color: var(--k3d-meta);">
              <th style="padding: 12px 16px; text-align: left;">SPECIMEN ITEM</th>
              <th style="padding: 12px 16px; text-align: left;">SPECIFICATIONS / SHADE</th>
              <th style="padding: 12px 16px; text-align: center;">QTY</th>
              <th style="padding: 12px 16px; text-align: right;">UNIT</th>
              <th style="padding: 12px 16px; text-align: right;">TOTAL</th>
            </tr>
          </thead>
          <tbody>
            <?php if (!empty($orderItems)): ?>
              <?php foreach ($orderItems as $item): ?>
                <?php
                  $pName = esc($item['product_name_snapshot'] ?? 'Specimen');
                  $pSpecs = esc($item['specs_snapshot'] ?? 'Standard');
                  $pQty = (int) ($item['quantity'] ?? 1);
                  $pUnit = number_format((float) ($item['unit_price_bdt'] ?? 0), 2);
                  $pTotal = number_format((float) ($item['line_total_bdt'] ?? 0), 2);
                  $mwLink = !empty($item['makerworld_url_snapshot']) ? trim($item['makerworld_url_snapshot']) : '';
                ?>
                <tr style="border-bottom: 1px dashed var(--k3d-border);">
                  <td style="padding: 14px 16px; vertical-align: top;">
                    <strong style="font-size: 13px; color: var(--k3d-ink); display: block;"><?= $pName ?></strong>
                    <?php if (!empty($mwLink)): ?>
                      <div style="margin-top: 6px;">
                        <a href="<?= esc($mwLink) ?>" target="_blank" rel="noopener" style="display: inline-flex; align-items: center; gap: 4px; font-size: 10px; color: var(--k3d-rust); background: rgba(200, 100, 70, 0.1); padding: 3px 8px; border: 1px solid rgba(200, 100, 70, 0.3); text-decoration: none; font-weight: bold;">
                          <span>MAKERWORLD MODEL ↗</span>
                        </a>
                      </div>
                    <?php endif; ?>
                  </td>
                  <td style="padding: 14px 16px; vertical-align: top; font-size: 11px; color: var(--k3d-meta);">
                    <?= $pSpecs ?>
                  </td>
                  <td style="padding: 14px 16px; vertical-align: top; text-align: center; font-size: 12px; font-weight: bold;">
                    <?= $pQty ?>
                  </td>
                  <td style="padding: 14px 16px; vertical-align: top; text-align: right; font-size: 12px;">
                    ৳<?= $pUnit ?>
                  </td>
                  <td style="padding: 14px 16px; vertical-align: top; text-align: right; font-size: 13px; font-weight: bold; color: var(--k3d-ink);">
                    ৳<?= $pTotal ?>
                  </td>
                </tr>
              <?php endforeach; ?>
            <?php else: ?>
              <tr>
                <td colspan="5" style="padding: 24px; text-align: center; color: var(--k3d-meta); font-size: 12px;">
                  No item breakdown available.
                </td>
              </tr>
            <?php endif; ?>
          </tbody>
          <tfoot>
            <tr style="border-top: 2px solid var(--k3d-ink); background: rgba(24, 24, 24, 0.02);">
              <td colspan="3" style="padding: 10px 16px; font-size: 11px; color: var(--k3d-meta);">SUBTOTAL (ARTIFACTS)</td>
              <td colspan="2" style="padding: 10px 16px; text-align: right; font-size: 12px; font-weight: bold;">৳<?= $subtotal ?></td>
            </tr>
            <tr style="background: rgba(24, 24, 24, 0.02);">
              <td colspan="3" style="padding: 8px 16px; font-size: 11px; color: var(--k3d-meta);">COURIER SHIPPING (<?= $zone ?>)</td>
              <td colspan="2" style="padding: 8px 16px; text-align: right; font-size: 12px; font-weight: bold;">৳<?= $shipping ?></td>
            </tr>
            <tr style="border-top: 1px dashed var(--k3d-border); background: rgba(200, 100, 70, 0.06);">
              <td colspan="3" style="padding: 14px 16px; font-size: 13px; font-weight: bold; color: var(--k3d-rust);">TOTAL PAYABLE</td>
              <td colspan="2" style="padding: 14px 16px; text-align: right; font-size: 16px; font-weight: bold; color: var(--k3d-rust);">৳<?= $total ?> BDT</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </section>

    <h2>Production<br><em>queue.</em></h2>

    <!-- 4 Stages Progress Stepper -->
    <ol class="k3d-queue" aria-label="Four-stage workshop progress">
      <li class="<?= in_array($order['order_status'] ?? 'received', ['received', 'slicing', 'printing', 'dispatched', 'delivered']) ? 'is-complete' : '' ?>">
        <span class="k3d-queue-dot">✓</span>
        <div>
          <strong>01 / ORDER RECEIVED</strong>
          <p>Order recorded and payment intake logged.</p>
        </div>
        <b>COMPLETE</b>
      </li>
      <li class="<?= ($order['order_status'] ?? 'received') === 'slicing' ? 'is-active' : (in_array($order['order_status'] ?? '', ['printing', 'dispatched', 'delivered']) ? 'is-complete' : '') ?>">
        <span class="k3d-queue-dot">●</span>
        <div>
          <strong>02 / MESH SLICING & MACHINE ALLOCATION</strong>
          <p>Geometry verified in Bambu Studio for Bambu Lab A1 build plate.</p>
        </div>
        <b><?= ($order['order_status'] ?? 'received') === 'slicing' ? 'ACTIVE NOW' : 'UP NEXT' ?></b>
      </li>
      <li class="<?= ($order['order_status'] ?? '') === 'printing' ? 'is-active' : (in_array($order['order_status'] ?? '', ['dispatched', 'delivered']) ? 'is-complete' : '') ?>">
        <span class="k3d-queue-dot">○</span>
        <div>
          <strong>03 / 3D PRINTING IN PROGRESS</strong>
          <p>FDM production on 0.4mm nozzle with selected polymer profile.</p>
        </div>
        <b><?= ($order['order_status'] ?? '') === 'printing' ? 'PRINTING' : 'QUEUED' ?></b>
      </li>
      <li class="<?= in_array($order['order_status'] ?? '', ['dispatched', 'delivered']) ? 'is-complete' : '' ?>">
        <span class="k3d-queue-dot">○</span>
        <div>
          <strong>04 / DISPATCHED VIA COURIER</strong>
          <p><?= esc($order['courier_provider'] ?? 'Steadfast / Pathao') ?> parcel tracking issued upon pickup from Dhaka.</p>
        </div>
        <b><?= ($order['order_status'] ?? '') === 'dispatched' ? 'IN TRANSIT' : 'ESTIMATED' ?></b>
      </li>
    </ol>

    <div class="k3d-ticket-columns">
      <div>
        <span>DELIVER TO</span>
        <strong><?= $custName ?></strong>
        <p>
          <?= nl2br($address) ?><br>
          Phone: <?= $custPhone ?>
        </p>
      </div>
      <div>
        <span>ORDER BREAKDOWN</span>
        <strong>TOTAL DUE: ৳<?= $total ?> BDT</strong>
        <p>
          Shipping: <?= $zone ?><br>
          Payment: <?= $payMethod ?><br>
          TrxID: <?= $trxId ?>
        </p>
      </div>
    </div>

    <footer class="k3d-ticket-footer">
      <span>THANK YOU FOR SUPPORTING LOCAL ADDITIVE MAKING.</span>
      <span>KERF3D.STORE / #<?= $orderNum ?></span>
    </footer>
  </div>
</div>
<?= $this->endSection() ?>
