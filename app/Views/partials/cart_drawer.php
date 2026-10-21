<div class="k3d-cart-drawer" id="k3d-cart-drawer" role="dialog" aria-label="Shopping bag" aria-modal="true">
  <div class="k3d-cart-backdrop"></div>
  <aside class="k3d-receipt-panel">
    <header class="k3d-receipt-header">
      <div>
        <strong>KERF 3D STUDIO</strong>
        <span>DHAKA, BANGLADESH</span>
      </div>
      <button class="k3d-cart-close" type="button" aria-label="Close shopping bag">×</button>
    </header>

    <div class="k3d-receipt-intro">
      <span>ITEMIZED ORDER RECEIPT</span>
      <span id="k3d-cart-timestamp"><?= date('d M Y / H:i') ?></span>
    </div>

    <div class="k3d-receipt-items" id="k3d-cart-items-container">
      <!-- Empty Cart State -->
      <div class="k3d-cart-empty-notice" style="padding: 40px 0; text-align: center; color: var(--k3d-meta); font-family: var(--k3d-mono); font-size: 11px;">
        YOUR ARTIFACT BAG IS CURRENTLY EMPTY.
      </div>
    </div>

    <div class="k3d-receipt-rule"></div>

    <div class="k3d-shipping-select">
      <span>COURIER REGION</span>
      <label>
        <input type="radio" name="drawer-courier-region" value="inside_dhaka" checked> 
        INSIDE DHAKA <strong>৳70</strong><small>24—48H</small>
      </label>
      <label>
        <input type="radio" name="drawer-courier-region" value="outside_dhaka"> 
        OUTSIDE DHAKA <strong>৳130</strong><small>2—4 DAYS</small>
      </label>
    </div>

    <div class="k3d-receipt-totals">
      <div><span>ARTIFACTS</span><b id="k3d-cart-subtotal">৳0</b></div>
      <div><span>COURIER / ESTIMATE</span><b id="k3d-cart-shipping">৳70</b></div>
      <div class="k3d-total"><span>TOTAL DUE</span><b id="k3d-cart-total">৳70</b></div>
    </div>

    <p class="k3d-receipt-note">CUSTOM STL ORDERS REQUIRE A MANDATORY ৳100 BKASH ADVANCE DEPOSIT.</p>
    <a class="k3d-checkout-button" href="/checkout">PROCEED TO CHECKOUT <span>→</span></a>

    <footer class="k3d-receipt-footer">
      <span>THANK YOU FOR SUPPORTING LOCAL MAKING</span>
      <span>KERF3D.STORE</span>
    </footer>
  </aside>
</div>
