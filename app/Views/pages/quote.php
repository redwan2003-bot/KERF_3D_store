<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-quote-page">
  <header class="k3d-quote-header">
    <p class="k3d-kicker">CUSTOM MANUFACTURING / ON-DEMAND</p>
    <h1>Upload a mesh,<br><em>receive a live quote.</em></h1>
    <p class="k3d-quote-lead">Direct FDM additive manufacturing on our Bambu Lab A1 roster in Dhaka. Upload your CAD geometry for automated volume analysis, material pricing, and instant order intake.</p>
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
            <button type="button" id="k3d-btn-auto-orient">AUTO-ORIENT</button>
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
            <label class="k3d-infill-pill"><input type="radio" name="quote_infill" value="15"><span>15% Light</span></label>
            <label class="k3d-infill-pill is-selected"><input type="radio" name="quote_infill" value="20" checked><span>20% Gyroid</span></label>
            <label class="k3d-infill-pill"><input type="radio" name="quote_infill" value="50"><span>50% Heavy</span></label>
            <label class="k3d-infill-pill"><input type="radio" name="quote_infill" value="100"><span>100% Solid</span></label>
          </div>
        </fieldset>

        <!-- 03 / Support Structures -->
        <fieldset class="k3d-param-group">
          <legend>03 / SUPPORT STRUCTURES</legend>
          <div class="k3d-support-pills">
            <label class="k3d-support-pill is-selected">
              <input type="radio" name="quote_support" value="none" data-support-pct="0" checked>
              <span>NO SUPPORTS<br><small style="color:var(--k3d-meta);">+0% Weight</small></span>
            </label>
            <label class="k3d-support-pill">
              <input type="radio" name="quote_support" value="tree" data-support-pct="15">
              <span>TREE SUPPORTS<br><small style="color:var(--k3d-rust);">+15% Weight</small></span>
            </label>
            <label class="k3d-support-pill">
              <input type="radio" name="quote_support" value="standard" data-support-pct="25">
              <span>LINEAR DENSE<br><small style="color:var(--k3d-meta);">+25% Weight</small></span>
            </label>
          </div>
        </fieldset>

        <!-- Model Geometry Metrics -->
        <div class="k3d-metrics-grid">
          <div>
            <span>BOUNDING BOX</span>
            <strong id="k3d-stat-box">--- × --- × --- MM</strong>
          </div>
          <div>
            <span>ESTIMATED WEIGHT</span>
            <strong id="k3d-stat-weight">--- GRAMS</strong>
          </div>
          <div>
            <span>EST. PRINT TIME</span>
            <strong id="k3d-stat-time">---</strong>
          </div>
          <div>
            <span>BAMBU A1 STATUS</span>
            <strong id="k3d-stat-status" style="color: #1f6b3d;">READY</strong>
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

        <p class="k3d-quote-notice">
          Advance deposit of <strong>৳100 via bKash</strong> is mandatory before slicing verification and machine queue assignment.
        </p>

        <button class="k3d-button k3d-quote-cta" type="button" id="k3d-add-quote-btn">
          <span>SUBMIT CAD SPECIMEN TO BAG</span> <strong id="k3d-btn-deposit-label">৳100 DEPOSIT →</strong>
        </button>
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
