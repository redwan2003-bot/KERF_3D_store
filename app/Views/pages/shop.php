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
        <div class="k3d-search-box">
          <svg class="k3d-search-icon" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
          </svg>
          <input type="text" id="k3d-catalog-search" placeholder="Type to filter specimens (AirPods, Lamp, Clip)..." autocomplete="off" spellcheck="false" aria-label="Search catalog">
          <button type="button" id="k3d-search-clear" aria-label="Clear search" title="Clear filter" style="display: none;">&times;</button>
        </div>

        <div class="k3d-toolbar-right">
          <span class="k3d-archive-count"><strong id="k3d-visible-count"><?= count($products ?? []) ?></strong> OF <strong><?= count($products ?? []) ?></strong> ARTIFACTS</span>
          <label for="k3d-sort">SORT 
            <select id="k3d-sort" onchange="const p = new URLSearchParams(window.location.search); p.set('sort', this.value); window.location.search = p.toString();">
              <option value="featured" <?= ($currentSort ?? '') === 'featured' ? 'selected' : '' ?>>Featured</option>
              <option value="price_asc" <?= ($currentSort ?? '') === 'price_asc' ? 'selected' : '' ?>>Price: Low to High</option>
              <option value="price_desc" <?= ($currentSort ?? '') === 'price_desc' ? 'selected' : '' ?>>Price: High to Low</option>
            </select>
          </label>
        </div>
      </div>

      <div class="k3d-product-grid">
        <?php if (!empty($products)): ?>
          <?php foreach ($products as $product): ?>
            <article class="k3d-product-card"
                     data-id="<?= esc($product['id']) ?>"
                     data-name="<?= esc(strtolower($product['name'])) ?>"
                     data-sku="<?= esc(strtolower($product['sku'])) ?>"
                     data-category="<?= esc(strtolower($product['category_name'] ?? '')) ?>"
                     data-tags="<?= esc(strtolower($product['tags'] ?? '')) ?>"
                     data-material="<?= esc(strtolower(str_contains($product['tags'] ?? '', 'tpu') ? 'tpu-95a' : (str_contains($product['tags'] ?? '', 'petg') ? 'petg' : 'pla'))) ?>"
                     data-price="<?= esc($product['price_bdt']) ?>">
              <div class="k3d-product-card-wrap">
                <a href="/product/<?= esc($product['slug']) ?>" class="k3d-product-link">
                  <div class="k3d-product-image">
                    <?php 
                      $imgSrc = '';
                      if (!empty($product['primary_image']['filename']) && file_exists(FCPATH . 'assets/images/products/' . $product['primary_image']['filename'])) {
                          $fullFile = FCPATH . 'assets/images/products/' . $product['primary_image']['filename'];
                          $imgSrc = '/assets/images/products/' . esc($product['primary_image']['filename']) . '?v=' . filemtime($fullFile);
                      } elseif (!empty($product['primary_image']['drive_thumbnail_url'])) {
                          $imgSrc = esc($product['primary_image']['drive_thumbnail_url']);
                      }
                    ?>
                    <?php if (!empty($imgSrc)): ?>
                      <img src="<?= $imgSrc ?>" alt="<?= esc($product['name']) ?>" style="width: 100%; height: 100%; object-fit: contain;" loading="lazy">
                    <?php else: ?>
                      <span style="font-family: var(--k3d-mono); font-size: 10px; color: var(--k3d-meta); padding: 10px;">SPECIMEN<br><?= esc($product['sku']) ?></span>
                    <?php endif; ?>
                  </div>
                  <div class="k3d-product-meta">
                    <span><?= esc($product['category_name'] ?? 'CATALOG') ?> · <?= esc($product['weight_g'] ? (int)$product['weight_g'] . 'G' : 'FDM') ?></span>
                    <strong><?= esc($product['name']) ?></strong>
                    <div class="k3d-product-price-row">
                      <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
                        <b class="k3d-price-val">৳<?= number_format($product['price_bdt'], 2) ?></b>
                      <?php else: ?>
                        <b style="color: var(--k3d-rust); font-size: 10px; letter-spacing: 0.05em;">PRICE ON REQUEST</b>
                      <?php endif; ?>
                    </div>
                  </div>
                </a>

                <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
                  <button type="button" 
                          class="k3d-quick-add-btn" 
                          data-product-id="<?= esc($product['id']) ?>" 
                          data-product-name="<?= esc($product['name']) ?>"
                          data-product-price="<?= esc($product['price_bdt']) ?>"
                          title="Quick add to bag"
                          aria-label="Add <?= esc($product['name']) ?> to bag">
                    <svg class="k3d-quick-bag-icon" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path><line x1="3" y1="6" x2="21" y2="6"></line><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
                    <span class="k3d-quick-add-label">+ QUICK ADD</span>
                  </button>
                <?php endif; ?>
              </div>
            </article>
          <?php endforeach; ?>

          <!-- Empty search results container -->
          <div id="k3d-search-empty" class="k3d-search-empty-state" style="display: none;">
            <div class="k3d-empty-inner">
              <span class="k3d-empty-code">SPECIMEN // NOT_FOUND</span>
              <h3>No artifacts match "<span id="k3d-empty-query"></span>"</h3>
              <p>Try filtering by broader keywords like "Lamp", "AirPods", "Cable", "Stand", or clear your search input.</p>
              <button type="button" id="k3d-empty-clear-btn" class="k3d-button is-style-outline sm">CLEAR SEARCH QUERY</button>
            </div>
          </div>
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

<?= $this->section('scripts') ?>
<script src="/assets/js/shop.js?v=<?= time() ?>"></script>
<?= $this->endSection() ?>
