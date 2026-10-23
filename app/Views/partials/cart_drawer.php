<div class="k3d-cart-drawer" id="k3d-cart-drawer" role="dialog" aria-label="Shopping bag" aria-modal="true">
  <div class="k3d-cart-backdrop" id="k3d-cart-backdrop"></div>
  <aside class="k3d-receipt-panel">
    <header class="k3d-receipt-header">
      <div style="display: flex; align-items: center; gap: 12px;">
        <a href="/" style="display: flex; align-items: center; text-decoration: none;">
          <img src="/assets/images/logo.svg" alt="Kerf" style="height: 32px; width: auto; display: block;">
        </a>
        <span style="font-size: 9px; color: var(--k3d-meta); letter-spacing: 0.1em;">DHAKA INTAKE LEDGER</span>
      </div>
      <button class="k3d-cart-close" id="k3d-cart-close-btn" type="button" aria-label="Close shopping bag">&times;</button>
    </header>

    <div class="k3d-receipt-intro">
      <span>ITEMIZED RECEIPT / <span id="k3d-cart-badge-count">0 ITEMS</span></span>
      <span id="k3d-cart-timestamp"><?= date('d M Y / H:i') ?></span>
    </div>

    <!-- Dynamic Cart Items Container -->
    <div class="k3d-receipt-items" id="k3d-cart-items-container">
      <div class="k3d-cart-empty-notice" style="padding: 40px 0; text-align: center; color: var(--k3d-meta); font-family: var(--k3d-mono); font-size: 11px;">
        YOUR ARTIFACT BAG IS CURRENTLY EMPTY.
      </div>
    </div>

    <!-- Shipping Zone Switcher -->
    <div class="k3d-shipping-select">
      <span class="k3d-shipping-label-top">02 / COURIER REGION (STEADFAST / PATHAO)</span>
      <label class="k3d-shipping-option">
        <input type="radio" name="drawer-shipping-zone" value="inside_dhaka" checked onchange="window.k3dCart && window.k3dCart.setShipping(this.value)"> 
        <div>
          <strong>INSIDE DHAKA</strong>
          <small>24—48H Hub Delivery</small>
        </div>
        <b>৳70.00</b>
      </label>
      <label class="k3d-shipping-option">
        <input type="radio" name="drawer-shipping-zone" value="outside_dhaka" onchange="window.k3dCart && window.k3dCart.setShipping(this.value)"> 
        <div>
          <strong>OUTSIDE DHAKA</strong>
          <small>2—4 Days Nationwide Courier</small>
        </div>
        <b>৳130.00</b>
      </label>
    </div>

    <!-- Thermal Totals Block -->
    <div class="k3d-receipt-totals">
      <div class="k3d-totals-row">
        <span>SUBTOTAL (ARTIFACTS)</span>
        <b id="k3d-drawer-subtotal">৳0.00</b>
      </div>
      <div class="k3d-totals-row">
        <span>COURIER SHIPPING</span>
        <b id="k3d-drawer-shipping">৳70.00</b>
      </div>
      <div class="k3d-totals-row k3d-total-grand">
        <span>TOTAL DUE</span>
        <b id="k3d-drawer-grand-total">৳70.00</b>
      </div>
    </div>

    <p style="font-size: 10px; color: var(--k3d-meta); line-height: 1.5; margin: 18px 0 0 0; text-transform: uppercase;">
      ✦ CUSTOM CAD COMMISSIONS REQUIRE ৳100 ADVANCE DEPOSIT VIA BKASH BEFORE SLICING.
    </p>

    <!-- Proceed to Checkout Button -->
    <a class="k3d-checkout-button" href="/checkout" id="k3d-drawer-checkout-link">
      PROCEED TO CHECKOUT <span>&rarr;</span>
    </a>

    <footer class="k3d-receipt-footer">
      <span>LOCAL FDM ADDITIVE MANUFACTURING</span>
      <span>KERF3D.STORE</span>
    </footer>
  </aside>
</div>
