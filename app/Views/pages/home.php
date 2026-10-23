<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-home">

  <!-- ── 01 / Monumental Architectural Hero (GRAU Aesthetic) ── -->
  <section class="k3d-hero">
    <div class="k3d-hero-inner k3d-container">
      
      <!-- Studio Telemetry Status Ribbon -->
      <div class="k3d-telemetry-strip">
        <span class="k3d-status-badge"><span class="k3d-dot-live"></span> BAMBU LAB A1 FLEET · ACTIVE</span>
        <span class="k3d-telemetry-datum">WORKSPACE: DHAKA HUB</span>
        <span class="k3d-telemetry-datum">TOLERANCE: &plusmn;0.2 MM</span>
        <span class="k3d-telemetry-datum">COURIER SLA: 24—48H</span>
      </div>

      <div class="k3d-hero-grid">
        <!-- Left: Monumental Editorial Typography -->
        <div class="k3d-hero-content">
          <p class="k3d-kicker">01 // STUDIO INDEX · ADDITIVE MANUFACTURING</p>
          <h1 class="k3d-hero-title">
            Objects designed for <span class="k3d-accent-text">weight &amp; presence.</span>
          </h1>
          <p class="k3d-hero-description">
            Curated tactile artifacts and on-demand FDM additive manufacturing. Printed in Dhaka on calibrated Bambu Lab A1 hardware using architectural Bio-PLA and compliant TPU 95A.
          </p>

          <div class="k3d-hero-actions">
            <a href="/shop" class="k3d-button k3d-btn-solid">
              <span>EXPLORE ARCHIVE</span>
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
              <strong>24—48H</strong>
              <span>DHAKA DISPATCH</span>
            </div>
          </div>
        </div>

        <!-- Right: Monumental Specimen Spotlight Frame (GRAU Lighting Style) -->
        <div class="k3d-hero-spotlight">
          <div class="k3d-spotlight-frame">
            <div class="k3d-frame-datum top-left">+ 00.00 [X/Y/Z]</div>
            <div class="k3d-frame-datum top-right">BAMBU A1 // SPECIMEN 01</div>
            
            <a href="/product/arc-vessel" class="k3d-spotlight-link" aria-label="View Arc Vessel Specimen">
              <img src="/assets/images/products/arc-vessel.svg" alt="Arc Vessel Architectural Specimen" class="k3d-spotlight-img">
            </a>

            <div class="k3d-frame-footer">
              <div>
                <span class="k3d-spec-sku">K3D-001 // ARC VESSEL</span>
                <strong>FLUTED ARCHITECTURAL FORM</strong>
              </div>
              <div class="k3d-spec-price">
                <span>READY-MADE</span>
                <strong>&#2547;780.00</strong>
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
      <span>&#10022; ADDITIVE MANUFACTURING STUDIO</span>
      <span>&#10022; BAMBU LAB A1 CALIBRATED HARDWARE</span>
      <span>&#10022; 0.16MM ULTRA-FINE RESOLUTION</span>
      <span>&#10022; BIO-PLA &amp; HIGH-GRADE TPU 95A</span>
      <span>&#10022; INSIDE DHAKA 24—48H (&#2547;70)</span>
      <span>&#10022; NATIONWIDE COURIER DISPATCH (&#2547;130)</span>
      <span>&#10022; BKASH &amp; NAGAD VERIFIED INTAKE</span>
      <span>&#10022; ADDITIVE MANUFACTURING STUDIO</span>
      <span>&#10022; BAMBU LAB A1 CALIBRATED HARDWARE</span>
      <span>&#10022; 0.16MM ULTRA-FINE RESOLUTION</span>
      <span>&#10022; BIO-PLA &amp; HIGH-GRADE TPU 95A</span>
      <span>&#10022; INSIDE DHAKA 24—48H (&#2547;70)</span>
      <span>&#10022; NATIONWIDE COURIER DISPATCH (&#2547;130)</span>
      <span>&#10022; BKASH &amp; NAGAD VERIFIED INTAKE</span>
    </div>
  </div>

  <!-- ── 03 / Curated Specimen Bento Grid (Editorial Artifact Exhibition) ── -->
  <section class="k3d-section k3d-bento-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">02 // CURATED SPECIMEN DOSSIER</span>
          <h2 class="k3d-section-title">Architectural objects for daily use.</h2>
        </div>
        <a href="/shop" class="k3d-text-link">VIEW COMPLETE ARCHIVE (08) &rarr;</a>
      </div>

      <div class="k3d-bento-grid">
        <!-- Bento Card 1: Featured Arc Vessel -->
        <article class="k3d-bento-card k3d-bento-feature">
          <div class="k3d-card-meta">
            <span>K3D-001 &middot; BIO-PLA</span>
            <b>140 GRAMS</b>
          </div>
          <a href="/product/arc-vessel" class="k3d-bento-visual">
            <img src="/assets/images/products/arc-vessel.svg" alt="Arc Vessel" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Arc Vessel</h3>
              <p>Mathematical fluting engineered for ambient light diffusion &amp; structural rigidity.</p>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">&#2547;780.00</span>
              <a href="/product/arc-vessel" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 2: Grid Dock -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>K3D-006 &middot; CHARCOAL</span>
            <b>85 GRAMS</b>
          </div>
          <a href="/product/grid-dock" class="k3d-bento-visual">
            <img src="/assets/images/products/grid-dock.svg" alt="Grid Dock" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Grid Dock</h3>
              <p>Weighted parametric desk organizer with phone &amp; card channel.</p>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">&#2547;520.00</span>
              <a href="/product/grid-dock" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 3: Flex Loop -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>K3D-011 &middot; TPU 95A</span>
            <b>42 GRAMS</b>
          </div>
          <a href="/product/flex-loop" class="k3d-bento-visual">
            <img src="/assets/images/products/flex-loop.svg" alt="Flex Loop" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Flex Loop</h3>
              <p>Compliant flexible EDC tether with mechanical strain relief.</p>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">&#2547;410.00</span>
              <a href="/product/flex-loop" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>

        <!-- Bento Card 4: Stack Planter -->
        <article class="k3d-bento-card">
          <div class="k3d-card-meta">
            <span>K3D-014 &middot; BONE &amp; RUST</span>
            <b>210 GRAMS</b>
          </div>
          <a href="/product/stack-planter" class="k3d-bento-visual">
            <img src="/assets/images/products/stack-planter.svg" alt="Stack Planter" loading="lazy">
          </a>
          <div class="k3d-card-footer">
            <div>
              <h3>Stack Planter</h3>
              <p>Dual-tier architectural planter with integrated self-watering reservoir.</p>
            </div>
            <div class="k3d-card-action">
              <span class="k3d-card-price">&#2547;1,120.00</span>
              <a href="/product/stack-planter" class="k3d-button k3d-btn-sm">VIEW DOSSIER &rarr;</a>
            </div>
          </div>
        </article>
      </div>
    </div>
  </section>

  <!-- ── 04 / On-Page Instant CAD Intake Dropzone ── -->
  <section class="k3d-section k3d-intake-section" id="cad-intake">
    <div class="k3d-container">
      <div class="k3d-intake-card">
        <div class="k3d-intake-grid">
          <div class="k3d-intake-info">
            <span class="k3d-kicker">03 // ON-DEMAND CAD INTAKE</span>
            <h2 class="k3d-intake-heading">Upload your mesh.<br>Instant build quote.</h2>
            <p>
              Direct FDM additive manufacturing for architects, industrial designers, and makers. Send your 3D CAD geometry for automated volume estimation, slicer verification, and instant workshop intake.
            </p>
            <div class="k3d-rate-chips">
              <span>BIO-PLA: &#2547;6.50 / G</span>
              <span>TPU 95A: &#2547;9.75 / G</span>
              <span>SETUP FEE: &#2547;50</span>
              <span>ADVANCE DEPOSIT: &#2547;100</span>
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

  <!-- ── 05 / Polymer Science Matrix (Tactile Materials) ── -->
  <section class="k3d-section k3d-materials-section">
    <div class="k3d-container">
      <div class="k3d-section-header">
        <div>
          <span class="k3d-kicker">04 // POLYMER SCIENCE</span>
          <h2 class="k3d-section-title">Tested for mechanical integrity.</h2>
        </div>
        <a href="/materials" class="k3d-text-link">FULL HARDWARE &amp; TOLERANCE GUIDE &rarr;</a>
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
            <div><span>PRINT RATE:</span> <strong>&#2547;6.50 / GRAM</strong></div>
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
            <div><span>PRINT RATE:</span> <strong>&#2547;9.75 / GRAM</strong></div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── 06 / Dhaka Workshop Dispatch & Consultation Ledger ── -->
  <section class="k3d-section k3d-dispatch-section">
    <div class="k3d-container">
      <div class="k3d-dispatch-grid">
        <div class="k3d-dispatch-box">
          <span class="k3d-kicker">LOGISTICS 01</span>
          <h4>Inside Dhaka</h4>
          <p class="k3d-dispatch-rate">&#2547;70.00 BDT</p>
          <p>Delivered within 24—48 hours via dedicated Steadfast / Pathao courier hubs directly to your doorstep.</p>
        </div>
        <div class="k3d-dispatch-box">
          <span class="k3d-kicker">LOGISTICS 02</span>
          <h4>Outside Dhaka</h4>
          <p class="k3d-dispatch-rate">&#2547;130.00 BDT</p>
          <p>Nationwide courier service (2—4 days) across all 64 districts in Bangladesh with live tracking updates.</p>
        </div>
        <div class="k3d-dispatch-box k3d-dispatch-highlight">
          <span class="k3d-kicker" style="color: var(--k3d-canvas);">DIRECT WORKSHOP HOTLINE</span>
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
