<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-shop">
  <header class="k3d-shop-intro">
    <p class="k3d-kicker">ARCHIVE / CATALOG 01—<?= str_pad((string) count($products ?? []), 2, '0', STR_PAD_LEFT) ?></p>
    <h1>Objects for<br><em>daily use.</em></h1>
    <p>A considered collection of printed artifacts, developed in the Kerf 3D workshop and dispatched from Dhaka.</p>
  </header>

  <div class="k3d-shop-layout">
    <!-- Filter Sidebar -->
    <aside class="k3d-shop-filters" aria-label="Catalog filters">
      <div class="k3d-filter-head">
        <span>FILTERS</span>
        <a href="/shop" style="font-size: 9px; color: var(--k3d-meta);">CLEAR ALL</a>
      </div>

      <fieldset>
        <legend>MATERIAL</legend>
        <?php foreach (($materials ?? []) as $mat): ?>
          <label>
            <input type="checkbox" name="material[]" value="<?= esc($mat['slug']) ?>" <?= in_array($mat['slug'], (array) ($selectedMaterials ?? [])) ? 'checked' : '' ?>>
            <span><?= esc($mat['name']) ?></span>
          </label>
        <?php endforeach; ?>
      </fieldset>

      <fieldset>
        <legend>FILAMENT SHADE</legend>
        <div class="k3d-swatches">
          <?php foreach (($shades ?? []) as $shade): ?>
            <button type="button" aria-label="<?= esc($shade['name']) ?>" class="swatch" style="background-color: <?= esc($shade['hex_color'] ?? '#C86446') ?>; border: 1px solid var(--k3d-border);"></button>
          <?php endforeach; ?>
        </div>
      </fieldset>

      <div class="k3d-filter-note">
        <span>COURIER / RATE</span>
        <strong>৳70</strong>
        <p>Inside Dhaka<br>24—48 hours</p>
        <strong>৳130</strong>
        <p>Outside Dhaka<br>2—4 days</p>
      </div>
    </aside>

    <!-- Product Grid Results -->
    <main class="k3d-shop-results">
      <!-- Category Filter Tabs -->
      <div class="k3d-category-pills">
        <a href="/shop<?= !empty($currentSort) ? '?sort=' . esc($currentSort) : '' ?>" class="k3d-button sm <?= empty($selectedCategory) ? 'is-style-fill' : 'is-style-outline' ?>" style="padding: 9px 14px; font-size: 10px;">ALL SPECIMENS</a>
        <?php foreach (($categories ?? []) as $cat): ?>
          <a href="/shop?category=<?= esc($cat['slug']) ?><?= !empty($currentSort) ? '&sort=' . esc($currentSort) : '' ?>" class="k3d-button sm <?= ($selectedCategory ?? '') === $cat['slug'] ? 'is-style-fill' : 'is-style-outline' ?>" style="padding: 9px 14px; font-size: 10px;">
            <?= esc(strtoupper($cat['name'])) ?>
          </a>
        <?php endforeach; ?>
      </div>

      <div class="k3d-results-toolbar">
        <span><strong><?= count($products ?? []) ?></strong> ARTIFACTS IN ARCHIVE</span>
        <label for="k3d-sort">SORT 
          <select id="k3d-sort" onchange="const p = new URLSearchParams(window.location.search); p.set('sort', this.value); window.location.search = p.toString();">
            <option value="featured" <?= ($currentSort ?? '') === 'featured' ? 'selected' : '' ?>>Featured</option>
            <option value="price_asc" <?= ($currentSort ?? '') === 'price_asc' ? 'selected' : '' ?>>Price: Low to High</option>
            <option value="price_desc" <?= ($currentSort ?? '') === 'price_desc' ? 'selected' : '' ?>>Price: High to Low</option>
          </select>
        </label>
      </div>

      <div class="k3d-product-grid">
        <?php if (!empty($products)): ?>
          <?php foreach ($products as $product): ?>
            <article class="k3d-product-card">
              <a href="/product/<?= esc($product['slug']) ?>">
                <div class="k3d-product-image">
                  <?php if (!empty($product['primary_image']['drive_thumbnail_url'])): ?>
                    <img src="<?= esc($product['primary_image']['drive_thumbnail_url']) ?>" alt="<?= esc($product['name']) ?>" style="width: 100%; height: 100%; object-fit: cover;" loading="lazy">
                  <?php else: ?>
                    <span style="font-family: var(--k3d-mono); font-size: 10px; color: var(--k3d-meta); padding: 10px;">SPECIMEN<br><?= esc($product['sku']) ?></span>
                  <?php endif; ?>
                </div>
                <div class="k3d-product-meta">
                  <span><?= esc($product['category_name'] ?? 'CATALOG') ?> · <?= esc($product['weight_g'] ? $product['weight_g'] . 'G' : 'FDM') ?></span>
                  <strong><?= esc($product['name']) ?></strong>
                  <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
                    <b>৳<?= number_format($product['price_bdt'], 2) ?></b>
                  <?php else: ?>
                    <b style="color: var(--k3d-rust); font-size: 10px; letter-spacing: 0.05em;">PRICE ON REQUEST</b>
                  <?php endif; ?>
                </div>
              </a>
            </article>
          <?php endforeach; ?>
        <?php else: ?>
          <div style="grid-column: 1 / -1; padding: 60px 0; text-align: center; font-family: var(--k3d-mono); color: var(--k3d-meta);">
            NO ARTIFACTS CURRENTLY FOUND IN ARCHIVE.
          </div>
        <?php endif; ?>
      </div>
    </main>
  </div>
</div>
<?= $this->endSection() ?>
