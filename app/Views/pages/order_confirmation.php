<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-order-page">
  <div class="k3d-order-top">
    <p class="k3d-kicker">WORKSHOP TICKET / CONFIRMED</p>
    <button class="k3d-print-button" type="button" onclick="window.print()">PRINT TICKET ↗</button>
  </div>

  <div class="k3d-ticket">
    <header class="k3d-ticket-header">
      <div>
        <span>KERF 3D STUDIO</span>
        <strong>ORDER RECEIVED.</strong>
        <p>Your artifact order has entered our workshop queue.</p>
      </div>
      <div class="k3d-ticket-mark">K3D<br>◒</div>
    </header>

    <div class="k3d-ticket-rule"></div>

    <div class="k3d-order-meta">
      <div>
        <span>ORDER ID</span>
        <strong>#<?= esc($order['order_number'] ?? 'K3D-9482') ?></strong>
      </div>
      <div>
        <span>DATE / TIME</span>
        <strong><?= esc(date('d M Y / H:i', strtotime($order['created_at'] ?? 'now'))) ?></strong>
      </div>
      <div>
        <span>PAYMENT</span>
        <strong><?= strtoupper(esc($order['payment_method'] ?? 'BKASH')) ?> / <?= strtoupper(esc($order['payment_status'] ?? 'PENDING')) ?></strong>
      </div>
    </div>

    <h2>Production<br><em>queue.</em></h2>

    <!-- 4 Stages Progress Stepper -->
    <ol class="k3d-queue" aria-label="Four-stage workshop progress">
      <li class="<?= in_array($order['order_status'] ?? 'received', ['received', 'slicing', 'printing', 'dispatched', 'delivered']) ? 'is-complete' : '' ?>">
        <span class="k3d-queue-dot">✓</span>
        <div>
          <strong>01 / ORDER RECEIVED</strong>
          <p>Order details recorded and payment intake logged.</p>
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
        <strong><?= esc($customer['name'] ?? 'Studio Customer') ?></strong>
        <p>
          <?= nl2br(esc($customer['address_line'] ?? 'Dhanmondi, Dhaka')) ?><br>
          Phone: <?= esc($customer['phone'] ?? '01XXXXXXXXX') ?>
        </p>
      </div>
      <div>
        <span>ORDER BREAKDOWN</span>
        <strong>TOTAL PAID: ৳<?= number_format($order['total_bdt'] ?? 1370, 2) ?></strong>
        <p>
          Shipping: <?= esc(($order['shipping_zone'] ?? 'inside_dhaka') === 'inside_dhaka' ? 'Inside Dhaka (৳70)' : 'Outside Dhaka (৳130)') ?><br>
          TrxID: <?= esc($order['trx_id'] ?? 'VERIFICATION_PENDING') ?>
        </p>
      </div>
    </div>

    <footer class="k3d-ticket-footer">
      <span>THANK YOU FOR SUPPORTING LOCAL ADDITIVE MAKING.</span>
      <span>KERF3D.STORE / #<?= esc($order['order_number'] ?? 'K3D-9482') ?></span>
    </footer>
  </div>
</div>
<?= $this->endSection() ?>
