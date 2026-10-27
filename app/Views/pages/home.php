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
            <div class="k3d-frame-datum top-right">ATELIER SPECIMEN № 001 // CURATED SELECTION</div>
            
            <a href="/product/charlie-brown-airpods-pro-2nd-gen-case" class="k3d-spotlight-link" aria-label="View Charlie Brown AirPods Pro Case">
              <img src="/assets/images/products/charlie-brown-airpods-pro-2nd-gen-case.webp?v=<?= filemtime(FCPATH . 'assets/images/products/charlie-brown-airpods-pro-2nd-gen-case.webp') ?>" alt="Charlie Brown AirPods Pro 2nd Gen Case" class="k3d-spotlight-img">
            </a>

            <div class="k3d-frame-footer">
              <div>
                <span class="k3d-spec-sku">№ 001 // K3D-MW-001 · CARRY GEAR</span>
                <strong>CHARLIE BROWN AIRPODS PRO CASE</strong>
                <div class="k3d-hero-stamp-wrap">
                  <span class="k3d-hero-stamp">BIO-PLA · 100% SOLID</span>
                  <span class="k3d-hero-stamp">TOLERANCE 0.15MM</span>
                </div>
              </div>
              <div class="k3d-spec-price">
                <span>INTAKE</span>
                <strong>৳140.00</strong>
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
        <!-- Bento Card 1: Featured AirPods Case -->
        <article class="k3d-bento-card k3d-bento-feature">
          <div class="k3d-card-meta">
            <span>№ 001 // K3D-MW-001 &middot; CARRY GEAR</span>
            <b>BAMBU A1 // 0.16MM</b>
          </div>
          <a href="/product/charlie-brown-airpods-pro-2nd-gen-case" class="k3d-bento-visual">
            <img src="/assets/images/products/charlie-brown-airpods-pro-2nd-gen-case.webp?v=<?= filemtime(FCPATH . 'assets/images/products/charlie-brown-airpods-pro-2nd-gen-case.webp') ?>" alt="Charlie Brown AirPods Pro 2nd Gen Case" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Charlie Brown AirPods Pro 2nd Gen Case</h3>
              <p>Iconic graphic aesthetic 3D printed case engineered for precise snap-retention on AirPods Pro 2nd Gen.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">BIO-PLA · 100% SOLID</span>
                <span class="k3d-bento-stamp">SNAP RETENTION</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">৳140.00</span>
              <a href="/product/charlie-brown-airpods-pro-2nd-gen-case" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 2: Nebula Lamp -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>№ 008 // K3D-MW-008 &middot; LAMPS</span>
            <b>LIGHT KIT MH001</b>
          </div>
          <a href="/product/nebula-lamp" class="k3d-bento-visual">
            <img src="/assets/images/products/nebula-lamp.webp?v=<?= filemtime(FCPATH . 'assets/images/products/nebula-lamp.webp') ?>" alt="Nebula Lamp" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Nebula Lamp</h3>
              <p>Soft ambient diffusers engineered for Bambu Lab LED hardware kits.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">PETG · AMBIENT DIFFUSION</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">৳745.00</span>
              <a href="/product/nebula-lamp" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 3: Mini Paracord Pulley -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>№ 002 // K3D-MW-002 &middot; CARRY GEAR</span>
            <b>608 BEARING</b>
          </div>
          <a href="/product/mini-paracord-pulley-608-bearing---skeleton-zero" class="k3d-bento-visual">
            <img src="/assets/images/products/mini-paracord-pulley-608-bearing---skeleton-zero.webp?v=<?= filemtime(FCPATH . 'assets/images/products/mini-paracord-pulley-608-bearing---skeleton-zero.webp') ?>" alt="Mini Paracord Pulley" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Mini Paracord Pulley</h3>
              <p>Functional Skeleton Zero mechanical pulley for 608 skate bearings.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">PA-CF / PLA · LOAD BEARING</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">৳125.00</span>
              <a href="/product/mini-paracord-pulley-608-bearing---skeleton-zero" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 4: DUO Pen Holder -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>№ 006 // K3D-MW-006 &middot; ORGANIZERS</span>
            <b>MODULAR TRAY</b>
          </div>
          <a href="/product/duo-pen-holder-with-removable-tray" class="k3d-bento-visual">
            <img src="/assets/images/products/duo-pen-holder-with-removable-tray.webp?v=<?= filemtime(FCPATH . 'assets/images/products/duo-pen-holder-with-removable-tray.webp') ?>" alt="DUO Pen Holder" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>DUO Pen Holder</h3>
              <p>Dual-compartment desk caddy with removable tool tray.</p>
              <div class="k3d-stamp-row">
                <span class="k3d-bento-stamp">BIO-PLA · MODULAR FIT</span>
              </div>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">৳505.00</span>
              <a href="/product/duo-pen-holder-with-removable-tray" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- ── 04 / Karimoku Case Studies (Japandi Architectural Workstation Suites) ── -->
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
            <div><span>RATE (PER G):</span> <strong>&#2547;7.50 BDT</strong></div>
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

</div>
<?= $this->endSection() ?>
