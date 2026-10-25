<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-checkout-page">
  <header class="k3d-checkout-heading">
    <p class="k3d-kicker">CHECKOUT / ORDER INTAKE</p>
    <h1>Complete your<br><em>artifact order.</em></h1>
  </header>

  <div class="k3d-checkout-layout">
    <main class="k3d-checkout-form">
      <form action="/checkout/place-order" method="POST" id="k3d-checkout-form">
        <?= csrf_field() ?>

        <!-- 01 / Contact Details -->
        <section class="k3d-form-section">
          <div class="k3d-section-head">
            <span>01 / CONTACT</span>
            <b>REQUIRED</b>
          </div>
          <div class="k3d-form-grid">
            <label>
              FULL NAME
              <input type="text" name="customer_name" required placeholder="e.g. Redwan Ahmmed">
            </label>
            <label>
              PHONE (FOR COURIER CONTACT)
              <input type="tel" name="customer_phone" required placeholder="01XXXXXXXXX">
            </label>
            <label class="k3d-wide-field">
              EMAIL (FOR WORKSHOP TICKET & TRACKING)
              <input type="email" name="customer_email" placeholder="you@example.com">
            </label>
          </div>
        </section>

        <!-- 02 / Delivery Region & Address -->
        <section class="k3d-form-section">
          <div class="k3d-section-head">
            <span>02 / DELIVERY REGION</span>
            <b>COURIER RATE</b>
          </div>
          <div class="k3d-region-options">
            <label>
              <input type="radio" name="shipping_zone" value="inside_dhaka" checked onchange="updateShipping(70)">
              <strong>INSIDE DHAKA</strong>
              <span>৳70 · 24—48H</span>
            </label>
            <label>
              <input type="radio" name="shipping_zone" value="outside_dhaka" onchange="updateShipping(130)">
              <strong>OUTSIDE DHAKA</strong>
              <span>৳130 · 2—4 DAYS (NATIONWIDE)</span>
            </label>
          </div>
          <label class="k3d-address-field">
            DELIVERY ADDRESS
            <textarea name="delivery_address" rows="3" required placeholder="Apartment / House, Road, Area, District"></textarea>
          </label>
        </section>

        <!-- 03 / Payment Intake -->
        <section class="k3d-form-section">
          <div class="k3d-section-head">
            <span>03 / PAYMENT</span>
            <b>SECURE INTAKE</b>
          </div>
          <div class="k3d-payment-options">
            <label class="k3d-payment-option is-selected" id="k3d-pay-mfs-label">
              <input type="radio" name="payment_method" value="bkash" checked onchange="togglePayMethod('bkash')">
              <div>
                <strong>bKASH / NAGAD / ROCKET (MFS SEND MONEY)</strong>
                <div style="margin-top: 6px; font-size: 11px;">
                  Send money to: <strong id="k3d-mfs-num-display" style="color:var(--k3d-rust); font-size:13px; font-family:var(--k3d-mono);"><?= esc($mfsNumber ?? '01XXXXXXXXX') ?></strong>
                  <button type="button" onclick="navigator.clipboard.writeText('<?= esc($mfsNumber ?? '01XXXXXXXXX') ?>'); this.innerText='COPIED ✓'; setTimeout(() => this.innerText='COPY', 2000);" style="background:var(--k3d-ink); color:#fff; border:0; padding:3px 8px; font-size:9px; font-family:var(--k3d-mono); cursor:pointer; margin-left:8px;">COPY</button>
                </div>
                <small style="display:block; margin-top:4px; color:var(--k3d-meta);">Enter the 8-10 digit Transaction ID (TrxID) received via SMS.</small>
              </div>
            </label>
            <label class="k3d-payment-option" id="k3d-pay-cod-label">
              <input type="radio" name="payment_method" value="cod" onchange="togglePayMethod('cod')">
              <div>
                <strong>CASH ON DELIVERY (DHAKA & NATIONWIDE)</strong>
                <small style="display:block; margin-top:4px; color:var(--k3d-meta);">Pay courier at your doorstep upon inspecting artifact packaging.</small>
              </div>
            </label>
          </div>
          <label class="k3d-trxid-field">
            TRANSACTION ID (TrxID)
            <input type="text" name="trx_id" placeholder="Enter 8-10 digit TrxID from SMS">
          </label>
          <p class="k3d-deposit-alert">
            CUSTOM STL ORDERS REQUIRE A MANDATORY <strong>৳100 BKASH ADVANCE DEPOSIT</strong> BEFORE SLICING & QUEUE ASSIGNMENT.
          </p>
        </section>

        <button class="k3d-place-order" type="submit">
          PLACE ORDER & ISSUE TICKET <span>→</span>
        </button>
      </form>
    </main>

    <!-- Sticky Invoice Sidebar -->
    <aside class="k3d-invoice-card">
      <div class="k3d-invoice-brand" style="display: flex; align-items: center; justify-content: space-between; border-bottom: 1px dashed rgba(255,255,255,0.2); padding-bottom: 14px; margin-bottom: 16px;">
        <a href="/" aria-label="Kerf Homepage">
          <img src="/assets/images/logo.svg" alt="Kerf Logo" style="height: 32px; width: auto; filter: invert(1); opacity: 0.95; display: block;">
        </a>
        <span style="font-size: 9px; color: #bdb6ad; font-family: var(--k3d-mono); letter-spacing: 0.1em;">ORDER INVOICE // DRAFT</span>
      </div>

      <div class="k3d-invoice-items">
        <?php if (!empty($cartItems)): ?>
          <?php foreach ($cartItems as $item): ?>
            <div>
              <span><?= esc($item['name']) ?><br><small><?= esc($item['specs']) ?> × <?= esc($item['quantity']) ?></small></span>
              <b>৳<?= number_format($item['line_total'], 2) ?></b>
            </div>
          <?php endforeach; ?>
        <?php else: ?>
          <div>
            <span>ARC VESSEL (SPECIMEN DRAFT)<br><small>PLA / TERRACOTTA / 140G × 1</small></span>
            <b>৳780</b>
          </div>
        <?php endif; ?>
      </div>

      <div class="k3d-invoice-rule"></div>
      <div class="k3d-invoice-row">
        <span>ARTIFACTS</span>
        <b id="k3d-inv-subtotal">৳<?= number_format($cartSubtotal ?? 780, 2) ?></b>
      </div>
      <div class="k3d-invoice-row">
        <span>COURIER</span>
        <b id="k3d-inv-shipping">৳70</b>
      </div>
      <div class="k3d-invoice-total">
        <span>TOTAL DUE NOW</span>
        <b id="k3d-inv-total">৳<?= number_format(($cartSubtotal ?? 780) + 70, 2) ?></b>
      </div>
      <p class="k3d-invoice-note">Prices in BDT. Orders enter the workshop queue immediately following TrxID payment verification.</p>
    </aside>
  </div>
