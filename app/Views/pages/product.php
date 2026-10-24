<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-product-page">
  <header class="k3d-product-header">
    <p class="k3d-kicker">ARCHIVE / OBJECT DETAIL</p>
    <p class="k3d-breadcrumb"><a href="/shop">ARCHIVE</a> / <?= esc($product['name']) ?></p>
  </header>

  <div class="k3d-product-layout">
    <!-- Image Gallery from Google Drive -->
    <div class="k3d-product-gallery">
      <div class="k3d-gallery-main" id="k3d-gallery-viewport">
        <?php 
          $primaryImg = $product['images'][0] ?? null;
          $mainSrc = '';
          if (!empty($primaryImg['filename']) && file_exists(FCPATH . 'assets/images/products/' . $primaryImg['filename'])) {
              $fullFile = FCPATH . 'assets/images/products/' . $primaryImg['filename'];
              $mainSrc = '/assets/images/products/' . esc($primaryImg['filename']) . '?v=' . filemtime($fullFile);
          } elseif (!empty($primaryImg['drive_thumbnail_url'])) {
              $mainSrc = esc($primaryImg['drive_thumbnail_url']);
          } elseif (!empty($primaryImg['drive_url'])) {
              $mainSrc = esc($primaryImg['drive_url']);
          }
        ?>
        <?php if (!empty($mainSrc)): ?>
          <img id="k3d-main-img" src="<?= $mainSrc ?>" alt="<?= esc($product['name']) ?>" style="width: 100%; height: 100%; object-fit: contain;">
        <?php else: ?>
          <span class="k3d-gallery-stamp"><?= esc($product['sku']) ?><br>SPECIMEN</span>
          <span class="k3d-gallery-object"></span>
          <span class="k3d-gallery-axis">X / Y / Z</span>
        <?php endif; ?>
      </div>

      <?php if (!empty($product['images']) && count($product['images']) > 1): ?>
      <div class="k3d-gallery-thumbs">
        <?php foreach ($product['images'] as $idx => $img): ?>
          <button type="button" class="<?= $idx === 0 ? 'is-selected' : '' ?>" onclick="document.getElementById('k3d-main-img').src = '<?= esc($img['drive_url']) ?>'; document.querySelectorAll('.k3d-gallery-thumbs button').forEach(b => b.classList.remove('is-selected')); this.classList.add('is-selected');">
            <img src="<?= esc($img['drive_thumbnail_url'] ?? $img['drive_url']) ?>" alt="View <?= $idx + 1 ?>" style="width: 100%; height: 100%; object-fit: cover;">
          </button>
        <?php endforeach; ?>
      </div>
      <?php endif; ?>
    </div>

    <!-- Product Meta & Purchase Panel -->
    <div class="k3d-product-info">
      <div class="k3d-inventory-line">
        <span>INVENTORY NO: <?= esc($product['sku']) ?></span>
        <b><?= esc($product['status'] === 'active' ? 'IN STOCK · DHAKA HUB' : 'WORKSHOP QUEUE') ?></b>
      </div>

      <h1><?= esc($product['name']) ?></h1>
      <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
        <p class="k3d-product-price">৳<?= number_format($product['price_bdt'] ?? 0, 2) ?> <small>BDT / READY-MADE</small></p>
      <?php else: ?>
        <p class="k3d-product-price"><span style="color: var(--k3d-rust); font-weight: 700;">PRICE ON REQUEST</span> <small>CUSTOM WORKSHOP INTAKE</small></p>
      <?php endif; ?>

      <p class="k3d-product-description">
        <?= esc($product['description'] ?? $product['short_description'] ?? 'Curated artifact printed to order on Bambu Lab A1 hardware in Dhaka.') ?>
      </p>

      <!-- Variation Selector -->
      <?php if (!empty($variations)): ?>
      <div class="k3d-variation-block">
        <span class="k3d-field-label">AVAILABLE VARIATIONS</span>
        <div class="k3d-variation-options">
          <?php foreach ($variations as $idx => $v): ?>
            <button type="button" class="k3d-var-btn <?= $idx === 0 ? 'is-selected' : '' ?>" data-price="<?= esc($v['price_bdt']) ?>" data-variation-id="<?= esc($v['id']) ?>">
              <i class="swatch" style="background-color: <?= esc($v['hex_color'] ?? '#C86446') ?>;"></i>
              <span><?= esc($v['material_name']) ?> · <?= esc($v['shade_name']) ?></span>
              <b style="margin-left: auto;">৳<?= number_format($v['price_bdt'], 2) ?></b>
            </button>
          <?php endforeach; ?>
        </div>
      </div>
      <?php endif; ?>

      <!-- 2×2 Bambu A1 Technical Specification Grid -->
      <div class="k3d-spec-grid">
        <div>
          <span>MATERIAL COMPOSITION</span>
          <strong><?= esc($product['material_name'] ?? 'BIO-PLA') ?></strong>
        </div>
        <div>
          <span>LAYER RESOLUTION</span>
          <strong><?= esc($product['layer_height_mm'] ? $product['layer_height_mm'] . ' MM FINE' : '0.16 MM FINE') ?></strong>
        </div>
        <div>
          <span>PHYSICAL WEIGHT</span>
          <strong><?= esc($product['weight_g'] ? (int)$product['weight_g'] . ' GRAMS' : 'STANDARD') ?></strong>
        </div>
        <div>
          <span>INTERNAL INFILL</span>
          <strong><?= esc($product['infill_percent'] ? $product['infill_percent'] . '% GYROID' : '20% GYROID') ?></strong>
        </div>
      </div>

      <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
      <!-- Add to Bag Form -->
      <form action="/cart/add" method="POST" class="k3d-buy-row">
        <?= csrf_field() ?>
        <input type="hidden" name="product_id" value="<?= esc($product['id']) ?>">
        <input type="hidden" name="variation_id" id="k3d-selected-var-id" value="<?= esc($variations[0]['id'] ?? '') ?>">

        <label for="k3d-quantity">
          QTY 
          <input id="k3d-quantity" name="quantity" type="number" min="1" value="1">
        </label>

        <button class="k3d-add-button" type="submit">
          ADD ARTIFACT TO BAG 
          <span id="k3d-cta-price">৳<?= number_format($product['price_bdt'] ?? 0, 2) ?> →</span>
        </button>
      </form>
      <?php else: ?>
      <!-- Direct WhatsApp Inquiry Form -->
      <div class="k3d-inquire-block" style="margin-top: 20px;">
        <?php 
          $waMsg = urlencode("Hello Kerf 3D, I would like to inquire about the price and custom manufacturing for: " . $product['name'] . " (Specimen " . $product['sku'] . ")");
        ?>
        <a href="https://wa.me/8801754550297?text=<?= $waMsg ?>" target="_blank" rel="noopener" class="k3d-button is-style-fill" style="width: 100%; justify-content: center; padding: 16px; font-size: 11px; text-decoration: none;">
          INQUIRE FOR PRICE ON WHATSAPP &rarr;
        </a>
        <p style="font-family: var(--k3d-mono); font-size: 10px; color: var(--k3d-meta); margin-top: 8px; text-align: center;">
          ✦ DIRECT WORKSHOP HOTLINE: 01754550297 · DISPATCHED ACROSS BANGLADESH
        </p>
      </div>
      <?php endif; ?>

      <!-- CAD Blueprint Title Block -->
      <div class="k3d-blueprint-title-block" style="border: 1px solid var(--k3d-border); padding: 12px 14px; margin-top: 24px; font-family: var(--k3d-mono); font-size: 10px; display: grid; grid-template-columns: repeat(2, 1fr); gap: 8px 12px; background: rgba(24, 24, 24, 0.02);">
        <div><span style="color:var(--k3d-meta);">SPECIMEN:</span> <strong><?= esc($product['sku']) ?></strong></div>
        <div><span style="color:var(--k3d-meta);">HARDWARE:</span> <strong>BAMBU LAB A1</strong></div>
        <div><span style="color:var(--k3d-meta);">TOLERANCE:</span> <strong>&plusmn;0.2 MM</strong></div>
        <div><span style="color:var(--k3d-meta);">STATUS:</span> <strong style="color:var(--k3d-rust);">ACTIVE CATALOG</strong></div>
      </div>

      <p class="k3d-dispatch-note">DISPATCHED FROM DHAKA · INSIDE DHAKA 24—48H (৳70) · NATIONWIDE 2—4 DAYS (৳130)</p>
    </div>
  </div>

  <section class="k3d-product-lower">
    <div>
      <span class="k3d-kicker">OBJECT NOTE</span>
      <p>Designed for the shelf, desk, or quiet corner that needs one considered form.</p>
    </div>
    <div>
      <span class="k3d-kicker">WORKSHOP CARE</span>
      <p>Keep away from sustained high heat. Dust with a soft dry cloth. Do not use as a food vessel.</p>
    </div>
    <div>
      <span class="k3d-kicker">CUSTOM SIZE?</span>
      <p><a href="/quote">Need a specific scale or custom geometry? Start a live 3D mesh quote →</a></p>
    </div>
  </section>
</div>
<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script src="/assets/js/product.js"></script>
<?= $this->endSection() ?>
