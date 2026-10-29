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

      $progressPct = 25;
      if ($isDelivered) { $progressPct = 100; }
      elseif ($isDispatched) { $progressPct = 85; }
      elseif ($isPrinting) { $progressPct = 65; }
      elseif ($isSlicing) { $progressPct = 45; }
    ?>

    <div class="k3d-track-result">
      <div class="k3d-track-header">
        <div>
          <div class="k3d-track-label">WORKSHOP TICKET</div>
          <div class="k3d-track-id"><?= esc($order['order_number']) ?></div>
        </div>
        <div style="display: flex; align-items: center; gap: 10px; flex-wrap: wrap;">
          <button type="button" onclick="copyTrackUrl('<?= esc($order['order_number']) ?>')" class="k3d-track-btn" style="height: 34px; padding: 0 14px; font-size: 11px; background: var(--k3d-paper); color: var(--k3d-ink); border: 1px solid var(--k3d-ink); cursor: pointer; display: inline-flex; align-items: center; gap: 6px;">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M10 13a5 5 0 0 0 7.54.54l3-3a5 5 0 0 0-7.07-7.07l-1.72 1.71"></path><path d="M14 11a5 5 0 0 0-7.54-.54l-3 3a5 5 0 0 0 7.07 7.07l1.71-1.71"></path></svg>
            <span id="k3d-copy-btn-text">COPY TRACKING LINK</span>
          </button>
          <button type="button" onclick="copySmsText('<?= esc($order['order_number']) ?>', '<?= number_format((float)($order['total_bdt'] ?? 0), 2) ?>')" class="k3d-track-btn" style="height: 34px; padding: 0 14px; font-size: 11px; background: var(--k3d-paper); color: var(--k3d-ink); border: 1px solid var(--k3d-ink); cursor: pointer; display: inline-flex; align-items: center; gap: 6px;">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
            <span id="k3d-sms-btn-text">COPY SMS / GATE TEXT</span>
          </button>
          <?php
            $shareText = rawurlencode("Track my Kerf 3D workshop job #{$order['order_number']}: " . base_url('track?ticket=' . $order['order_number']));
          ?>
          <a href="https://wa.me/?text=<?= $shareText ?>" target="_blank" rel="noopener" class="k3d-track-btn" style="height: 34px; padding: 0 14px; font-size: 11px; background: #25d366; color: #fff; border: 1px solid #1ebe5d; text-decoration: none; display: inline-flex; align-items: center; gap: 6px;">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor"><path d="M12.031 6.172c-3.181 0-5.767 2.586-5.768 5.766-.001 1.298.38 2.27 1.019 3.287l-.711 2.598 2.664-.698c.969.585 1.961.933 2.796.933 3.183 0 5.769-2.587 5.769-5.769.001-3.18-2.584-5.717-5.769-5.717zm3.364 8.163c-.144.405-.837.774-1.17.825-.311.047-.704.074-2.18-.537-1.745-.722-2.87-2.484-2.957-2.6-.087-.116-.708-.941-.708-1.792s.448-1.27.607-1.442c.159-.172.348-.216.464-.216.116 0 .232.002.333.007.106.005.249-.04.39.299.144.35.493 1.2.536 1.288.043.088.072.19.014.305-.058.115-.087.188-.174.289-.087.102-.183.228-.261.306-.087.087-.178.182-.077.355.101.173.45 0.742.966 1.202.664.591 1.224.774 1.397.861.174.087.275.072.376-.044.102-.116.435-.506.55-.68.116-.174.232-.145.391-.087s1.013.478 1.187.565c.174.087.29.13.333.203.044.072.044.419-.1 0.824zM12 2C6.477 2 2 6.477 2 12c0 1.891.524 3.662 1.436 5.178L2 22l4.978-1.398A9.956 9.956 0 0 0 12 22c5.523 0 10-4.477 10-10S17.523 2 12 2z"/></svg>
            <span>SHARE ON WHATSAPP</span>
          </a>
          <a href="/track/receipt/<?= esc($order['order_number']) ?>" target="_blank" class="k3d-track-btn" style="height: 34px; padding: 0 14px; font-size: 11px; background: var(--k3d-ink); color: #fff; text-decoration: none; display: inline-flex; align-items: center; gap: 6px; border: 1px solid var(--k3d-ink);">
            <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><polyline points="6 9 6 2 18 2 18 9"></polyline><path d="M6 18H4a2 2 0 0 1-2-2v-5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2h-2"></path><rect x="6" y="14" width="12" height="8"></rect></svg>
            PRINT INVOICE / RECEIPT
          </a>
          <span style="font-family: var(--k3d-mono, monospace); font-size: 10px; font-weight: 700; padding: 6px 10px; background: rgba(0,0,0,0.06); border: 1px solid rgba(0,0,0,0.15); letter-spacing: 0.05em;">
            [ <?= $progressPct ?>% FULFILLED ]
          </span>
          <span class="k3d-track-status-pill status-<?= esc($status) ?>">
            STATUS: <?= esc($status) ?>
          </span>
        </div>
      </div>

      <?php if (!$isCancelled && !$isDelivered): ?>
        <div id="k3d-poll-ticker" style="display: flex; align-items: center; justify-content: space-between; padding: 8px 16px; background: rgba(28, 25, 23, 0.03); border-top: 1px dashed var(--k3d-border); border-bottom: 1px dashed var(--k3d-border); font-family: var(--k3d-mono); font-size: 10px; color: var(--k3d-meta);">
          <div style="display: flex; align-items: center; gap: 8px;">
            <span style="display: inline-block; width: 6px; height: 6px; border-radius: 50%; background: #16a34a;"></span>
            <span>WORKSHOP TELEMETRY ACTIVE &mdash; AUTO-REFRESHING IN <strong id="k3d-poll-timer">60s</strong></span>
          </div>
          <button type="button" onclick="window.location.reload()" style="background: none; border: none; color: var(--k3d-ink); font-family: var(--k3d-mono); font-size: 10px; font-weight: 700; cursor: pointer; text-decoration: underline;">
            REFRESH NOW &rarr;
          </button>
        </div>
      <?php endif; ?>

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
          <span class="k3d-track-val"><?= esc($customer['name'] ?? $customer['full_name'] ?? 'Guest Customer') ?></span>
          <small style="color: var(--k3d-meta); font-family: var(--font-mono); font-size: 11px;">
            <?= esc($customer['address_line'] ?? $customer['address_line1'] ?? 'Dhaka') ?>
            (<?= $order['shipping_zone'] === 'inside_dhaka' ? 'Inside Dhaka' : 'Outside Dhaka' ?>)
            <?php if (!empty($customer['phone'])): ?>
              &middot; <?= esc($customer['phone']) ?>
            <?php endif; ?>
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

