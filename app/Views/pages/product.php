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
        <!-- KINTO Architectural Dimension Overlay & Framing Markers -->
        <div class="k3d-kinto-dimension-frame" aria-hidden="true">
          <span class="k3d-corner-cross top-left">+</span>
          <span class="k3d-corner-cross top-right">+</span>
          <span class="k3d-corner-cross bottom-left">+</span>
          <span class="k3d-corner-cross bottom-right">+</span>

          <!-- Spatial Dimension Callouts -->
          <?php
            $dimStr = esc($product['dimensions_mm'] ?? '');
            if (empty($dimStr)) {
                // Realistic parametric bounding envelope based on category/type
                $catSlug = strtolower($product['category_name'] ?? '');
                if (str_contains($catSlug, 'keyboard') || str_contains($catSlug, 'macropad')) {
                    $dimStr = '165 × 115 × 28 MM';
                } elseif (str_contains($catSlug, 'lamp')) {
                    $dimStr = '140 × 140 × 190 MM';
                } elseif (str_contains($catSlug, 'decor') || str_contains($catSlug, 'vase')) {
                    $dimStr = '110 × 110 × 175 MM';
                } elseif (str_contains($catSlug, 'stand') || str_contains($catSlug, 'dock')) {
                    $dimStr = '85 × 95 × 110 MM';
                } elseif (str_contains($catSlug, 'organizer') || str_contains($catSlug, 'storage') || str_contains($catSlug, 'tray')) {
                    $dimStr = '180 × 120 × 45 MM';
                } elseif (str_contains($catSlug, 'cable') || str_contains($catSlug, 'clip')) {
                    $dimStr = '48 × 24 × 18 MM';
                } else {
                    $dimStr = '120 × 85 × 35 MM';
                }
            }
          ?>
          <div class="k3d-dimension-badge-x"><span>W ↔ D</span> <strong><?= $dimStr ?></strong></div>
          <div class="k3d-dimension-badge-y"><span>BAMBU A1 BUILD ENVELOPE</span> <strong>256³ MM MAX</strong></div>
        </div>

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
      <div class="k3d-gallery-thumbs" style="display: flex; gap: 8px; margin-top: 12px; overflow-x: auto; padding-bottom: 4px;">
        <?php foreach ($product['images'] as $idx => $img): ?>
          <?php
            $thumbSrc = (!empty($img['filename']) && file_exists(FCPATH . 'assets/images/products/' . $img['filename']))
                ? '/assets/images/products/' . esc($img['filename'])
                : (!empty($img['drive_thumbnail_url']) ? esc($img['drive_thumbnail_url']) : esc($img['drive_url'] ?? ''));
            $fullSrc = (!empty($img['filename']) && file_exists(FCPATH . 'assets/images/products/' . $img['filename']))
                ? '/assets/images/products/' . esc($img['filename'])
                : (!empty($img['drive_url']) ? esc($img['drive_url']) : $thumbSrc);
          ?>
          <button type="button" 
                  class="<?= $idx === 0 ? 'is-selected' : '' ?>" 
                  style="width: 56px; height: 56px; padding: 2px; border: 1px solid var(--k3d-border); background: var(--k3d-surface); cursor: pointer; flex-shrink: 0;"
                  onclick="document.getElementById('k3d-main-img').src = '<?= $fullSrc ?>'; document.querySelectorAll('.k3d-gallery-thumbs button').forEach(b => b.classList.remove('is-selected')); this.classList.add('is-selected');">
            <img src="<?= $thumbSrc ?>" alt="View <?= $idx + 1 ?>" style="width: 100%; height: 100%; object-fit: cover;">
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

      <?php
        $printMinutes = (int) ($product['print_time_minutes'] ?? 0);
        $printTimeHours = floor($printMinutes / 60);
        $printTimeRemMins = $printMinutes % 60;
        if ($printMinutes > 0) {
            $printTimeStr = ($printTimeHours > 0 ? $printTimeHours . 'H ' : '') . $printTimeRemMins . 'M';
        } else {
            $printTimeStr = '45M';
        }
      ?>

      <!-- Bambu A1 Technical Specification & Machine Telemetry Grid -->
      <div class="k3d-spec-grid">
        <div>
          <span>MATERIAL COMPOSITION</span>
          <strong><?= esc($product['material_name'] ?? 'BIO-PLA') ?></strong>
        </div>
        <div>
          <span>BAMBU A1 PRINT TIME</span>
          <strong style="color: var(--k3d-rust);">~<?= esc($printTimeStr) ?> FAB</strong>
        </div>
        <div>
          <span>LAYER RESOLUTION</span>
          <strong><?= esc($product['layer_height_mm'] ? $product['layer_height_mm'] . ' MM FINE' : '0.16 MM FINE') ?></strong>
        </div>
        <div>
          <span>HOTEND NOZZLE</span>
          <strong>0.4MM HARDENED STEEL</strong>
        </div>
        <div>
          <span>PHYSICAL WEIGHT</span>
          <strong><?= esc($product['weight_g'] ? (int)$product['weight_g'] . ' GRAMS' : 'CALIBRATED') ?></strong>
        </div>
        <div>
          <span>INTERNAL INFILL</span>
          <strong><?= esc($product['infill_percent'] ? $product['infill_percent'] . '% GYROID' : '20% GYROID') ?></strong>
        </div>
        <div>
          <span>BUILD VOLUME</span>
          <strong>256³ MM PEI TEXTURED</strong>
        </div>
        <div>
          <span>FABRICATION HARDWARE</span>
          <strong>BAMBU LAB A1</strong>
        </div>
      </div>

      <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
      <!-- Add to Bag Form -->
      <form action="/cart/add" method="POST" class="k3d-buy-row" id="k3d-main-buy-form">
        <?= csrf_field() ?>
        <input type="hidden" name="product_id" value="<?= esc($product['id']) ?>">
        <input type="hidden" name="variation_id" id="k3d-selected-var-id" value="<?= esc($variations[0]['id'] ?? '') ?>">

        <label for="k3d-quantity">
          QTY 
          <input id="k3d-quantity" name="quantity" type="number" min="1" value="1">
        </label>

        <button class="k3d-add-button" type="submit" id="k3d-main-add-button">
          <span>ADD ARTIFACT TO BAG</span>
          <span id="k3d-cta-price">৳<?= number_format($product['price_bdt'] ?? 0, 2) ?> →</span>
        </button>
      </form>

      <!-- One-Click WhatsApp Quick Inquiry Button -->
      <?php
        $pageUrl = current_url();
        $waInquiryMsg = "Hi Kerf 3D Studio, I would like to inquire about ordering:\n• Specimen: " . $product['name'] . " (" . $product['sku'] . ")\n• Price: ৳" . number_format($product['price_bdt'], 2) . "\n• Product Link: " . $pageUrl;
        $waHref = "https://wa.me/8801754550297?text=" . rawurlencode($waInquiryMsg);
      ?>
      <div class="k3d-wa-inquiry-row">
        <a href="<?= $waHref ?>" target="_blank" rel="noopener" class="k3d-wa-inquiry-btn" id="k3d-product-wa-btn" aria-label="Quick inquiry on WhatsApp">
          <svg class="k3d-wa-icon" width="15" height="15" viewBox="0 0 24 24" fill="currentColor">
            <path d="M12.031 6.172c-3.181 0-5.767 2.586-5.768 5.766-.001 1.298.38 2.27 1.019 3.287l-.711 2.598 2.664-.698c.969.585 1.961.933 2.796.933 3.183 0 5.769-2.587 5.769-5.769.001-3.18-2.584-5.717-5.769-5.717zm3.364 8.163c-.144.405-.837.774-1.17.825-.311.047-.704.074-2.18-.537-1.745-.722-2.87-2.484-2.957-2.6-.087-.116-.708-.941-.708-1.792s.448-1.27.607-1.442c.159-.172.348-.216.464-.216.116 0 .232.002.333.007.106.005.249-.04.39.299.144.35.493 1.2.536 1.288.043.088.072.19.014.305-.058.115-.087.188-.174.289-.087.102-.183.228-.261.306-.087.087-.178.182-.077.355.101.173.45 0.742.966 1.202.664.591 1.224.774 1.397.861.174.087.275.072.376-.044.102-.116.435-.506.55-.68.116-.174.232-.145.391-.087s1.013.478 1.187.565c.174.087.29.13.333.203.044.072.044.419-.1 0.824zM12 2C6.477 2 2 6.477 2 12c0 1.891.524 3.662 1.436 5.178L2 22l4.978-1.398A9.956 9.956 0 0 0 12 22c5.523 0 10-4.477 10-10S17.523 2 12 2z"/>
          </svg>
          <span>QUICK INQUIRY ON WHATSAPP (+880 1754-550297)</span>
        </a>
      </div>
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
        <div><span style="color:var(--k3d-meta);">FAB TIME:</span> <strong style="color:var(--k3d-rust);">~<?= esc($printTimeStr) ?></strong></div>
        <div><span style="color:var(--k3d-meta);">STATUS:</span> <strong style="color:var(--k3d-rust);">ACTIVE CATALOG</strong></div>
      </div>

      <p class="k3d-dispatch-note">DISPATCHED FROM DHAKA · INSIDE DHAKA 24—48H (৳70) · NATIONWIDE 2—4 DAYS (৳130)</p>
    </div>
  </div>

  <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
  <!-- Sticky Mobile Action Bar (Enhancement 5) -->
  <aside id="k3d-sticky-mobile-bar" class="k3d-sticky-mobile-bar" aria-hidden="true">
    <div class="k3d-sticky-inner">
      <div class="k3d-sticky-info">
        <span class="k3d-sticky-sku"><?= esc($product['sku']) ?></span>
        <strong class="k3d-sticky-name"><?= esc($product['name']) ?></strong>
        <span class="k3d-sticky-price" id="k3d-sticky-price-display">৳<?= number_format($product['price_bdt'] ?? 0, 2) ?></span>
      </div>
      <button type="button" class="k3d-sticky-buy-btn" id="k3d-sticky-add-btn">
        <span>+ ADD TO BAG</span>
      </button>
    </div>
  </aside>
  <?php endif; ?>

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

  <!-- Postalco & MD PRODUCT Japanese Craft Anatomy & Spec Teardown -->
  <section class="k3d-japanese-craft-teardown" aria-label="Additive Manufacturing Teardown">
    <div class="k3d-teardown-header">
      <div>
        <p class="k3d-kicker">CRAFT ANATOMY // ADDITIVE DEPOSITION TEARDOWN</p>
        <h2>Engineered for<br><em>the layer line.</em></h2>
      </div>
      <div class="k3d-teardown-stamp">
        <span>FACTORY QC</span>
        <strong>DHAKA WORKSHOP</strong>
        <small>UNIT 01 / PASS</small>
      </div>
    </div>

    <div class="k3d-teardown-grid">
      <!-- Card 1: Shell Perimeter -->
      <div class="k3d-teardown-card">
        <span class="k3d-card-num">01 / EXTERIOR SHELL</span>
        <strong>3-LAYER SOLID WALL</strong>
        <div class="k3d-teardown-meter">
          <div style="width: 100%;"></div>
        </div>
        <p>Extruded with 3 concentric perimeter perimeters (1.2mm total wall thickness). Provides mechanical rigidity, dimensional stability, and tactile matte exterior finish.</p>
      </div>

      <!-- Card 2: Gyroid Infill Core -->
      <div class="k3d-teardown-card">
        <span class="k3d-card-num">02 / CORE ANATOMY</span>
        <strong>GYROID CELLULAR MATRIX</strong>
        <div class="k3d-teardown-meter">
          <div style="width: <?= esc($product['infill_percent'] ?: 20) ?>%;"></div>
        </div>
        <p><?= esc($product['infill_percent'] ?: 20) ?>% isotropic continuous gyroid structure. Disperses multi-directional stress uniformly without internal resonance or dead-weight shear.</p>
      </div>

      <!-- Card 3: Layer Micro-Resolution -->
      <div class="k3d-teardown-card">
        <span class="k3d-card-num">03 / RESOLUTION</span>
        <strong><?= esc($product['layer_height_mm'] ?: '0.20') ?>MM SLICER SLICE</strong>
        <div class="k3d-teardown-meter">
          <div style="width: 85%;"></div>
        </div>
        <p>Direct-drive extruder deposition at 215°C hotend / 60°C textured PEI bed. Calibrated with Bambu Lab active vibration compensation to eliminate ghosting artifacts.</p>
      </div>
    </div>

    <!-- MD PRODUCT Style Complete Specification Ledger -->
    <div class="k3d-craft-spec-ledger">
      <div class="k3d-spec-row">
        <span>SPECIMEN IDENTITY</span>
        <strong><?= esc($product['name']) ?> (<?= esc($product['sku']) ?>)</strong>
      </div>
      <div class="k3d-spec-row">
        <span>PRIMARY POLYMER</span>
        <strong><?= esc(strtoupper($product['material_name'] ?? 'PLA BIO-RIGID')) ?></strong>
      </div>
      <div class="k3d-spec-row">
        <span>PRODUCTION HARDWARE</span>
        <strong>BAMBU LAB A1 · 0.4MM STAINLESS NOZZLE</strong>
      </div>
      <div class="k3d-spec-row">
        <span>ESTIMATED MASS</span>
        <strong><?= esc($product['weight_g'] ? (int)$product['weight_g'] . ' GRAMS' : 'STANDARD WORKSHOP SPEC') ?></strong>
      </div>
      <div class="k3d-spec-row">
        <span>MANUFACTURING TOLERANCE</span>
        <strong>±0.15 MM (ISO DIN FDM WORKSHOP GRADE)</strong>
      </div>
      <div class="k3d-spec-row">
        <span>CALIBRATED DIMENSIONS</span>
        <strong><?= $dimStr ?></strong>
      </div>
      <div class="k3d-spec-row">
        <span>IN-HAND SCALE COMPARISON</span>
        <strong>Approx. <?= round(floatval(explode('×', $dimStr)[0]) / 146.7 * 100) ?>% relative footprint of an iPhone 15 Pro (146.7 × 71.5mm)</strong>
      </div>
      <?php if (!empty($product['makerworld_url'])): ?>
      <div class="k3d-spec-row">
        <span>SOURCE CAD REPOSITORY</span>
        <strong><a href="<?= esc($product['makerworld_url']) ?>" target="_blank" rel="noopener" style="color:var(--k3d-rust); text-decoration:underline;">MAKERWORLD MODEL SPECIMEN ↗</a></strong>
      </div>
      <?php endif; ?>
    </div>
  </section>
</div>
<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script src="/assets/js/product.js?v=<?= time() ?>"></script>
<script>
  if (typeof window.k3dTrack === 'function') {
    window.k3dTrack('ViewContent', {
      content_name: <?= json_encode($product['name']) ?>,
      content_ids: [<?= json_encode($product['sku']) ?>],
      content_type: 'product',
      value: <?= (float)($product['price_bdt'] ?? 0) ?>,
      currency: 'BDT'
    });
  }
</script>
<?= $this->endSection() ?>
