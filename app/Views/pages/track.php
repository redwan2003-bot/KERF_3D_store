<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-container k3d-track-page">
  <div class="k3d-track-hero">
    <div>
      <p class="k3d-kicker">LIVE FULFILLMENT / DISPATCH TELEMETRY</p>
      <h1>Track your<br><em>workshop job.</em></h1>
      <p>Enter your unique Workshop Ticket ID (e.g., <code>K3D-261025-1C95</code>) to inspect live slicer queues, print head status, and courier dispatch.</p>
    </div>
    <div class="k3d-machine-tag">
      <span>WORKSHOP DISPATCH</span>
      <strong>BAMBU LAB A1</strong>
      <small>DHAKA WORKSHOP UNIT 01</small>
    </div>
  </div>

  <div class="k3d-track-form-card">
    <form action="/track" method="get" class="k3d-track-form-grid">
      <div class="k3d-track-field">
        <label for="track-ticket">TICKET / ORDER ID *</label>
        <input type="text" id="track-ticket" name="ticket" value="<?= esc($ticketQuery) ?>" placeholder="e.g. K3D-261025-1C95" required autocomplete="off" style="text-transform: uppercase;">
      </div>
      <div class="k3d-track-field">
        <label for="track-phone">CUSTOMER PHONE (OPTIONAL VERIFICATION)</label>
        <input type="text" id="track-phone" name="phone" value="<?= esc($phoneQuery) ?>" placeholder="e.g. 01754550297" autocomplete="off">
      </div>
      <div>
        <button type="submit" class="k3d-track-btn">
          <span>TRACK STATUS</span>
          <span>&rarr;</span>
        </button>
      </div>
    </form>
  </div>

  <?php if ($searched && $error): ?>
    <div style="margin-top: var(--space-xl); padding: var(--space-lg); border: 2px solid #ef4444; background: #fef2f2; color: #b91c1c; font-family: var(--font-mono); font-size: 13px;">
      <strong>[ERROR / TICKET NOT FOUND]</strong> <?= esc($error) ?>
    </div>
  <?php elseif ($searched && $order): ?>
    <?php
      $status = $order['order_status'] ?? 'received';
      $isReceived   = in_array($status, ['received', 'slicing', 'printing', 'dispatched', 'delivered']);
      $isSlicing    = in_array($status, ['slicing', 'printing', 'dispatched', 'delivered']);
      $isPrinting   = in_array($status, ['printing', 'dispatched', 'delivered']);
      $isDispatched = in_array($status, ['dispatched', 'delivered']);
      $isDelivered  = ($status === 'delivered');
      $isCancelled  = ($status === 'cancelled');
    ?>

    <div class="k3d-track-result">
      <div class="k3d-track-header">
        <div>
          <div class="k3d-track-label">WORKSHOP TICKET</div>
          <div class="k3d-track-id"><?= esc($order['order_number']) ?></div>
        </div>
        <div>
          <span class="k3d-track-status-pill status-<?= esc($status) ?>">
            STATUS: <?= esc($status) ?>
          </span>
        </div>
      </div>

      <!-- Live Stepper -->
      <div class="k3d-track-timeline">
        <?php if ($isCancelled): ?>
          <div style="padding: 12px; background: #fee2e2; border: 1px solid #f87171; color: #b91c1c; font-family: var(--font-mono); font-size: 13px; font-weight: 700;">
            NOTICE: This order ticket was cancelled. If you have questions, please reach out via our WhatsApp Hotline.
          </div>
        <?php else: ?>
          <ol class="k3d-stepper">
            <li class="k3d-step <?= $isReceived ? ($status === 'received' ? 'is-active' : 'is-done') : '' ?>">
              <div class="k3d-step-bar"></div>
              <span class="k3d-step-num">01 / QUEUE</span>
              <span class="k3d-step-title">ORDER RECEIVED</span>
              <span class="k3d-step-desc">Logged into workshop system & queued for technician review.</span>
            </li>
            <li class="k3d-step <?= $isSlicing ? ($status === 'slicing' ? 'is-active' : 'is-done') : '' ?>">
              <div class="k3d-step-bar"></div>
              <span class="k3d-step-num">02 / CAM</span>
              <span class="k3d-step-title">SLICING & PREP</span>
              <span class="k3d-step-desc">Toolpaths, infill & support calibrated in Bambu Studio.</span>
            </li>
            <li class="k3d-step <?= $isPrinting ? ($status === 'printing' ? 'is-active' : 'is-done') : '' ?>">
              <div class="k3d-step-bar"></div>
              <span class="k3d-step-num">03 / FABRICATION</span>
              <span class="k3d-step-title">PRINTING</span>
              <span class="k3d-step-desc">Layer deposition actively in progress on Bambu Lab A1.</span>
            </li>
            <li class="k3d-step <?= $isDispatched ? ($isDelivered ? 'is-done' : 'is-active') : '' ?>">
              <div class="k3d-step-bar"></div>
              <span class="k3d-step-num">04 / DISPATCH</span>
              <span class="k3d-step-title"><?= $isDelivered ? 'DELIVERED' : 'DISPATCHED' ?></span>
              <span class="k3d-step-desc">
                <?php if ($isDelivered): ?>
                  Handed over to customer. Fulfilled.
                <?php elseif (!empty($order['courier_tracking'])): ?>
                  In transit via <?= esc($order['courier_provider'] ?? 'Courier') ?> (#<?= esc($order['courier_tracking']) ?>).
                <?php else: ?>
                  En route via courier.
                <?php endif; ?>
              </span>
            </li>
          </ol>
        <?php endif; ?>
      </div>

      <!-- Telemetry Info Grid -->
      <div class="k3d-track-meta-grid">
        <div class="k3d-track-meta-cell">
          <span class="k3d-track-label">DESTINATION / RECIPIENT</span>
          <span class="k3d-track-val"><?= esc($customer['full_name'] ?? 'Guest Customer') ?></span>
          <small style="color: var(--k3d-meta); font-family: var(--font-mono); font-size: 11px;">
            <?= esc($customer['address_line1'] ?? '') ?>, <?= esc($customer['city'] ?? '') ?>
            (<?= $order['shipping_zone'] === 'inside_dhaka' ? 'Inside Dhaka' : 'Outside Dhaka' ?>)
          </small>
        </div>
        <div class="k3d-track-meta-cell">
          <span class="k3d-track-label">PAYMENT & SETTLEMENT</span>
          <span class="k3d-track-val">৳<?= number_format((float)($order['total_bdt'] ?? 0), 2) ?></span>
          <small style="color: var(--k3d-meta); font-family: var(--font-mono); font-size: 11px;">
            Method: <?= strtoupper(esc($order['payment_method'] ?? 'COD')) ?> &middot; 
            Payment: <?= strtoupper(esc($order['payment_status'] ?? 'PENDING')) ?>
            <?php if (!empty($order['trx_id'])): ?>
              &middot; TrxID: <?= esc($order['trx_id']) ?>
            <?php endif; ?>
          </small>
        </div>
      </div>

      <?php if (!empty($order['courier_tracking'])): ?>
        <div style="padding: var(--space-md) var(--space-lg); background: #f0fdf4; border-bottom: var(--border-thin); display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 8px;">
          <div>
            <strong style="font-family: var(--font-mono); font-size: 12px; color: #166534;">COURIER CONSIGNMENT:</strong>
            <span style="font-family: var(--font-mono); font-size: 12px; font-weight: 700; color: #166534; margin-left: 6px;"><?= esc($order['courier_provider'] ?? 'Steadfast') ?> — #<?= esc($order['courier_tracking']) ?></span>
          </div>
          <a href="https://steadfast.com.bd/t/<?= urlencode($order['courier_tracking']) ?>" target="_blank" rel="noopener" class="k3d-track-btn" style="height: 36px; padding: 0 16px; font-size: 11px; background: #166534;">
            TRACK ON COURIER ↗
          </a>
        </div>
      <?php endif; ?>

      <!-- Specimen Breakdown -->
      <div class="k3d-track-items">
        <div class="k3d-track-label" style="margin-bottom: 8px;">JOB SPECIMENS IN BATCH (<?= count($items) ?>)</div>
        <table class="k3d-track-items-table">
          <thead>
            <tr>
              <th>SPECIMEN</th>
              <th>SPECIFICATIONS</th>
              <th style="text-align: right;">QTY</th>
              <th style="text-align: right;">TOTAL</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($items as $item): ?>
              <tr>
                <td>
                  <strong><?= esc($item['product_name_snapshot'] ?? 'Specimen Artifact') ?></strong>
                  <?php if (!empty($item['makerworld_url_snapshot'])): ?>
                    <br><a href="<?= esc($item['makerworld_url_snapshot']) ?>" target="_blank" rel="noopener" style="font-size: 10px; color: var(--k3d-rust); text-decoration: underline;">MakerWorld Model ↗</a>
                  <?php endif; ?>
                </td>
                <td style="color: var(--k3d-meta); font-size: 11px;">
                  <?= esc($item['specs_snapshot'] ?? 'Standard Specifications') ?>
                </td>
                <td style="text-align: right;"><?= (int)$item['quantity'] ?></td>
                <td style="text-align: right;">৳<?= number_format((float)($item['line_total_bdt'] ?? 0), 2) ?></td>
              </tr>
            <?php endforeach; ?>
          </tbody>
        </table>
      </div>

      <div style="padding: var(--space-md) var(--space-lg); background: var(--k3d-paper); border-top: var(--border-thin); display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 8px;">
        <span style="font-family: var(--font-mono); font-size: 11px; color: var(--k3d-meta);">
          Need an update or customization on this print run?
        </span>
        <a href="https://wa.me/8801754550297?text=<?= urlencode("Hello Kerf 3D, I am inquiring about my Workshop Ticket #{$order['order_number']}.") ?>" target="_blank" rel="noopener" style="font-family: var(--font-mono); font-size: 11px; font-weight: 700; color: #16a34a; text-decoration: underline;">
          CONTACT WORKSHOP ON WHATSAPP (+880 1754-550297) ↗
        </a>
      </div>
    </div>
  <?php endif; ?>
</div>
<?= $this->endSection() ?>
