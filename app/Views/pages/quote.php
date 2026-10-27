<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-quote-page">
  <header class="k3d-quote-header">
    <div style="display: flex; justify-content: space-between; align-items: flex-start; flex-wrap: wrap; gap: 16px;">
      <div>
        <p class="k3d-kicker">CUSTOM MANUFACTURING / ON-DEMAND · RAPID PROTOTYPING</p>
        <h1>Upload a mesh,<br><em>receive a live quote.</em></h1>
        <p class="k3d-quote-lead">Direct FDM additive manufacturing on our Bambu Lab A1 roster in Dhaka. Upload your CAD geometry for automated volume analysis, material pricing, and instant order intake.</p>
      </div>
      <div class="k3d-editorial-telemetry">
        <div class="k3d-telemetry-badge">
          <span class="pulse-dot"></span>
          <span>BAMBU A1 / DHAKA UNIT 01</span>
        </div>
        <small>BUILD ENVELOPE: 256³ MM<br>NOZZLE: 0.4MM STAINLESS STEEL<br>SLICER ENGINE: BAMBU STUDIO CALIBRATED</small>
      </div>
    </div>

    <!-- Balmuda-Inspired 4-Step Scrollytelling Fabrication Pipeline -->
    <div class="k3d-balmuda-pipeline" aria-label="Additive Manufacturing Workflow">
      <div class="k3d-pipeline-step is-active" data-step="1">
        <div class="k3d-step-marker">01</div>
        <div class="k3d-step-body">
          <strong>CAD INTAKE</strong>
          <small>Volume, surface area & bounding box mesh verification</small>
        </div>
      </div>
      <div class="k3d-pipeline-divider">→</div>
      <div class="k3d-pipeline-step" data-step="2">
        <div class="k3d-step-marker">02</div>
        <div class="k3d-step-body">
          <strong>CAM SLICING</strong>
          <small>Gyroid infill calibration & auto tree supports</small>
        </div>
      </div>
      <div class="k3d-pipeline-divider">→</div>
      <div class="k3d-pipeline-step" data-step="3">
        <div class="k3d-step-marker">03</div>
        <div class="k3d-step-body">
          <strong>HOTEND DEPOSITION</strong>
          <small>0.4mm nozzle layer extrusion on textured PEI bed</small>
        </div>
      </div>
      <div class="k3d-pipeline-divider">→</div>
      <div class="k3d-pipeline-step" data-step="4">
        <div class="k3d-step-marker">04</div>
        <div class="k3d-step-body">
          <strong>QC & DISPATCH</strong>
          <small>Tolerance check, post-process & nationwide courier</small>
        </div>
      </div>
    </div>
  </header>

  <div class="k3d-quote-layout">
    <!-- Left: 3D Viewer & Dropzone Area -->
    <div class="k3d-quote-viewport-column">
      <div class="k3d-viewer-card" aria-label="Interactive 3D model viewport">
        <div class="k3d-viewer-topbar">
          <span class="k3d-model-tag" id="k3d-model-name-display"><strong>NO MODEL LOADED</strong> / 0.0 MB</span>
          <span class="k3d-build-badge is-valid" id="k3d-fit-badge">AWAITING CAD FILE</span>
        </div>

        <div class="k3d-viewer-canvas-mock" id="k3d-viewer-container">
          <div class="k3d-grid-floor"></div>
          <div class="k3d-wireframe-object" id="k3d-wireframe-mesh"></div>
          <div class="k3d-dimension-callout k3d-dim-x" id="k3d-dim-x">X: --- MM</div>
          <div class="k3d-dimension-callout k3d-dim-y" id="k3d-dim-y">Y: --- MM</div>
          <div class="k3d-dimension-callout k3d-dim-z" id="k3d-dim-z">Z: --- MM</div>
          <span class="k3d-axis-indicator">MAX BUILD: 256³ MM</span>
        </div>

        <div class="k3d-viewer-controls">
          <div class="k3d-viewer-btn-group">
            <button type="button" class="is-active" id="k3d-btn-solid">SOLID</button>
            <button type="button" id="k3d-btn-wireframe">WIREFRAME</button>
            <button type="button" class="is-active" id="k3d-btn-cage">BED BOUNDS</button>
          </div>
          <div class="k3d-viewer-actions">
            <button type="button" id="k3d-btn-reset-view">RESET VIEW</button>
            <button type="button" class="k3d-angle-btn" data-angle="45" id="k3d-btn-orient-45" title="Auto-orient 45° tilt">45°</button>
            <button type="button" class="k3d-angle-btn" data-angle="90" id="k3d-btn-orient-90" title="Auto-orient 90° flip">90°</button>
            <button type="button" class="k3d-angle-btn" data-angle="180" id="k3d-btn-orient-180" title="Auto-orient 180° inversion">180°</button>
            <button type="button" id="k3d-btn-auto-orient" title="Snap largest planar base to bed">SNAP BASE</button>
          </div>
        </div>
      </div>

      <!-- File Dropzone -->
      <form id="k3d-upload-form" class="k3d-dropzone-panel" role="region" aria-label="Model upload dropzone">
        <div class="k3d-dropzone-inner">
          <span class="k3d-dropzone-icon">◒</span>
          <strong>DROP YOUR .STL, .OBJ, OR .3MF MESH HERE</strong>
          <p>Maximum single file size: 128 MB. Files are stored securely on Google Drive and parsed for instant BDT quoting.</p>
          <label class="k3d-button is-style-outline k3d-file-input-label">
            BROWSE CAD FILES
            <input type="file" id="k3d-cad-file-input" accept=".stl,.obj,.3mf" hidden>
          </label>
        </div>
      </form>

      <!-- Workshop Tolerances Reminder -->
      <div class="k3d-spec-notes">
        <div>
          <span>MAXIMUM VOLUME</span>
          <strong>256 × 256 × 256 MM</strong>
        </div>
        <div>
          <span>MIN WALL THICKNESS</span>
          <strong>1.2 MM RECOMMENDED</strong>
        </div>
        <div>
          <span>FITTING CLEARANCE</span>
          <strong>0.2 — 0.4 MM TOLERANCE</strong>
        </div>
      </div>
    </div>

    <!-- Right: Quoting Engine & Configuration Card -->
    <aside class="k3d-quote-sidebar">
      <div class="k3d-quote-card">
        <div class="k3d-quote-head">
          <span class="k3d-kicker">CAD SPECIFICATION</span>
          <b style="background: var(--k3d-ink); color: #fff;">CAD INTAKE SPEC</b>
        </div>

        <!-- 01 / Material Selection -->
        <fieldset class="k3d-param-group">
          <legend>01 / SELECT POLYMER</legend>
          <div class="k3d-radio-stack">
            <?php foreach (($materials ?? []) as $idx => $mat): ?>
            <label class="k3d-radio-option <?= $idx === 0 ? 'is-selected' : '' ?>">
              <input type="radio" 
                     name="quote_material" 
                     value="<?= esc($mat['slug']) ?>" 
                     data-rate="<?= esc($mat['rate_per_gram_bdt']) ?>" 
                     data-density="<?= esc($mat['effective_density']) ?>" 
                     <?= $idx === 0 ? 'checked' : '' ?>>
              <div>
                <strong><?= esc(strtoupper($mat['name'])) ?> / <?= esc(strtoupper($mat['customer_label'] ?? '')) ?></strong>
                <small>৳<?= number_format($mat['rate_per_gram_bdt'], 2) ?>/g · Density <?= esc($mat['effective_density']) ?> g/cm³</small>
              </div>
              <b class="k3d-poly-tag"><?= strtoupper(esc($mat['slug'])) ?> SPEC</b>
            </label>
            <?php endforeach; ?>
          </div>
        </fieldset>

        <!-- 02 / Infill & Density -->
        <fieldset class="k3d-param-group">
          <legend>02 / INFILL DENSITY</legend>
          <div class="k3d-infill-pills">
            <label class="k3d-infill-pill" data-infill="15"><input type="radio" name="quote_infill" value="15"><span>15% Light</span></label>
            <label class="k3d-infill-pill is-selected" data-infill="20"><input type="radio" name="quote_infill" value="20" checked><span>20% Gyroid</span></label>
            <label class="k3d-infill-pill" data-infill="50"><input type="radio" name="quote_infill" value="50"><span>50% Heavy</span></label>
            <label class="k3d-infill-pill" data-infill="100"><input type="radio" name="quote_infill" value="100"><span>100% Solid</span></label>
          </div>
        </fieldset>

        <!-- 03 / Support Structures -->
        <fieldset class="k3d-param-group">
          <legend>03 / SUPPORT STRUCTURES (BAMBU STUDIO ENGINE)</legend>
          <div class="k3d-support-pills">
            <label class="k3d-support-pill is-selected" data-support="none">
              <input type="radio" name="quote_support" value="none" data-support-pct="0" checked>
              <span>NO SUPPORTS<br><small style="color:var(--k3d-meta);">+0% Weight</small></span>
            </label>
            <label class="k3d-support-pill" data-support="tree">
              <input type="radio" name="quote_support" value="tree" data-support-pct="17.6">
              <span>TREE (AUTO)<br><small style="color:var(--k3d-rust);">+17.6% Weight</small></span>
            </label>
            <label class="k3d-support-pill" data-support="standard">
              <input type="radio" name="quote_support" value="standard" data-support-pct="28">
              <span>LINEAR DENSE<br><small style="color:var(--k3d-meta);">+28% Weight</small></span>
            </label>
          </div>
        </fieldset>

        <!-- 04 / Nozzle & Layer Profile -->
        <fieldset class="k3d-param-group">
          <legend>04 / NOZZLE &amp; LAYER RESOLUTION</legend>
          <div class="k3d-support-pills">
            <label class="k3d-support-pill" data-nozzle="0.2">
              <input type="radio" name="quote_nozzle" value="0.2" data-layer-height="0.12" data-speed-factor="1.65">
              <span>0.2MM FINE<br><small style="color:var(--k3d-rust);">0.12mm Archival</small></span>
            </label>
            <label class="k3d-support-pill is-selected" data-nozzle="0.4">
              <input type="radio" name="quote_nozzle" value="0.4" data-layer-height="0.20" data-speed-factor="1.0" checked>
              <span>0.4MM STD<br><small style="color:var(--k3d-meta);">0.20mm Balance</small></span>
            </label>
            <label class="k3d-support-pill" data-nozzle="0.6">
              <input type="radio" name="quote_nozzle" value="0.6" data-layer-height="0.28" data-speed-factor="0.75">
              <span>0.6MM RAPID<br><small style="color:var(--k3d-meta);">0.28mm Rapid</small></span>
            </label>
          </div>
        </fieldset>

        <!-- 05 / Perimeter Walls -->
        <fieldset class="k3d-param-group">
          <legend>05 / PERIMETER WALL LOOPS</legend>
          <div class="k3d-infill-pills">
            <label class="k3d-infill-pill is-selected" data-walls="2"><input type="radio" name="quote_walls" value="2" checked><span>2 Walls (Std)</span></label>
            <label class="k3d-infill-pill" data-walls="3"><input type="radio" name="quote_walls" value="3"><span>3 Walls (Stiff)</span></label>
            <label class="k3d-infill-pill" data-walls="4"><input type="radio" name="quote_walls" value="4"><span>4 Walls (Heavy)</span></label>
          </div>
        </fieldset>

        <!-- Bambu Studio Slicing Telemetry Grid -->
        <div class="k3d-metrics-grid k3d-slicer-grid">
          <div>
            <span>BOUNDING BOX</span>
            <strong id="k3d-stat-box">--- × --- × --- MM</strong>
          </div>
          <div>
            <span>SLICED LAYERS</span>
            <strong id="k3d-stat-layers">--- LAYERS @ 0.20MM</strong>
          </div>
          <div>
            <span>MODEL FILAMENT</span>
            <strong id="k3d-stat-model">--- G (--- M)</strong>
          </div>
          <div>
            <span>SUPPORT FILAMENT</span>
            <strong id="k3d-stat-support">0.0 G (0.0 M)</strong>
          </div>
          <div>
            <span>TOTAL WEIGHT / LENGTH</span>
            <strong id="k3d-stat-weight" style="color:var(--k3d-rust);">--- G (~--- M)</strong>
          </div>
          <div>
            <span>EST. PRINT TIME (BBL A1)</span>
            <strong id="k3d-stat-time">---</strong>
          </div>
        </div>

        <!-- Price Calculation Breakdown (NO PRINT SETUP FEE) -->
        <div class="k3d-quote-summary">
          <div class="k3d-summary-row">
            <span>MATERIAL RATE</span>
            <span id="k3d-calc-rate-row">৳6.50 / GRAM</span>
          </div>
          <div class="k3d-summary-row">
            <span>TOTAL FABRICATION MATERIAL (<span id="k3d-calc-grams-label">0G</span>)</span>
            <span id="k3d-calc-subtotal">৳0.00</span>
          </div>
          <div class="k3d-summary-row k3d-total-row">
            <span>CUSTOM SPECIMEN ESTIMATE</span>
            <strong id="k3d-calc-total">৳0.00</strong>
          </div>
          <div class="k3d-summary-row k3d-deposit-row">
            <span>MANDATORY ADVANCE DEPOSIT</span>
            <b class="k3d-highlight-deposit">৳100</b>
          </div>
          <div class="k3d-summary-row k3d-balance-row">
            <span>REMAINING BALANCE (AT DISPATCH)</span>
            <span id="k3d-calc-balance">৳0.00 + courier</span>
          </div>
        </div>

        <div class="k3d-quote-restriction-notice">
          <strong>DIRECT CHECKOUT RESTRICTED</strong>
          <p>
            To verify wall thickness, bed orientation stability, and machine queue allocation on our Bambu Lab A1 roster, 
            <strong>you must confirm your order via WhatsApp</strong>. Direct checkout without consultation is disabled.
          </p>
        </div>

        <!-- One-Click WhatsApp Consultation & Confirmation -->
        <a href="https://wa.me/8801754550297" 
           class="k3d-button k3d-wa-quote-cta" 
           id="k3d-wa-confirm-btn" 
           target="_blank" 
           rel="noopener"
           aria-label="Confirm custom 3D print quote via WhatsApp">
          <span style="display:inline-flex; align-items:center; gap:6px;">
            <span class="k3d-wa-icon">✦</span>
            <span>CONFIRM ON WHATSAPP</span>
          </span>
          <strong id="k3d-btn-deposit-label">+880 1754-550297 →</strong>
        </a>
      </div>
    </aside>
  </div>
</div>
<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<script src="/assets/js/libs/OrbitControls.js"></script>
<script src="/assets/js/libs/STLLoader.js"></script>
<script src="/assets/js/quote.js?v=<?= time() ?>"></script>
<?= $this->endSection() ?>
