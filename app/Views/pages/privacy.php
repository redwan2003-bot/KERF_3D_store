<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-container" style="max-width: 900px; margin: 50px auto 100px; padding: 0 20px;">
  <div style="margin-bottom: 24px;">
    <p class="k3d-kicker" style="color: var(--k3d-rust); font-size: 11px; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; margin-bottom: 8px;">
      DATA SOVEREIGNTY // PROTOCOL SPEC-02
    </p>
    <h1 style="font-size: clamp(32px, 4.5vw, 48px); font-weight: 800; letter-spacing: -0.03em; margin: 0 0 12px; color: var(--k3d-ink); line-height: 1.05;">
      Privacy Policy <em style="color: var(--k3d-rust); font-style: normal;">&amp; Client Data Protocol.</em>
    </h1>
    <p style="font-family: var(--k3d-font-mono); font-size: 11px; color: var(--k3d-meta); letter-spacing: 0.06em;">
      DOCUMENT ID: K3D-PRIV-2026-V2 · EFFECTIVE: NOVEMBER 2026 · DHAKA ATELIER
    </p>
  </div>

  <div style="background: var(--k3d-surface); border: 1px solid var(--k3d-border); box-shadow: 4px 4px 0 var(--k3d-ink); padding: clamp(24px, 4vw, 44px);">
    
    <div style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid var(--k3d-border); padding-bottom: 16px; margin-bottom: 28px; font-family: var(--k3d-font-mono); font-size: 10px; color: var(--k3d-meta); letter-spacing: 0.08em;">
      <span>CLIENT DATA SECURITY // MINIMALIST TELEMETRY</span>
      <span style="color: var(--k3d-teal); font-weight: 700;">● ZERO THIRD-PARTY TRACKING</span>
    </div>

    <div style="display: grid; gap: 28px; font-size: 14px; line-height: 1.7; color: var(--k3d-secondary);">
      
      <div>
        <h3 style="font-family: var(--k3d-font-mono); font-size: 12px; font-weight: 800; letter-spacing: 0.08em; text-transform: uppercase; margin: 0 0 8px; color: var(--k3d-ink);">
          01 // Minimalist Data Collection
        </h3>
        <p style="margin: 0;">
          <strong>KERF 3D Studio</strong> collects strictly the bare minimum telemetry required to slice CAD geometries, fulfill physical fabrication jobs, and coordinate dispatch courier delivery. This consists solely of customer name, delivery address, phone number (for courier dispatch verification), and uploaded 3D CAD files.
        </p>
      </div>

      <div>
        <h3 style="font-family: var(--k3d-font-mono); font-size: 12px; font-weight: 800; letter-spacing: 0.08em; text-transform: uppercase; margin: 0 0 8px; color: var(--k3d-ink);">
          02 // Cloud &amp; Google Drive Integration Guardrails
        </h3>
        <p style="margin: 0;">
          Our infrastructure integrates with Google Drive APIs strictly for server-side product photography synchronization and isolated customer CAD file handoffs. We do not inspect personal cloud files, access private contact records, or distribute Google account metadata to external advertising brokers.
        </p>
      </div>

      <div>
        <h3 style="font-family: var(--k3d-font-mono); font-size: 12px; font-weight: 800; letter-spacing: 0.08em; text-transform: uppercase; margin: 0 0 8px; color: var(--k3d-ink);">
          03 // Strict Confidentiality of Proprietary CAD Meshes
        </h3>
        <p style="margin: 0;">
          Prototypes and custom mechanical models uploaded to our slicer remain strictly private. Uploaded geometry is processed in isolated sandboxed workers for volume and surface area calculation and is never shared, indexed in public databases, or utilized for generative AI training without explicit authorization.
        </p>
      </div>

      <div>
        <h3 style="font-family: var(--k3d-font-mono); font-size: 12px; font-weight: 800; letter-spacing: 0.08em; text-transform: uppercase; margin: 0 0 8px; color: var(--k3d-ink);">
          04 // Direct Data Inquiries &amp; Erasure Requests
        </h3>
        <p style="margin: 0;">
          Clients may request complete archival erasure of their order history and CAD files at any time by contacting our studio team:
        </p>
        <div style="margin-top: 10px; font-family: var(--k3d-font-mono); font-size: 12px; background: var(--k3d-canvas); border: 1px solid var(--k3d-border); padding: 14px;">
          <div>• Data Controller: KERF 3D Atelier Dhaka</div>
          <div>• Studio Email: <a href="mailto:kerf.3d@gmail.com" style="color: var(--k3d-ink); font-weight: 700;">kerf.3d@gmail.com</a></div>
          <div>• Emergency Dispatch Phone: <a href="tel:+8801754550297" style="color: var(--k3d-ink); font-weight: 700;">+880 1754-550297</a></div>
        </div>
      </div>

    </div>

    <div style="margin-top: 36px; padding-top: 20px; border-top: 1px dashed var(--k3d-border); display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px;">
      <span class="k3d-rubber-stamp" style="font-size: 10px;">DATA SOVEREIGNTY VERIFIED · KERF 3D</span>
      <a href="/quote" class="k3d-button k3d-btn-sm">UPLOAD CAD MESH &rarr;</a>
    </div>

  </div>
</div>
<?= $this->endSection() ?>
