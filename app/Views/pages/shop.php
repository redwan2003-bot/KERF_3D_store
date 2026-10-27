<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-shop">
  <header class="k3d-shop-intro">
    <div style="display: flex; justify-content: space-between; align-items: flex-start; flex-wrap: wrap; gap: 16px;">
      <div>
        <p class="k3d-kicker">ARCHIVE // CATALOG SPECIMENS 001—<?= sprintf('%03d', count($products ?? [])) ?> · ATELIER</p>
        <h1>Objects for<br><em>daily use.</em></h1>
        <p>A considered collection of physical artifacts, sliced and fabricated to order on Bambu Lab A1 hardware in Dhaka, Bangladesh.</p>
      </div>
      <div class="k3d-editorial-telemetry">
        <div class="k3d-telemetry-badge">
          <span class="pulse-dot"></span>
          <span>BAMBU A1 / DHAKA UNIT 01</span>
        </div>
        <small>BUILD ENVELOPE: 256³ MM<br>NOZZLE: 0.4MM STAINLESS STEEL<br>LAYER RES: 0.08—0.28MM</small>
      </div>
    </div>

    <!-- SyuRo-Inspired Elemental Polymer Ribbon -->
    <div class="k3d-elemental-ribbon" role="navigation" aria-label="Elemental Material Filter">
      <span class="k3d-elemental-label">ELEMENTAL POLYMERS:</span>
      <div class="k3d-elemental-pills">
        <button type="button" class="k3d-elemental-pill is-active" data-element="all">
          <b>ALL</b><span>457 SPECIMENS</span>
        </button>
        <button type="button" class="k3d-elemental-pill" data-element="pla">
          <b>PLA</b><span>BIO-RIGID</span>
        </button>
        <button type="button" class="k3d-elemental-pill" data-element="tpu-95a">
          <b>TPU 95A</b><span>FLEXIBLE</span>
        </button>
        <button type="button" class="k3d-elemental-pill" data-element="petg">
          <b>PETG</b><span>COPOLYMER</span>
        </button>
        <button type="button" class="k3d-elemental-pill" data-element="asa">
          <b>ASA</b><span>WEATHERPROOF</span>
        </button>
        <button type="button" class="k3d-elemental-pill" data-element="pa-cf">
          <b>PA-CF</b><span>CARBON NYLON</span>
        </button>
      </div>
    </div>
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
        <form action="/shop" method="get" class="k3d-search-box" style="margin: 0;">
          <?php if (!empty($selectedCategory)): ?>
            <input type="hidden" name="category" value="<?= esc($selectedCategory) ?>">
          <?php endif; ?>
          <?php if (!empty($currentSort)): ?>
            <input type="hidden" name="sort" value="<?= esc($currentSort) ?>">
          <?php endif; ?>
          <svg class="k3d-search-icon" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
          </svg>
          <input type="text" name="q" id="k3d-catalog-search" value="<?= esc($searchQuery ?? '') ?>" placeholder="Type to filter specimens (AirPods, Lamp, Clip)..." autocomplete="off" spellcheck="false" aria-label="Search catalog">
          <button type="button" id="k3d-search-clear" aria-label="Clear search" title="Clear filter" style="<?= !empty($searchQuery) ? '' : 'display: none;' ?>">&times;</button>
        </form>

        <div class="k3d-toolbar-right">
          <span class="k3d-archive-count"><strong id="k3d-visible-count"><?= count($products ?? []) ?></strong> OF <strong><?= esc($totalProducts ?? count($products ?? [])) ?></strong> ARTIFACTS</span>
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
          <?php foreach ($products as $idx => $product): ?>
            <?php
              $itemIndex = sprintf('%03d', $idx + 1);
              $prodMaterial = esc(strtolower(str_contains($product['tags'] ?? '', 'tpu') ? 'tpu-95a' : (str_contains($product['tags'] ?? '', 'petg') ? 'petg' : (str_contains($product['tags'] ?? '', 'asa') ? 'asa' : (str_contains($product['tags'] ?? '', 'pa-cf') ? 'pa-cf' : 'pla')))));
              $layerRes = $product['layer_height_mm'] ? number_format((float)$product['layer_height_mm'], 2) . 'MM' : '0.20MM';
              $infillPct = $product['infill_percent'] ? (int)$product['infill_percent'] . '%' : '20%';
            ?>
            <article class="k3d-product-card"
                     data-id="<?= esc($product['id']) ?>"
                     data-name="<?= esc(strtolower($product['name'])) ?>"
                     data-sku="<?= esc(strtolower($product['sku'])) ?>"
                     data-category="<?= esc(strtolower($product['category_name'] ?? '')) ?>"
                     data-tags="<?= esc(strtolower($product['tags'] ?? '')) ?>"
                     data-material="<?= $prodMaterial ?>"
                     data-price="<?= esc($product['price_bdt']) ?>">
              <div class="k3d-product-card-wrap">
                <!-- Casa BRUTUS & PUEBCO Archival Index Header -->
                <div class="k3d-card-archival-head">
                  <span class="k3d-archival-num">№ <?= $itemIndex ?></span>
                  <span class="k3d-archival-sku"><?= esc($product['sku']) ?></span>
                </div>

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

                    <!-- Floating Japanese/PUEBCO Polymer Stamp -->
                    <div class="k3d-card-polymer-stamp">
                      <?= strtoupper($prodMaterial) ?> · <?= $infillPct ?>
                    </div>
                  </div>

                  <div class="k3d-product-meta">
                    <div class="k3d-product-meta-sub">
                      <span><?= esc(strtoupper($product['category_name'] ?? 'CATALOG')) ?></span>
                      <small>BAMBU A1 / <?= $layerRes ?></small>
                    </div>
                    <strong><?= esc($product['name']) ?></strong>
                    
                    <div class="k3d-product-price-row">
                      <?php if ((float)($product['price_bdt'] ?? 0) > 0): ?>
                        <b class="k3d-price-val">৳<?= number_format($product['price_bdt'], 2) ?></b>
                      <?php else: ?>
                        <b style="color: var(--k3d-rust); font-size: 10px; letter-spacing: 0.05em;">PRICE ON REQUEST</b>
                      <?php endif; ?>
                      <span class="k3d-card-inspect-hint">INSPECT SPECIMEN &rarr;</span>
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

      <!-- Architectural Pagination Engine -->
      <?php if (!empty($totalPages) && $totalPages > 1): ?>
        <nav class="k3d-pagination" aria-label="Catalog pages" style="margin-top: 40px; padding-top: 24px; border-top: 1px dashed var(--k3d-border); display: flex; justify-content: center; align-items: center; gap: 8px; font-family: var(--k3d-mono); font-size: 11px; flex-wrap: wrap;">
          <?php
            $queryBase = $_GET;
            unset($queryBase['page']);
            $buildPageUrl = function($p) use ($queryBase) {
                $q = $queryBase;
                $q['page'] = $p;
                return '/shop?' . http_build_query($q);
            };
          ?>
          <?php if ($currentPage > 1): ?>
            <a href="<?= esc($buildPageUrl($currentPage - 1)) ?>" class="k3d-button is-style-outline sm" style="padding: 6px 12px; font-size: 10px;">&larr; PREV</a>
          <?php endif; ?>

          <?php for ($p = max(1, $currentPage - 2); $p <= min($totalPages, $currentPage + 2); $p++): ?>
            <a href="<?= esc($buildPageUrl($p)) ?>" class="k3d-button sm <?= $p === $currentPage ? 'is-style-fill' : 'is-style-outline' ?>" style="padding: 6px 12px; min-width: 34px; text-align: center; font-size: 10px;">
              <?= $p ?>
            </a>
          <?php endfor; ?>

          <?php if ($currentPage < $totalPages): ?>
            <a href="<?= esc($buildPageUrl($currentPage + 1)) ?>" class="k3d-button is-style-outline sm" style="padding: 6px 12px; font-size: 10px;">NEXT &rarr;</a>
          <?php endif; ?>
        </nav>
      <?php endif; ?>
    </main>
  </div>
</div>
<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script src="/assets/js/shop.js?v=<?= time() ?>"></script>
<?= $this->endSection() ?>
