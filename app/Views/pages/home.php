<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-home">
  <div class="k3d-ticker" role="note">✦ ADDITIVE MANUFACTURING STUDIO · DHAKA, BANGLADESH · NATIONWIDE COURIER DISPATCH ✦</div>

  <section class="k3d-hero">
    <div class="k3d-hero-copy">
      <p class="k3d-kicker">KERF 3D / STUDIO INDEX 01</p>
      <h1>Precision objects,<br><em>built layer by layer.</em></h1>
      <p>Curated artifacts and on-demand 3D printing from Dhaka. Choose a ready-made object or send us a mesh to manufacture.</p>
      <div class="k3d-hero-actions">
        <a class="k3d-button is-style-fill" href="/quote">UPLOAD A MESH →</a>
        <a class="k3d-button is-style-outline" href="/shop">EXPLORE THE ARCHIVE</a>
      </div>
    </div>

    <div class="k3d-hero-specimen" aria-label="Kerf 3D specimen panel">
      <div class="k3d-specimen-top"><span>SPECIMEN / K3D-001</span><span>PLA · 0.16 MM</span></div>
      <div class="k3d-specimen-art"><span class="k3d-contour contour-a"></span><span class="k3d-contour contour-b"></span><span class="k3d-contour contour-c"></span><span class="k3d-axis">Z</span></div>
      <div class="k3d-specimen-bottom"><span>FORM / FUNCTION / FINISH</span><span>READY FOR DISPATCH</span></div>
    </div>
  </section>

  <div class="k3d-rate-strip" aria-label="Live material rates">
    <div>
      <span class="k3d-rate-label">MATERIAL RATE / 01</span>
      <strong><?= esc($materials['pla']['name'] ?? 'PLA') ?></strong>
      <span>৳<?= number_format($materials['pla']['rate_per_gram_bdt'] ?? 6.50, 2) ?> / gram · rigid</span>
    </div>
    <div>
      <span class="k3d-rate-label">MATERIAL RATE / 02</span>
      <strong><?= esc($materials['tpu']['name'] ?? 'TPU 95A') ?></strong>
      <span>৳<?= number_format($materials['tpu']['rate_per_gram_bdt'] ?? 9.75, 2) ?> / gram · flexible</span>
    </div>
    <div>
      <span class="k3d-rate-label">SETUP FEE</span>
      <strong>৳50</strong>
      <span>per model upload</span>
    </div>
  </div>

  <section class="k3d-engines">
    <a class="k3d-engine-card" href="/shop">
      <span class="k3d-index">ENGINE 01</span>
      <h2>SELECT AN<br><em>ARTIFACT</em></h2>
      <p>Curated desk objects, vessels, docks, and functional forms with filament color variations.</p>
      <span class="k3d-card-link">ENTER CATALOG →</span>
    </a>
    <a class="k3d-engine-card k3d-engine-card--dark" href="/quote">
      <span class="k3d-index">ENGINE 02</span>
      <h2>UPLOAD A<br><em>MESH</em></h2>
      <p>Send an STL, OBJ, or 3MF file. We calculate weight, material, and a live BDT quote.</p>
      <span class="k3d-card-link">START A QUOTE →</span>
    </a>
  </section>

  <!-- Featured Artifacts Grid -->
  <?php if (!empty($featuredProducts)): ?>
  <section class="k3d-featured-archive k3d-container" style="padding: clamp(30px, 6vw, 60px) 20px;">
    <div style="border-bottom: 2px solid var(--k3d-ink); padding-bottom: 15px; margin-bottom: 30px; display: flex; justify-content: space-between; align-items: baseline; flex-wrap: wrap; gap: 10px;">
      <div>
        <p class="k3d-kicker">CURATED ARCHIVE</p>
        <h2 style="font-size: clamp(28px, 5vw, 54px); margin: 0;">Featured <em>specimens.</em></h2>
      </div>
      <a href="/shop" style="font-family: var(--k3d-mono); font-size: 11px; text-decoration: underline; font-weight: 700;">VIEW ALL ARTIFACTS →</a>
    </div>
    <div class="k3d-product-grid" style="display: grid; gap: 24px; grid-template-columns: repeat(auto-fill, minmax(min(100%, 260px), 1fr));">
      <?php foreach ($featuredProducts as $item): ?>
      <article class="k3d-product-card">
        <a href="/product/<?= esc($item['slug']) ?>">
          <div class="k3d-product-image" style="background: #e9e4da; height: 260px; position: relative; overflow: hidden; display: flex; align-items: center; justify-content: center;">
            <?php if (!empty($item['images'][0]['drive_thumbnail_url'])): ?>
              <img src="<?= esc($item['images'][0]['drive_thumbnail_url']) ?>" alt="<?= esc($item['name']) ?>" style="width: 100%; height: 100%; object-fit: cover;" loading="lazy">
            <?php else: ?>
              <span style="font-family: var(--k3d-mono); font-size: 11px; color: var(--k3d-meta);">SPECIMEN<br><?= esc($item['sku']) ?></span>
            <?php endif; ?>
          </div>
          <div class="k3d-product-meta" style="padding-top: 10px;">
            <span style="font-size: 10px; color: var(--k3d-meta);"><?= esc($item['dimensions_mm'] ?? 'FDM SPECIMEN') ?></span>
            <strong style="display: block; font-size: 16px; margin: 4px 0;"><?= esc($item['name']) ?></strong>
            <b style="color: var(--k3d-rust);">৳<?= number_format($item['price_bdt'] ?? 0, 2) ?></b>
          </div>
        </a>
      </article>
      <?php endforeach; ?>
    </div>
  </section>
  <?php endif; ?>

  <section class="k3d-process">
    <p class="k3d-kicker">WORKFLOW / 04 STAGES</p>
    <h2>From mesh to <em>object.</em></h2>
    <div class="k3d-process-grid">
      <div><b>01</b><strong>UPLOAD</strong><span>STL · OBJ · 3MF</span></div>
      <div><b>02</b><strong>SLICE</strong><span>WEIGHT + INFILL</span></div>
      <div><b>03</b><strong>PRINT</strong><span>256 MM BAMBU A1 VOLUME</span></div>
      <div><b>04</b><strong>DISPATCH</strong><span>DHAKA · NATIONWIDE</span></div>
    </div>
  </section>

  <section class="k3d-final-cta">
    <h2>Have a form<br>in mind?</h2>
    <p>Bring the geometry. We’ll handle the material, machine, and dispatch.</p>
    <div>
      <a class="k3d-button is-style-fill" href="/quote">GET YOUR BDT QUOTE →</a>
    </div>
  </section>
</div>
<?= $this->endSection() ?>
