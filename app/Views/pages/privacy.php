<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div class="k3d-container" style="max-width: 800px; margin: 40px auto 80px; padding: 0 20px;">
  <p class="k3d-kicker" style="color: var(--k3d-accent); font-size: 11px; font-weight: 700; letter-spacing: 0.12em; text-transform: uppercase; margin-bottom: 8px;">LEGAL // PRIVACY</p>
  <h1 style="font-size: 32px; font-weight: 700; letter-spacing: -0.02em; margin-bottom: 24px; color: var(--k3d-text);">Privacy Policy</h1>
  
  <div style="font-size: 15px; line-height: 1.7; color: var(--k3d-muted);">
    <p>Last updated: October 2026</p>
    
    <h3 style="font-size: 18px; font-weight: 600; margin: 24px 0 8px; color: var(--k3d-text);">1. Information We Collect</h3>
    <p>Kerf 3D Studio ("we", "our", or "us"), operating at <strong>kerf3d.store</strong>, collects minimal information required to fulfill on-demand 3D printing orders and provide customer support. This includes name, delivery address, phone number, and any uploaded CAD models or design files.</p>

    <h3 style="font-size: 18px; font-weight: 600; margin: 24px 0 8px; color: var(--k3d-text);">2. Google Drive Integration</h3>
    <p>Our application integrates with Google Drive APIs exclusively to manage product imagery, catalog photography, and secure customer CAD file transfers for manufacturing. We do not sell, rent, or distribute any Google account data to third parties.</p>

    <h3 style="font-size: 18px; font-weight: 600; margin: 24px 0 8px; color: var(--k3d-text);">3. Intellectual Property of Customer Files</h3>
    <p>All custom 3D models (.STL, .OBJ, .3MF) uploaded by users remain the exclusive intellectual property of the customer. Models are only used to slice, estimate, and physically manufacture the requested objects.</p>

    <h3 style="font-size: 18px; font-weight: 600; margin: 24px 0 8px; color: var(--k3d-text);">4. Contact</h3>
    <p>For questions regarding this policy, contact us at <strong>kerf.3d@gmail.com</strong>.</p>
  </div>
</div>
<?= $this->endSection() ?>
