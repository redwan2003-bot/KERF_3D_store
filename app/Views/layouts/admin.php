<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= esc($title ?? 'Workshop Admin — Kerf 3D Studio') ?></title>

    <!-- Typography: Syne, Plus Jakarta Sans, Space Mono -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&family=Space+Mono:ital,wght@0,400;0,700;1,400&family=Syne:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Admin Design System -->
    <link rel="stylesheet" href="/assets/css/admin.css">

    <!-- Three.js (r128) via Cloudflare CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
</head>
<body class="admin-body">

    <!-- Top Workshop Navbar -->
    <header class="admin-navbar">
        <a href="/admin" class="admin-brand" aria-label="Kerf Admin">
            <img src="/assets/images/logo.svg" alt="Kerf Logo" style="height: 32px; width: auto; filter: invert(1); opacity: 0.95; display: block;">
        </a>

        <ul class="admin-nav-links">
            <li><a href="/admin" class="<?= (uri_string() === 'admin' || uri_string() === '') ? 'active' : '' ?>">Dashboard</a></li>
            <li><a href="/admin/orders" class="<?= (str_starts_with(uri_string(), 'admin/orders') || str_starts_with(uri_string(), 'orders')) ? 'active' : '' ?>">Orders</a></li>
            <li><a href="/admin/cad-uploads" class="<?= str_starts_with(uri_string(), 'admin/cad-uploads') ? 'active' : '' ?>">CAD Intake</a></li>
            <li><a href="/admin/drive-sync" class="<?= str_starts_with(uri_string(), 'admin/drive-sync') ? 'active' : '' ?>">Drive Sync</a></li>
        </ul>

        <div style="display: flex; align-items: center; gap: 12px; flex-wrap: wrap;">
            <div class="admin-status-pill">
                <span class="admin-pulse-dot"></span>
                <span>BAMBU A1 : ACTIVE</span>
            </div>

            <div class="admin-operator-tag" style="display: flex; align-items: center; gap: 6px; font-family: var(--font-mono); font-size: 11px; color: var(--admin-muted); padding: 5px 10px; background: rgba(255,255,255,0.04); border: 1px solid var(--admin-border); border-radius: 3px;">
                <span style="color: var(--admin-green); font-size: 9px;">●</span>
                <span>OP: <strong><?= esc(session('admin_user') ?? 'admin') ?></strong></span>
            </div>

            <a href="/" target="_blank" rel="noopener" class="admin-btn sm secondary" title="View Public Storefront">Storefront ↗</a>
            <a href="/admin/logout" class="admin-btn sm" style="background: rgba(239, 68, 68, 0.12); border-color: rgba(239, 68, 68, 0.35); color: #f87171;" title="Sign out of Workshop Admin">Sign Out</a>
        </div>
    </header>

    <!-- Admin Main Body -->
    <main class="admin-main">
        <!-- Flash Alerts -->
        <?php if (session()->getFlashdata('success')): ?>
            <div class="admin-alert success">
                <span><strong>[SYSTEM CONFIRMED]</strong> <?= esc(session()->getFlashdata('success')) ?></span>
            </div>
        <?php endif; ?>

        <?php if (session()->getFlashdata('error')): ?>
            <div class="admin-alert error">
                <span><strong>[SYSTEM ERROR]</strong> <?= esc(session()->getFlashdata('error')) ?></span>
            </div>
        <?php endif; ?>

        <!-- Content Injection -->
        <?= $this->renderSection('content') ?>
    </main>

    <!-- Optional Page Scripts -->
    <?= $this->renderSection('scripts') ?>
</body>
</html>
