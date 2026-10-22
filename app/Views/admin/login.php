<?= $this->extend('layouts/main') ?>

<?= $this->section('content') ?>
<div style="min-height: 75vh; display: flex; align-items: center; justify-content: center; padding: 40px 20px;">
  <div style="width: 100%; max-width: 440px; background: var(--k3d-surface); border: 2px solid var(--k3d-ink); padding: 36px 32px; box-shadow: 6px 6px 0 var(--k3d-ink);">
    
    <div style="display: flex; align-items: center; gap: 12px; margin-bottom: 24px; padding-bottom: 16px; border-bottom: 1px dashed var(--k3d-border);">
      <img src="/assets/images/logo.svg" alt="Kerf 3D" style="height: 32px; width: auto;">
      <div>
        <strong style="font-family: var(--k3d-display); font-size: 16px; display: block; letter-spacing: -0.02em;">KERF 3D STUDIO</strong>
        <span style="font-family: var(--k3d-mono); font-size: 9px; color: var(--k3d-meta); letter-spacing: 0.1em;">ADMINISTRATIVE CONTROL INTAKE</span>
      </div>
    </div>

    <h1 style="font-family: var(--k3d-display); font-size: 26px; line-height: 1.1; margin: 0 0 12px; letter-spacing: -0.04em;">Workshop Portal</h1>
    <p style="font-family: var(--k3d-mono); font-size: 11px; color: var(--k3d-meta); margin: 0 0 24px;">Restricted access for order ledger, CAD mesh downloads & hardware queue dispatch.</p>

    <?php if (session()->getFlashdata('error')): ?>
      <div style="background: rgba(200, 100, 70, 0.1); border: 1px solid var(--k3d-rust); color: var(--k3d-rust); padding: 12px 14px; font-family: var(--k3d-mono); font-size: 11px; margin-bottom: 20px;">
        ⚠ <?= esc(session()->getFlashdata('error')) ?>
      </div>
    <?php endif; ?>

    <?php if (session()->getFlashdata('success')): ?>
      <div style="background: rgba(40, 160, 60, 0.1); border: 1px solid #28a03c; color: #1c732b; padding: 12px 14px; font-family: var(--k3d-mono); font-size: 11px; margin-bottom: 20px;">
        ✓ <?= esc(session()->getFlashdata('success')) ?>
      </div>
    <?php endif; ?>

    <form action="/admin/login" method="POST" style="display: flex; flex-direction: column; gap: 18px;">
      <?= csrf_field() ?>

      <label style="display: flex; flex-direction: column; gap: 6px; font-family: var(--k3d-mono); font-size: 10px; font-weight: 700; color: var(--k3d-ink); letter-spacing: 0.08em;">
        OPERATOR IDENTIFIER
        <input type="text" name="username" required autocomplete="username" placeholder="e.g. admin" style="padding: 12px 14px; border: 1px solid var(--k3d-ink); font-family: var(--k3d-mono); font-size: 13px; background: var(--k3d-canvas);">
      </label>

      <label style="display: flex; flex-direction: column; gap: 6px; font-family: var(--k3d-mono); font-size: 10px; font-weight: 700; color: var(--k3d-ink); letter-spacing: 0.08em;">
        SECURITY ACCESS KEY
        <input type="password" name="password" required autocomplete="current-password" placeholder="••••••••••••" style="padding: 12px 14px; border: 1px solid var(--k3d-ink); font-family: var(--k3d-mono); font-size: 13px; background: var(--k3d-canvas);">
      </label>

      <button type="submit" class="button" style="width: 100%; margin-top: 8px; justify-content: space-between; font-size: 11px;">
        <span>AUTHENTICATE & ENTER WORKSHOP</span>
        <span>→</span>
      </button>
    </form>

    <div style="margin-top: 24px; padding-top: 14px; border-top: 1px dashed var(--k3d-border); display: flex; justify-content: space-between; align-items: center; font-family: var(--k3d-mono); font-size: 9px; color: var(--k3d-meta);">
      <span>SECURITY PROTOCOL: AES-GCM</span>
      <a href="/" style="color: var(--k3d-ink); text-decoration: underline;">RETURN TO STOREFRONT</a>
    </div>

  </div>
</div>
<?= $this->endSection() ?>