</div>

<script>
    function updateShipping(rate) {
        document.getElementById('k3d-inv-shipping').innerText = '৳' + rate.toFixed(2);
        const subtotal = <?= (float) ($cartSubtotal ?? 780) ?>;
        const total = subtotal + rate;
        document.getElementById('k3d-inv-total').innerText = '৳' + total.toLocaleString('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
    }

    function togglePayMethod(method) {
        const mfsLabel = document.getElementById('k3d-pay-mfs-label');
        const codLabel = document.getElementById('k3d-pay-cod-label');
        const trxField = document.querySelector('.k3d-trxid-field');
        const trxInput = document.querySelector('input[name="trx_id"]');

        if (method === 'bkash') {
            if (mfsLabel) mfsLabel.classList.add('is-selected');
            if (codLabel) codLabel.classList.remove('is-selected');
            if (trxField) trxField.style.opacity = '1';
            if (trxInput) trxInput.placeholder = 'Enter 8-10 digit TrxID from SMS';
        } else {
            if (codLabel) codLabel.classList.add('is-selected');
            if (mfsLabel) mfsLabel.classList.remove('is-selected');
            if (trxField) trxField.style.opacity = '0.6';
            if (trxInput) trxInput.placeholder = 'Optional for Cash on Delivery';
        }
    }
</script>
<?= $this->endSection() ?>
