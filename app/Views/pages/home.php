<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-home">

  <!-- ── 01 / Monumental Architectural Hero (Tajimi Coordinate Grid × GRAU Spotlight) ── -->
  <section class="k3d-hero">
    <div class="k3d-hero-inner k3d-container">
      
      <!-- Studio Telemetry Status Ribbon -->
      <div class="k3d-telemetry-strip">
        <span class="k3d-status-badge"><span class="k3d-dot-live"></span> BAMBU LAB A1 FLEET · ATELIER ACTIVE</span>
        <span class="k3d-telemetry-datum">COORD: 23.8103° N, 90.4125° E</span>
        <span class="k3d-telemetry-datum">CATALOG: 457 SPECIMENS</span>
        <span class="k3d-telemetry-datum">TOLERANCE: &plusmn;0.15 MM</span>
        <span class="k3d-telemetry-datum">COURIER SLA: 24—48H</span>
      </div>

      <div class="k3d-hero-grid">
        <!-- Left: Monumental Editorial Typography -->
        <div class="k3d-hero-content">
          <p class="k3d-kicker">01 // ATELIER ARCHIVE · ADDITIVE FABRICATION</p>
          <h1 class="k3d-hero-title">
            Objects designed for <span class="k3d-accent-text">weight &amp; presence.</span>
          </h1>
          <p class="k3d-hero-description">
            Curated tactile artifacts and on-demand FDM additive manufacturing. Printed in Dhaka on calibrated Bambu Lab A1 hardware using architectural Bio-PLA, PETG, TPU 95A, ASA, and PA-CF.
          </p>

          <div class="k3d-hero-actions">
            <a href="/shop" class="k3d-button k3d-btn-solid">
              <span>EXPLORE ARCHIVE (457)</span>
              <span>&rarr;</span>
            </a>
            <a href="/quote" class="k3d-button k3d-btn-outline">
              <span>UPLOAD CAD MESH</span>
              <span>&nearr;</span>
            </a>
          </div>

          <!-- Micro Specimen Telemetry -->
          <div class="k3d-hero-stats">
            <div>
              <strong>256&sup3; MM</strong>
              <span>BUILD VOLUME</span>
            </div>
            <div>
              <strong>0.16 MM</strong>
              <span>LAYER RESOLUTION</span>
            </div>
            <div>
              <strong>457 UNITS</strong>
              <span>ACTIVE SPECIMENS</span>
            </div>
          </div>
        </div>

        <!-- Right: Monumental Specimen Spotlight Frame (Tajimi Crosshairs & PUEBCO Stamp) -->
        <div class="k3d-hero-spotlight">
          <div class="k3d-spotlight-frame">
            <div class="k3d-frame-datum top-left">+ 23&deg;48'N 90&deg;24'E [DHAKA]</div>
            <div class="k3d-frame-datum top-right">ATELIER SPECIMEN № 421 // CURATED SPOTLIGHT</div>
            
            <a href="/product/niche-01-brutalist-lamp" class="k3d-spotlight-link" aria-label="View Niche 01 Brutalist Lamp">
              <img src="/assets/images/products/niche-01-brutalist-lamp.webp?v=<?= filemtime(FCPATH . 'assets/images/products/niche-01-brutalist-lamp.webp') ?>" alt="Niche 01 Brutalist Lamp" class="k3d-spotlight-img">
            </a>

            <div class="k3d-frame-footer">
              <div>
                <span class="k3d-spec-sku">№ 421 // K3D-MW-421 · LAMPS</span>
                <strong>NICHE 01 BRUTALIST LAMP</strong>
                <div class="k3d-hero-stamp-wrap">
                  <span class="k3d-hero-stamp">TRANSLUCENT PETG · AMBIENT GLOW</span>
                  <span class="k3d-hero-stamp">BAMBU A1 · 0.16MM FINE</span>
                </div>
              </div>
              <div class="k3d-spec-price">
                <span>INTAKE</span>
                <strong>PRICE ON REQUEST</strong>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- ── 02 / Continuous Studio Marquee (High-Speed Manufacturing Ribbon) ── -->
  <div class="k3d-marquee-bar" aria-hidden="true">
    <div class="k3d-marquee-track">
      <span>&#10022; KERF 3D // PRECISION ADDITIVE STUDIO</span>
      <span>&#10022; BAMBU LAB A1 PRECISION FLEET</span>
      <span>&#10022; 0.15MM MICRON TOLERANCE</span>
      <span>&#10022; 5 ADVANCED POLYMERS: PLA · PETG · TPU · ASA · PA-CF</span>
      <span>&#10022; 457 ARCHIVED SPECIMENS</span>
      <span>&#10022; DHAKA WORKSHOP // NATIONWIDE DISPATCH (&#2547;70 / &#2547;130)</span>
      <span>&#10022; BKASH &amp; NAGAD VERIFIED INTAKE</span>
      <span>&#10022; KERF 3D // PRECISION ADDITIVE STUDIO</span>
      <span>&#10022; BAMBU LAB A1 PRECISION FLEET</span>
      <span>&#10022; 0.15MM MICRON TOLERANCE</span>
      <span>&#10022; 5 ADVANCED POLYMERS: PLA · PETG · TPU · ASA · PA-CF</span>
      <span>&#10022; 457 ARCHIVED SPECIMENS</span>
      <span>&#10022; DHAKA WORKSHOP // NATIONWIDE DISPATCH (&#2547;70 / &#2547;130)</span>
      <span>&#10022; BKASH &amp; NAGAD VERIFIED INTAKE</span>
    </div>
  </div>

  <!-- ── 03 / Curated Specimen Bento Grid (Casa BRUTUS Archival Dossier) ── -->
  <section class="k3d-section k3d-bento-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">02 // CURATED SPECIMEN DOSSIER · DAILY OBJECTS</span>
          <h2 class="k3d-section-title">Architectural objects for daily use.</h2>
        </div>
        <a href="/shop" class="k3d-text-link">VIEW COMPLETE ARCHIVE (№ 001—457) &rarr;</a>
      </div>

      <div class="k3d-bento-grid">
        <!-- Bento Card 1: Featured Desktop Drawers -->
        <article class="k3d-bento-card k3d-bento-feature">
          <div class="k3d-card-meta">
            <span>№ 411 // K3D-MW-411 &middot; STORAGE</span>
            <b>BAMBU A1 // 0.20MM</b>
          </div>
          <a href="/product/stackable-desktop-drawers---organizer" class="k3d-bento-visual">
            <img src="/assets/images/products/stackable-desktop-drawers---organizer.webp?v=<?= filemtime(FCPATH . 'assets/images/products/stackable-desktop-drawers---organizer.webp') ?>" alt="Stackable Desktop Drawers - Organizer" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Stackable Desktop Drawers</h3>
              <p>Minimalist modular desk drawers engineered for hardware tools, screws, and daily desktop EDC discipline.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">BIO-PLA · 15% GYROID</span>
                <span class="k3d-bento-stamp">INTERLOCKING STACK</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price" style="font-size: 11px; color: var(--k3d-rust);">PRICE ON REQUEST</span>
              <a href="/product/stackable-desktop-drawers---organizer" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 2: Cheese Keycaps -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>№ 425 // K3D-MW-425 &middot; KEYBOARDS</span>
            <b>MX STEM COMPATIBLE</b>
          </div>
          <a href="/product/cheese-keycaps" class="k3d-bento-visual">
            <img src="/assets/images/products/cheese-keycaps.webp?v=<?= filemtime(FCPATH . 'assets/images/products/cheese-keycaps.webp') ?>" alt="Cheese Keycaps" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Cheese Keycaps</h3>
              <p>Tactile mechanical switch keycaps featuring clean textured porous aesthetic and snug MX tolerance.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">BIO-PLA · 100% SOLID STEM</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price" style="font-size: 11px; color: var(--k3d-rust);">PRICE ON REQUEST</span>
              <a href="/product/cheese-keycaps" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 3: Loop Compact Quick Swap Cable Winder -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>№ 443 // K3D-MW-443 &middot; CABLES</span>
            <b>QUICK SWAP CORE</b>
          </div>
          <a href="/product/loop-compact-quick-swap-cable-winder" class="k3d-bento-visual">
            <img src="/assets/images/products/loop-compact-quick-swap-cable-winder.webp?v=<?= filemtime(FCPATH . 'assets/images/products/loop-compact-quick-swap-cable-winder.webp') ?>" alt="Loop Compact Quick Swap Cable Winder" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Loop Compact Cable Winder</h3>
              <p>Precision spool winder with quick-swap retention latch for EDC charging cables up to 1.5m.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">PETG · TOUGH FLEX RETENTION</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price" style="font-size: 11px; color: var(--k3d-rust);">PRICE ON REQUEST</span>
              <a href="/product/loop-compact-quick-swap-cable-winder" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 4: Modular Shelf for Wall / Floor / Desk -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>№ 413 // K3D-MW-413 &middot; HARDWARE</span>
            <b>MODULAR ARCHITECTURE</b>
          </div>
          <a href="/product/modular-shelf-for-wall-floor-desk" class="k3d-bento-visual">
            <img src="/assets/images/products/modular-shelf-for-wall-floor-desk.webp?v=<?= filemtime(FCPATH . 'assets/images/products/modular-shelf-for-wall-floor-desk.webp') ?>" alt="Modular Shelf for Wall Floor Desk" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Modular Shelf System</h3>
              <p>Multi-configuration architectural shelf framework for wall-mount, floor riser, or desk elevation.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">PETG / PLA · LOAD BEARING</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price" style="font-size: 11px; color: var(--k3d-rust);">PRICE ON REQUEST</span>
              <a href="/product/modular-shelf-for-wall-floor-desk" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- ── 04 / Atelier Intake Ledger (Interactive New Arrivals Terminal) ── -->
  <section class="k3d-section k3d-ledger-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">03 // ATELIER INTAKE LEDGER · RECENT FABRICATION QUEUE</span>
          <h2 class="k3d-section-title">Latest curated arrivals from the Bambu A1 fleet.</h2>
        </div>
        <div class="k3d-ledger-controls">
          <span class="k3d-live-pulse-badge"><span class="k3d-pulse-dot"></span> LIVE INTAKE</span>
          <a href="/shop" class="k3d-text-link">FULL ARCHIVE (№ 001—457) &rarr;</a>
        </div>
      </div>

      <div class="k3d-ledger-terminal">
        <!-- Left: Monospace Specimen Register Table -->
        <div class="k3d-ledger-table-wrap">
          <table class="k3d-ledger-table">
            <thead>
              <tr>
                <th>№ SPECIMEN</th>
                <th>ARTIFACT DESIGNATION</th>
                <th class="k3d-hide-mobile">DISCIPLINE</th>
                <th class="k3d-hide-mobile">CALIBRATION</th>
                <th style="text-align: right;">ACTION</th>
              </tr>
            </thead>
            <tbody id="k3d-ledger-rows">
              <?php if (!empty($latestArrivals)): ?>
                <?php foreach ($latestArrivals as $idx => $arr): ?>
                  <?php 
                    $arrImg = !empty($arr['image_filename']) ? '/assets/images/products/' . esc($arr['image_filename']) : '/assets/images/favicon.svg';
                    $arrRes = !empty($arr['layer_height_mm']) ? number_format((float)$arr['layer_height_mm'], 2) . 'MM' : '0.20MM';
                    $arrInfill = !empty($arr['infill_percent']) ? $arr['infill_percent'] . '% GYROID' : '20% GYROID';
                  ?>
                  <tr class="k3d-ledger-row <?= $idx === 0 ? 'is-active' : '' ?>"
                      data-sku="<?= esc($arr['sku']) ?>"
                      data-name="<?= esc($arr['name']) ?>"
                      data-slug="<?= esc($arr['slug']) ?>"
                      data-cat="<?= esc(strtoupper($arr['category_name'] ?? 'GENERAL')) ?>"
                      data-img="<?= $arrImg ?>"
                      data-res="<?= $arrRes ?>"
                      data-infill="<?= $arrInfill ?>">
                    <td class="k3d-col-sku"><?= esc($arr['sku']) ?></td>
                    <td class="k3d-col-name">
                      <a href="/product/<?= esc($arr['slug']) ?>" class="k3d-row-link">
                        <?= esc($arr['name']) ?>
                      </a>
                    </td>
                    <td class="k3d-col-cat k3d-hide-mobile"><span class="k3d-cat-pill"><?= esc(strtoupper($arr['category_name'] ?? 'CATALOG')) ?></span></td>
                    <td class="k3d-col-telemetry k3d-hide-mobile"><?= $arrRes ?> · <?= $arrInfill ?></td>
                    <td class="k3d-col-action" style="text-align: right;">
                      <a href="/product/<?= esc($arr['slug']) ?>" class="k3d-inspect-btn">VIEW &rarr;</a>
                    </td>
                  </tr>
                <?php endforeach; ?>
              <?php endif; ?>
            </tbody>
          </table>
        </div>

        <!-- Right: Interactive Architectural Viewport Pane -->
        <aside class="k3d-ledger-preview" id="k3d-ledger-preview-pane">
          <div class="k3d-preview-hud">
            <span class="k3d-hud-datum top-left">+ 23&deg;48'N 90&deg;24'E</span>
            <span class="k3d-hud-datum top-right" id="k3d-hud-sku"><?= esc($latestArrivals[0]['sku'] ?? 'K3D-SPECIMEN') ?></span>
          </div>

          <div class="k3d-preview-canvas">
            <a href="/product/<?= esc($latestArrivals[0]['slug'] ?? '#') ?>" id="k3d-hud-link" class="k3d-preview-link">
              <img src="<?= !empty($latestArrivals[0]['image_filename']) ? '/assets/images/products/' . esc($latestArrivals[0]['image_filename']) : '/assets/images/favicon.svg' ?>" 
                   alt="Specimen preview" 
                   id="k3d-hud-img" 
                   class="k3d-preview-img">
            </a>
          </div>

          <div class="k3d-preview-footer">
            <div class="k3d-hud-info">
              <span class="k3d-hud-cat" id="k3d-hud-cat"><?= esc(strtoupper($latestArrivals[0]['category_name'] ?? 'CATALOG')) ?></span>
              <strong class="k3d-hud-title" id="k3d-hud-title"><?= esc($latestArrivals[0]['name'] ?? 'Select Specimen') ?></strong>
              <div class="k3d-hud-specs" id="k3d-hud-specs">BAMBU LAB A1 // 0.20MM FINE // 20% GYROID</div>
            </div>

            <div class="k3d-hud-actions">
              <a href="https://wa.me/8801754550297?text=<?= urlencode('Hello Kerf 3D, I would like to inquire about: ' . ($latestArrivals[0]['name'] ?? '') . ' (' . ($latestArrivals[0]['sku'] ?? '') . ')') ?>" 
                 id="k3d-hud-wa" 
                 target="_blank" 
                 rel="noopener" 
                 class="k3d-button is-style-fill">
                INQUIRE VIA WHATSAPP &rarr;
              </a>
            </div>
          </div>
        </aside>
      </div>

      <!-- ── Workspace Capsule Set (AOV & Free Delivery Threshold Booster) ── -->
      <div class="k3d-capsule-banner">
        <div class="k3d-capsule-header">
          <span class="k3d-capsule-tag">04 // CURATED WORKSPACE CAPSULE № 01 · DESK DISCIPLINE SET</span>
          <span class="k3d-capsule-delivery">✦ UNLOCKS FREE DHAKA DELIVERY (GOAL: ৳1,200)</span>
        </div>
        <div class="k3d-capsule-body">
          <div class="k3d-capsule-items-preview">
            <div class="k3d-capsule-thumb">
              <img src="/assets/images/products/stackable-desktop-drawers---organizer.webp" alt="Modular Drawers">
              <span>01. DESK DRAWERS</span>
            </div>
            <span class="k3d-capsule-plus">+</span>
            <div class="k3d-capsule-thumb">
              <img src="/assets/images/products/loop-compact-quick-swap-cable-winder.webp" alt="Loop Cable Winder">
              <span>02. LOOP CABLE WINDER</span>
            </div>
            <span class="k3d-capsule-plus">+</span>
            <div class="k3d-capsule-thumb">
              <img src="/assets/images/products/cheese-keycaps.webp" alt="Cheese Keycaps">
              <span>03. CHEESE KEYCAPS</span>
            </div>
          </div>
          <div class="k3d-capsule-action">
            <div class="k3d-capsule-price-block">
              <small>COORDINATED TRIO // MATTE BLACK OR PARCHMENT</small>
              <strong>৳1,250.00 BDT</strong>
            </div>
            <a href="https://wa.me/8801754550297?text=<?= urlencode('Hello Kerf 3D, I would like to order the Curated Workspace Capsule № 01 (Desk Drawers + Loop Cable Winder + Cheese Keycaps) for ৳1,250 with Free Dhaka Delivery.') ?>" 
               target="_blank" 
               rel="noopener" 
               class="k3d-button is-style-fill k3d-capsule-btn">
              CLAIM CAPSULE VIA WHATSAPP &rarr;
            </a>
          </div>
        </div>
      </div>

    </div>
  </section>

  <!-- ── 05 / Karimoku Case Studies (Japandi Architectural Workstation Suites) ── -->
  <section class="k3d-section k3d-cases-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">03 // WORKSPACE CASE STUDIES · SPATIAL RESEARCH</span>
          <h2 class="k3d-section-title">Harmonious desk artifacts in curated environments.</h2>
        </div>
        <span class="k3d-cases-indicator">CASE 01 &amp; 02 // ATELIER EDITIONS</span>
      </div>

      <div class="k3d-cases-grid">
        <!-- Case 01: The Mechanical Workspace -->
        <article class="k3d-case-card">
          <div class="k3d-case-badge-row">
            <span class="k3d-case-tag">CASE 01 · DHAKA ATELIER</span>
            <span class="k3d-case-serial">№ STUDY-01 // DESK CONTROLS</span>
          </div>

          <div class="k3d-case-visual-frame">
            <div class="k3d-case-crosshair top-left">+</div>
            <div class="k3d-case-crosshair top-right">+</div>
            <a href="/product/16-key-mechanical-keyboard-frame" class="k3d-case-main-link" aria-label="Explore Case 01 Keyboard Frame">
              <img src="/assets/images/products/16-key-mechanical-keyboard-frame.webp?v=<?= filemtime(FCPATH . 'assets/images/products/16-key-mechanical-keyboard-frame.webp') ?>" alt="16-Key Mechanical Keyboard Frame" loading="lazy" class="k3d-case-hero-img">
            </a>
          </div>

          <div class="k3d-case-meta">
            <h3>The Mechanical Workspace Suite</h3>
            <p>Engineered for high-focus typing sessions and cable discipline. Ultra-rigid carbon-nylon and matte Bio-PLA.</p>

            <div class="k3d-case-ensemble">
              <a href="/product/16-key-mechanical-keyboard-frame" class="k3d-ensemble-item">
                <span class="k3d-ens-sku">16-KEY KEYBOARD FRAME</span>
                <span class="k3d-ens-mat">PA-CF / PLA · ৳480</span>
              </a>
              <a href="/product/duo-pen-holder-with-removable-tray" class="k3d-ensemble-item">
                <span class="k3d-ens-sku">DUO PEN HOLDER TRAY</span>
                <span class="k3d-ens-mat">BIO-PLA · ৳505</span>
              </a>
              <a href="/product/5-grams-cable-clip" class="k3d-ensemble-item">
                <span class="k3d-ens-sku">5G CABLE CLIP</span>
                <span class="k3d-ens-mat">TPU 95A · ৳65</span>
              </a>
            </div>

            <div class="k3d-case-footer">
              <span class="k3d-case-note">3 COHESIVE SPECIMENS</span>
              <a href="/shop" class="k3d-button k3d-btn-sm">
                <span>EXPLORE ARCHIVE</span>
                <span>&rarr;</span>
              </a>
            </div>
          </div>
        </article>

        <!-- Case 02: Ambient Atelier & Chrono -->
        <article class="k3d-case-card">
          <div class="k3d-case-badge-row">
            <span class="k3d-case-tag">CASE 02 · DHAKA ATELIER</span>
            <span class="k3d-case-serial">№ STUDY-02 // AMBIENT BALANCE</span>
          </div>

          <div class="k3d-case-visual-frame">
            <div class="k3d-case-crosshair top-left">+</div>
            <div class="k3d-case-crosshair top-right">+</div>
            <a href="/product/aevum---the-perpetual-calendar" class="k3d-case-main-link" aria-label="Explore Case 02 Perpetual Calendar">
              <img src="/assets/images/products/aevum---the-perpetual-calendar.webp?v=<?= filemtime(FCPATH . 'assets/images/products/aevum---the-perpetual-calendar.webp') ?>" alt="AEVUM Perpetual Calendar" loading="lazy" class="k3d-case-hero-img">
            </a>
          </div>

          <div class="k3d-case-meta">
            <h3>Ambient Atelier &amp; Chrono Architecture</h3>
            <p>Sculptural lighting diffusers paired with kinetic timekeeping and smooth bearing rotation for contemplative desk spaces.</p>

            <div class="k3d-case-ensemble">
              <a href="/product/aevum---the-perpetual-calendar" class="k3d-ensemble-item">
                <span class="k3d-ens-sku">AEVUM PERPETUAL CALENDAR</span>
                <span class="k3d-ens-mat">BIO-PLA · ৳340</span>
              </a>
              <a href="/product/nebula-lamp" class="k3d-ensemble-item">
                <span class="k3d-ens-sku">NEBULA DIFFUSER LAMP</span>
                <span class="k3d-ens-mat">PETG · ৳745</span>
              </a>
              <a href="/product/360-rotating-desk-organizer" class="k3d-ensemble-item">
                <span class="k3d-ens-sku">360 ROTATING CADDY</span>
                <span class="k3d-ens-mat">BIO-PLA · ৳495</span>
              </a>
            </div>

            <div class="k3d-case-footer">
              <span class="k3d-case-note">3 COHESIVE SPECIMENS</span>
              <a href="/shop" class="k3d-button k3d-btn-sm">
                <span>EXPLORE ARCHIVE</span>
                <span>&rarr;</span>
              </a>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- ── 05 / On-Page Instant CAD Intake Dropzone (Balmuda Pipeline Precision) ── -->
  <section class="k3d-section k3d-intake-section" id="cad-intake">
    <div class="k3d-container">
      <div class="k3d-intake-card">
        <div class="k3d-intake-grid">
          <div class="k3d-intake-info">
            <span class="k3d-kicker">04 // ON-DEMAND CAD INTAKE · RAPID PROTOTYPING</span>
            <h2 class="k3d-intake-heading">Upload your mesh.<br>Instant build quote.</h2>
            <p>
              Direct FDM additive manufacturing for architects, industrial designers, and makers. Send your 3D CAD geometry for automated volume estimation, slicer verification, and instant workshop intake.
            </p>
            <div class="k3d-rate-chips">
              <span>5 POLYMERS: PLA · PETG · TPU · ASA · PA-CF</span>
              <span>LAYER RESOLUTION: 0.16—0.20 MM</span>
              <span>WORKSHOP FIT: 256³ MM CUBE</span>
              <span>BALMUDA 4-STEP CAM SLICING</span>
            </div>
          </div>

          <div class="k3d-intake-dropzone">
            <div class="k3d-dropzone-box" onclick="window.location.href='/quote'">
              <div class="k3d-dropzone-icon">◒</div>
              <strong>LAUNCH 3D MESH QUOTER</strong>
              <p>Drag &amp; drop .STL, .OBJ, or .3MF (Up to 128 MB)</p>
              <span class="k3d-button k3d-btn-solid" style="margin-top: 18px; width: 100%;">
                <span>OPEN INTERACTIVE 3D VIEWER</span>
                <span>&rarr;</span>
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── 05 / Polymer Science Matrix (SyuRo Elemental Materials) ── -->
  <section class="k3d-section k3d-materials-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">05 // POLYMER SCIENCE · MATERIAL MATRIX</span>
          <h2 class="k3d-section-title">Tested for mechanical integrity.</h2>
        </div>
        <a href="/materials" class="k3d-text-link">FULL HARDWARE &amp; TOLERANCE GUIDE (5 POLYMERS) &rarr;</a>
      </div>

      <div class="k3d-material-grid">
        <div class="k3d-material-card">
          <div class="k3d-mat-head">
            <span class="k3d-mat-tag">RIGID &amp; ARCHITECTURAL</span>
            <h3>Bio-PLA (Polylactic Acid)</h3>
          </div>
          <p>Sourced from renewable organic polymers. High tensile rigidity and extreme dimensional precision. Ideal for geometric vessels, desk architecture, and display artifacts.</p>
          <div class="k3d-mat-specs">
            <div><span>SHORE HARDNESS:</span> <strong>85D RIGID</strong></div>
            <div><span>HEAT DEFLECTION:</span> <strong>55&deg;C</strong></div>
            <div><span>LAYER RESOLUTION:</span> <strong>0.16—0.20 MM</strong></div>
            <div><span>RATE (PER G):</span> <strong>&#2547;6.50 BDT</strong></div>
          </div>
        </div>

        <div class="k3d-material-card">
          <div class="k3d-mat-head">
            <span class="k3d-mat-tag" style="background: var(--k3d-ink); color: #fff;">COMPLIANT &amp; IMPACT PROOF</span>
            <h3>TPU 95A (Polyurethane)</h3>
          </div>
          <p>Industrial-grade semi-flexible elastomer with indestructible interlayer bonding. Chemical, abrasion, and tear resistant. Ideal for shock bumpers, gaskets, and wearable loops.</p>
          <div class="k3d-mat-specs">
            <div><span>SHORE HARDNESS:</span> <strong>95A ELASTIC</strong></div>
            <div><span>MAX ELONGATION:</span> <strong>450%</strong></div>
            <div><span>LAYER RESOLUTION:</span> <strong>0.20 MM</strong></div>
            <div><span>RATE (PER G):</span> <strong>&#2547;9.75 BDT</strong></div>
          </div>
        </div>

        <div class="k3d-material-card">
          <div class="k3d-mat-head">
            <span class="k3d-mat-tag">THERMAL &amp; IMPACT RESISTANT</span>
            <h3>PETG (Polyethylene Terephthalate)</h3>
          </div>
          <p>High impact resistance and exceptional thermal stability. Excellent moisture resistance and chemical tolerance for functional tooling and mechanical brackets.</p>
          <div class="k3d-mat-specs">
            <div><span>SHORE HARDNESS:</span> <strong>80D RIGID</strong></div>
            <div><span>HEAT DEFLECTION:</span> <strong>75&deg;C</strong></div>
            <div><span>LAYER RESOLUTION:</span> <strong>0.16—0.20 MM</strong></div>
            <div><span>RATE (PER G):</span> <strong>&#2547;8.75 BDT</strong></div>
          </div>
        </div>

        <div class="k3d-material-card">
          <div class="k3d-mat-head">
            <span class="k3d-mat-tag" style="background: var(--k3d-rust); color: #fff;">CARBON-REINFORCED COMPOSITE</span>
            <h3>PA-CF (Carbon Fiber Nylon)</h3>
          </div>
          <p>High-modulus carbon fiber micro-strands embedded in polyamide matrix. Unrivaled tensile strength, matte tactical finish, and heat deflection up to 150°C.</p>
          <div class="k3d-mat-specs">
            <div><span>TENSILE MODULUS:</span> <strong>7,200 MPa</strong></div>
            <div><span>HEAT DEFLECTION:</span> <strong>150&deg;C</strong></div>
            <div><span>LAYER RESOLUTION:</span> <strong>0.16—0.20 MM</strong></div>
            <div><span>RATE (PER G):</span> <strong>&#2547;14.50 BDT</strong></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── 06 / Internal Infill & Architecture (HASAMI PORCELAIN Modular Science) ── -->
  <section class="k3d-section k3d-infill-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">06 // INTERNAL INFILL ARCHITECTURE · STRUCTURAL SCIENCE</span>
          <h2 class="k3d-section-title">The unseen mathematical matrix inside every wall.</h2>
        </div>
        <a href="/materials" class="k3d-text-link">TOLERANCE &amp; HARDWARE GUIDE &rarr;</a>
      </div>

      <div class="k3d-infill-grid">
        <!-- Infill 1: Gyroid -->
        <div class="k3d-infill-card">
          <div class="k3d-infill-header">
            <span class="k3d-infill-chip">3D ISOTROPIC MATRIX</span>
            <h3>Gyroid Infill (3D Minimal Surface)</h3>
          </div>
          <div class="k3d-infill-diagram">
            <svg viewBox="0 0 120 60" class="k3d-infill-svg" aria-hidden="true">
              <path d="M 5 15 Q 20 2 35 15 T 65 15 T 95 15 T 115 15" fill="none" stroke="currentColor" stroke-width="2.5" />
              <path d="M 5 30 Q 20 45 35 30 T 65 30 T 95 30 T 115 30" fill="none" stroke="currentColor" stroke-width="2.5" />
              <path d="M 5 45 Q 20 32 35 45 T 65 45 T 95 45 T 115 45" fill="none" stroke="currentColor" stroke-width="2.5" />
            </svg>
          </div>
          <p>Continuous sinusoidal 3D minimal surface. Distributes mechanical stress equally in all directions with zero shear failure planes.</p>
          <div class="k3d-infill-metrics">
            <div><span>ISOTROPIC STRENGTH</span><strong>100% UNIFORM</strong></div>
            <div><span>OPTIMAL DENSITY</span><strong>15% — 25%</strong></div>
            <div><span>CALIBRATED FOR</span><strong>GRIPS &amp; EDC GEAR</strong></div>
          </div>
        </div>

        <!-- Infill 2: Honeycomb -->
        <div class="k3d-infill-card">
          <div class="k3d-infill-header">
            <span class="k3d-infill-chip">CELLULAR COMPRESSION</span>
            <h3>Honeycomb Infill (Hexagonal Matrix)</h3>
          </div>
          <div class="k3d-infill-diagram">
            <svg viewBox="0 0 120 60" class="k3d-infill-svg" aria-hidden="true">
              <polygon points="20,12 35,5 50,12 50,26 35,33 20,26" fill="none" stroke="currentColor" stroke-width="2" />
              <polygon points="50,12 65,5 80,12 80,26 65,33 50,26" fill="none" stroke="currentColor" stroke-width="2" />
              <polygon points="35,33 50,26 65,33 65,47 50,54 35,47" fill="none" stroke="currentColor" stroke-width="2" />
              <polygon points="65,33 80,26 95,33 95,47 80,54 65,47" fill="none" stroke="currentColor" stroke-width="2" />
            </svg>
          </div>
          <p>Nature’s most weight-efficient structural truss. Provides maximum vertical crush rigidity for heavy loads and structural mounting brackets.</p>
          <div class="k3d-infill-metrics">
            <div><span>CRUSH RESISTANCE</span><strong>MAXIMUM RIGID</strong></div>
            <div><span>OPTIMAL DENSITY</span><strong>20% — 35%</strong></div>
            <div><span>CALIBRATED FOR</span><strong>SHELVES &amp; STANDS</strong></div>
          </div>
        </div>

        <!-- Infill 3: Solid Snap-Fit Perimeters -->
        <div class="k3d-infill-card">
          <div class="k3d-infill-header">
            <span class="k3d-infill-chip" style="background:var(--k3d-rust); color:#fff;">100% SOLID REINFORCED</span>
            <h3>Continuous Shells (High-Density Walls)</h3>
          </div>
          <div class="k3d-infill-diagram">
            <svg viewBox="0 0 120 60" class="k3d-infill-svg" aria-hidden="true">
              <rect x="10" y="8" width="100" height="44" fill="none" stroke="currentColor" stroke-width="2.5" />
              <rect x="18" y="15" width="84" height="30" fill="none" stroke="currentColor" stroke-width="1.5" stroke-dasharray="3,2" />
              <line x1="28" y1="22" x2="92" y2="22" stroke="currentColor" stroke-width="1.5" />
              <line x1="28" y1="30" x2="92" y2="30" stroke="currentColor" stroke-width="1.5" />
              <line x1="28" y1="38" x2="92" y2="38" stroke="currentColor" stroke-width="1.5" />
            </svg>
          </div>
          <p>Quadruple concentric perimeter walls fused with 100% rectilinear solid fill. Impermeable to fluid leaks and threaded fastener torque.</p>
          <div class="k3d-infill-metrics">
            <div><span>WATERTIGHTNESS</span><strong>100% SEALED</strong></div>
            <div><span>WALL PERIMETERS</span><strong>4 — 6 SHELLS</strong></div>
            <div><span>CALIBRATED FOR</span><strong>VESSELS &amp; FASTENERS</strong></div>
          </div>
        </div>
      </div>

      <!-- Live Workshop Tolerance Guarantee Strip -->
      <div class="k3d-tolerance-callout">
        <div class="k3d-tol-badge">+ 0.15 MM TOLERANCE FIT</div>
        <div class="k3d-tol-desc">
          <strong>HASAMI MODULAR CALIBRATION:</strong> Every KERF 3D specimen is precision-sliced on calibrated Bambu Lab A1 hardware, ensuring interlocking containers, slide-out trays, and snap-fit cases mate cleanly with zero secondary tooling or sanding.
        </div>
      </div>
    </div>
  </section>

  <!-- ── 07 / Dhaka Workshop Dispatch & Consultation Ledger (D&DEPARTMENT Bins) ── -->
  <section class="k3d-section k3d-dispatch-section">
    <div class="k3d-container">
      <div class="k3d-dispatch-grid">
        <div class="k3d-dispatch-box">
          <span class="k3d-kicker">LOGISTICS 01 // CITY COURIER</span>
          <h4>Inside Dhaka</h4>
          <p class="k3d-dispatch-rate">&#2547;70.00 BDT</p>
          <p>Delivered within 24—48 hours via dedicated Steadfast / Pathao courier hubs directly to your doorstep.</p>
        </div>
        <div class="k3d-dispatch-box">
          <span class="k3d-kicker">LOGISTICS 02 // NATIONWIDE</span>
          <h4>Outside Dhaka</h4>
          <p class="k3d-dispatch-rate">&#2547;130.00 BDT</p>
          <p>Nationwide courier service (2—4 days) across all 64 districts in Bangladesh with live tracking updates.</p>
        </div>
        <div class="k3d-dispatch-box k3d-dispatch-highlight">
          <span class="k3d-kicker" style="color: var(--k3d-canvas);">DIRECT WORKSHOP HOTLINE // STUDIO DESK</span>
          <h4 style="color: #fff;">Need Custom Slicing?</h4>
          <p style="color: rgba(255,255,255,0.8);">Talk directly with our Dhaka manufacturing operator for scale recommendations or rush orders.</p>
          <a href="https://wa.me/8801754550297" target="_blank" rel="noopener" class="k3d-button" style="background:#fff; color:var(--k3d-ink); margin-top:14px; width:100%; justify-content:space-between;">
            <span>WHATSAPP HOTLINE</span>
            <span>+880 1754-550297 &nearr;</span>
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- ── 08 / Architectural FAQ & Knowledge Base (High Citability & GEO Answer Blocks) ── -->
  <section class="k3d-section k3d-faq-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <p class="k3d-kicker">08 // WORKSHOP SPECIFICATIONS &amp; FREQUENT INQUIRIES</p>
          <h2 class="k3d-section-title">Knowledge base &amp; fabrication standards.</h2>
        </div>
        <p style="color: var(--k3d-meta); font-family: var(--k3d-mono); font-size: 10px; letter-spacing: 0.08em;">VERIFIED OPERATIONAL TELEMETRY FOR CLIENTS &amp; GENERATIVE AI CITATIONS</p>
      </div>

      <div class="k3d-faq-grid">
        <!-- FAQ Card 1: Atelier Profile & Location -->
        <article class="k3d-faq-card">
          <div>
            <div class="k3d-faq-header">
              <span class="k3d-faq-category">01 // ATELIER PROFILE &amp; DISPATCH LOCATION</span>
              <span class="k3d-faq-serial">№ SPEC-01 // DHAKA HUB</span>
            </div>
            <h3>What is Kerf 3D Studio and where is it located in Bangladesh?</h3>
            <p>
              Kerf 3D Studio is an architectural additive manufacturing atelier and on-demand 3D printing workshop headquartered in <strong>Dhaka, Bangladesh</strong> (Geographic Coordinates: 23.8103&deg; N, 90.4125&deg; E). The studio operates an industrial fleet of direct-drive Bambu Lab A1 3D printers, providing precision FDM fabrication with a build volume of 256&times;256&times;256 mm. Mechanical tolerances are calibrated to <strong>&plusmn;0.15 mm</strong>, ensuring interlocking containers, slide-out desk organizers, and snap-fit cases mate seamlessly without secondary post-processing.
            </p>
            <div class="k3d-faq-specs-grid">
              <div><span>WORKSHOP BASE</span><strong>DHAKA (23.81°N, 90.41°E)</strong></div>
              <div><span>CALIBRATED TOLERANCE</span><strong>&plusmn;0.15 MM MECHANICAL</strong></div>
              <div><span>DHAKA COURIER</span><strong>24—48H (৳70 / FREE &gt; ৳1,200)</strong></div>
              <div><span>NATIONWIDE COURIER</span><strong>2—4 DAYS (৳130 FLAT)</strong></div>
            </div>
          </div>
          <div class="k3d-faq-footer">
            <span class="k3d-faq-status-pill">STEADFAST / PATHAO DISPATCH</span>
            <a href="/shop" class="k3d-faq-link">EXPLORE 457 SPECIMENS &rarr;</a>
          </div>
        </article>

        <!-- FAQ Card 2: Hardware & Polymers -->
        <article class="k3d-faq-card">
          <div>
            <div class="k3d-faq-header">
              <span class="k3d-faq-category">02 // BAMBU LAB A1 HARDWARE &amp; MATERIALS</span>
              <span class="k3d-faq-serial">№ SPEC-02 // THERMOPLASTICS</span>
            </div>
            <h3>How does Bambu Lab A1 printing operate and what polymers are stocked?</h3>
            <p>
              Fabrication utilizes high-speed fused deposition modeling with active vibration compensation, automatic dynamic flow rate calibration, and direct-drive all-metal hotends reaching up to <strong>300&deg;C</strong>. Kerf 3D Studio stocks five engineering-grade thermoplastics: <strong>Bio-PLA</strong> (৳6.50/g) for rigid desktop forms, chemical-resistant <strong>PETG</strong> (৳8.75/g) for fluid vessels and lamps, flexible <strong>TPU 95A</strong> (৳9.75/g) with 450% elongation for shock gaskets, heat-resistant <strong>ASA</strong>, and <strong>PA-CF</strong> carbon-fiber nylon with thermal deflection ratings up to 150&deg;C.
            </p>
            <div class="k3d-faq-specs-grid">
              <div><span>ACTIVE FLEET</span><strong>BAMBU LAB A1 DIRECT-DRIVE</strong></div>
              <div><span>MAX HOTEND / BED</span><strong>300°C NOZZLE / 100°C BED</strong></div>
              <div><span>NOZZLE DIAMETERS</span><strong>0.2MM FINE TO 0.8MM COARSE</strong></div>
              <div><span>THERMOPLASTICS</span><strong>PLA · PETG · TPU · ASA · PA-CF</strong></div>
            </div>
          </div>
          <div class="k3d-faq-footer">
            <span class="k3d-faq-status-pill">100% VIRGIN POLYMERS</span>
            <a href="/materials" class="k3d-faq-link">VIEW MATERIAL DOSSIER &rarr;</a>
          </div>
        </article>

        <!-- FAQ Card 3: Infill Matrices & Mechanical Strength -->
        <article class="k3d-faq-card">
          <div>
            <div class="k3d-faq-header">
              <span class="k3d-faq-category">03 // INFILL MATRICES &amp; STRUCTURAL DYNAMICS</span>
              <span class="k3d-faq-serial">№ SPEC-03 // ISOTROPIC INFILL</span>
            </div>
            <h3>Which infill geometry is recommended for functional load-bearing parts?</h3>
            <p>
              Infill architecture is mathematically selected to match structural loading. We recommend <strong>3D Gyroid infill (15%—25%)</strong> for handheld items, EDC gear, and phone stands because its continuous sinusoidal minimal surface provides 100% isotropic tensile and shear resistance in all three axes. For vertical compression loads (shelf brackets, monitor risers), <strong>hexagonal honeycomb (20%—35%)</strong> is optimal. Threaded joints and watertight vessels utilize <strong>100% solid concentric shell perimeters</strong> (4—6 walls) with zero void cavities.
            </p>
            <div class="k3d-faq-specs-grid">
              <div><span>GYROID INFILL</span><strong>3D ISOTROPIC RESISTANCE</strong></div>
              <div><span>HONEYCOMB MATRIX</span><strong>VERTICAL CRUSH RIGIDITY</strong></div>
              <div><span>SOLID CONCENTRIC</span><strong>100% WATERTIGHT SEAL</strong></div>
              <div><span>WALL PERIMETERS</span><strong>4 TO 6 CONTINUOUS SHELLS</strong></div>
            </div>
          </div>
          <div class="k3d-faq-footer">
            <span class="k3d-faq-status-pill">FINITE ELEMENT OPTIMIZED</span>
            <a href="/quote" class="k3d-faq-link">TEST INFILL SLICER &rarr;</a>
          </div>
        </article>

        <!-- FAQ Card 4: Slicing Pricing & Tracking -->
        <article class="k3d-faq-card">
          <div>
            <div class="k3d-faq-header">
              <span class="k3d-faq-category">04 // QUOTE CALCULATION &amp; STAGE TRACKING</span>
              <span class="k3d-faq-serial">№ SPEC-04 // FINANCIAL TELEMETRY</span>
            </div>
            <h3>How is custom 3D printing cost calculated and how are orders tracked?</h3>
            <p>
              Custom 3D print pricing is computed in real time via our browser-based volumetric slicing engine at <strong>/quote</strong>. Costs derive from calibrated material mass (starting at <strong>৳6.50/g for Bio-PLA</strong> and <strong>৳8.75/g for PETG</strong>), machine runtime, and a ৳50 machine calibration fee. Custom uploads require a mandatory <strong>৳100 advance deposit</strong> via bKash/Nagad. Every order receives a unique Workshop Ticket ID (e.g. <code>K3D-261029-801F</code>) with 4-stage tracking from file intake to dispatch.
            </p>
            <div class="k3d-faq-specs-grid">
              <div><span>BASELINE PLA RATE</span><strong>৳6.50 BDT / GRAM</strong></div>
              <div><span>BASELINE PETG RATE</span><strong>৳8.75 BDT / GRAM</strong></div>
              <div><span>SETUP CALIBRATION FEE</span><strong>৳50 FLAT PER CUSTOM CAD</strong></div>
              <div><span>MANDATORY DEPOSIT</span><strong>৳100 ADVANCE VIA BKASH</strong></div>
            </div>
          </div>
          <div class="k3d-faq-footer">
            <span class="k3d-faq-status-pill">BKASH / NAGAD / ROCKET / COD</span>
            <a href="/quote" class="k3d-faq-link">LAUNCH 3D SLICER &rarr;</a>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- Schema.org FAQPage Structured Data -->
  <script type="application/ld+json">
  {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [
      {
        "@type": "Question",
        "name": "What is Kerf 3D Studio and where is it located in Bangladesh?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Kerf 3D Studio is an architectural additive manufacturing atelier and on-demand 3D printing workshop based in Dhaka, Bangladesh (Coordinates: 23.8103° N, 90.4125° E). The studio operates an industrial fleet of direct-drive Bambu Lab A1 3D printers with a build volume of 256×256×256 mm and ±0.15 mm mechanical tolerances. Deliveries take 24-48 hours inside Dhaka (free over ৳1,200) and 2-4 days nationwide."
        }
      },
      {
        "@type": "Question",
        "name": "How does Bambu Lab A1 3D printing in Dhaka operate and what materials are stocked?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Additive manufacturing on Bambu Lab A1 hardware utilizes active vibration compensation, automatic flow dynamics, and direct-drive extrusion up to 300°C. Kerf 3D Studio stocks Bio-PLA (৳6.50/g), chemical-resistant PETG (৳8.75/g), TPU 95A flexible elastomer (৳9.75/g), ASA, and carbon-fiber-reinforced PA-CF nylon with interchangeable nozzles from 0.2mm to 0.8mm."
        }
      },
      {
        "@type": "Question",
        "name": "Which infill geometry is recommended for functional load-bearing parts?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "For functional components subjected to multi-axis stress, 3D Gyroid infill (15%-25%) is recommended for its isotropic tensile and shear resistance. For vertical crush rigidity such as shelf brackets, hexagonal honeycomb (20%-35%) is optimal. Threaded joints and watertight containers utilize 100% solid concentric shell perimeters."
        }
      },
      {
        "@type": "Question",
        "name": "How is custom 3D printing cost calculated and how are orders tracked?",
        "acceptedAnswer": {
          "@type": "Answer",
          "text": "Custom 3D printing pricing is calculated dynamically through an automated online volumetric slicer at /quote starting at ৳6.50 BDT/g for PLA and ৳8.75 BDT/g for PETG, plus a ৳50 setup fee. Custom orders require a ৳100 advance deposit via bKash. Every order receives a unique Workshop Ticket ID with live tracking across slicing, printing, and courier dispatch."
        }
      }
    ]
  }
  </script>

  <!-- Interactive Intake Ledger JavaScript Engine -->
  <script>
  document.addEventListener('DOMContentLoaded', function() {
    const rows = document.querySelectorAll('.k3d-ledger-row');
    const hudSku = document.getElementById('k3d-hud-sku');
    const hudTitle = document.getElementById('k3d-hud-title');
    const hudCat = document.getElementById('k3d-hud-cat');
    const hudSpecs = document.getElementById('k3d-hud-specs');
    const hudImg = document.getElementById('k3d-hud-img');
    const hudLink = document.getElementById('k3d-hud-link');
    const hudWa = document.getElementById('k3d-hud-wa');

    if (!rows.length || !hudImg) return;

    function activateRow(row) {
      rows.forEach(r => r.classList.remove('is-active'));
      row.classList.add('is-active');

      const sku = row.dataset.sku || '';
      const name = row.dataset.name || '';
      const slug = row.dataset.slug || '';
      const cat = row.dataset.cat || '';
      const img = row.dataset.img || '';
      const res = row.dataset.res || '0.20MM';
      const infill = row.dataset.infill || '20% GYROID';

      if (hudSku) hudSku.textContent = sku;
      if (hudTitle) hudTitle.textContent = name;
      if (hudCat) hudCat.textContent = cat;
      if (hudSpecs) hudSpecs.textContent = 'BAMBU LAB A1 // ' + res + ' FINE // ' + infill;
      if (hudImg && img) {
        hudImg.src = img;
        hudImg.alt = name;
      }
      if (hudLink && slug) {
        hudLink.href = '/product/' + slug;
      }
      if (hudWa) {
        const msg = encodeURIComponent('Hello Kerf 3D, I would like to inquire about: ' + name + ' (' + sku + ')');
        hudWa.href = 'https://wa.me/8801754550297?text=' + msg;
      }
    }

    rows.forEach(row => {
      row.addEventListener('mouseenter', function() {
        activateRow(this);
      });
      row.addEventListener('click', function(e) {
        if (!e.target.closest('a')) {
          activateRow(this);
        }
      });
    });
  });
  </script>

</div>
<?= $this->endSection() ?>
