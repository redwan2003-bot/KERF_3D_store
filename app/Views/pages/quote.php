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
            <button type="button" class="is-active">SOLID</button>
            <button type="button">WIREFRAME</button>
            <button type="button">BED BOUNDS</button>
          </div>
          <div class="k3d-viewer-actions">
            <button type="button">RESET VIEW</button>
            <button type="button">AUTO-ORIENT</button>
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
            <label class="k3d-radio-option is-selected">
              <input type="radio" name="quote_material" value="pla" data-density="0.500" checked>
              <div>
                <strong>PLA / RIGID BIOPOLYMER</strong>
                <small>High stiffness, clean dimensional detail · 0.50 g/cm³</small>
              </div>
              <b class="k3d-poly-tag">RIGID SPEC</b>
            </label>
            <label class="k3d-radio-option">
              <input type="radio" name="quote_material" value="tpu-95a" data-density="0.480">
              <div>
                <strong>TPU 95A / ELASTOMER</strong>
                <small>Semi-flexible, impact absorbing · 0.48 g/cm³</small>
              </div>
              <b class="k3d-poly-tag">FLEX SPEC</b>
            </label>
          </div>
        </fieldset>

        <!-- 02 / Infill & Density -->
        <fieldset class="k3d-param-group">
          <legend>02 / INFILL DENSITY</legend>
          <div class="k3d-infill-pills">
            <label><input type="radio" name="quote_infill" value="15"><span>15% Lightweight</span></label>
            <label class="is-selected"><input type="radio" name="quote_infill" value="20" checked><span>20% Gyroid</span></label>
            <label><input type="radio" name="quote_infill" value="50"><span>50% Structural</span></label>
            <label><input type="radio" name="quote_infill" value="100"><span>100% Solid</span></label>
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
            <strong id="k3d-stat-weight">140 GRAMS</strong>
          </div>
          <div>
            <span>EST. PRINT TIME</span>
            <strong id="k3d-stat-time">~6H 45M</strong>
          </div>
          <div>
            <span>BAMBU A1 STATUS</span>
            <strong style="color: #1f6b3d;">VERIFIED FIT</strong>
          </div>
        </div>

        <!-- Price Calculation Breakdown -->
        <div class="k3d-quote-summary">
          <div class="k3d-summary-row k3d-total-row">
            <span>CUSTOM SPECIMEN ESTIMATE</span>
            <strong id="k3d-calc-total">৳960</strong>
          </div>
          <div class="k3d-summary-row k3d-deposit-row">
            <span>MANDATORY ADVANCE DEPOSIT</span>
            <b class="k3d-highlight-deposit">৳100</b>
          </div>
          <div class="k3d-summary-row k3d-balance-row">
            <span>REMAINING BALANCE (AT DISPATCH)</span>
            <span id="k3d-calc-balance">৳860 + courier</span>
          </div>
        </div>

        <p class="k3d-quote-notice">
          Advance deposit of <strong>৳100 via bKash</strong> is mandatory before slicing verification and machine queue assignment.
        </p>

        <button class="k3d-button k3d-quote-cta" type="button" id="k3d-add-quote-btn">
          SUBMIT CAD SPECIMEN TO BAG <span>৳100 DEPOSIT →</span>
        </button>
      </div>
    </aside>
  </div>
</div>
<?= $this->endSection() ?>

<?= $this->section('scripts') ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<script src="/assets/js/quote.js"></script>
<?= $this->endSection() ?>