<script>
function copyTrackUrl(ticket) {
    const url = window.location.origin + '/track?ticket=' + encodeURIComponent(ticket);
    if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(url).then(() => {
            if (typeof window.k3dToast === 'function') {
                window.k3dToast('TRACKING LINK COPIED TO CLIPBOARD', '🔗');
            }
            const btn = document.getElementById('k3d-copy-btn-text');
            if (btn) {
                const orig = btn.innerText;
                btn.innerText = 'COPIED ✓';
                setTimeout(() => { btn.innerText = orig; }, 2500);
            }
        });
    }
}

function copySmsText(ticket, total) {
    const text = `Kerf 3D Delivery: Ticket #${ticket}. Total: ৳${total}. Track at https://kerf3d.store/track?ticket=${ticket}`;
    if (navigator.clipboard && navigator.clipboard.writeText) {
        navigator.clipboard.writeText(text).then(() => {
            if (typeof window.k3dToast === 'function') {
                window.k3dToast('SMS / GATE TEXT COPIED TO CLIPBOARD', '💬');
            }
            const btn = document.getElementById('k3d-sms-btn-text');
            if (btn) {
                const orig = btn.innerText;
                btn.innerText = 'COPIED ✓';
                setTimeout(() => { btn.innerText = orig; }, 2500);
            }
        });
    }
}

// 60-Second Auto-Polling Ticker
(function() {
    const tickerEl = document.getElementById('k3d-poll-timer');
    if (!tickerEl) return;
    let timeLeft = 60;
    const interval = setInterval(() => {
        timeLeft--;
        if (tickerEl) tickerEl.innerText = timeLeft + 's';
        if (timeLeft <= 0) {
            clearInterval(interval);
            window.location.reload();
        }
    }, 1000);
})();
</script>
<?= $this->endSection() ?>
