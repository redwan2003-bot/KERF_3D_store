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
        <a href="/admin" class="admin-brand">
            <span class="admin-brand-icon">K3D</span>
            <div>
                <div class="admin-brand-title">KERF 3D STUDIO</div>
                <div class="admin-brand-sub">Workshop Command Center</div>
            </div>
        </a>

        <ul class="admin-nav-links">
            <li><a href="/admin" class="<?= (uri_string() === 'admin' || uri_string() === '') ? 'active' : '' ?>">Dashboard</a></li>
            <li><a href="/admin/orders" class="<?= str_starts_with(uri_string(), 'admin/orders') ? 'active' : '' ?>">Orders</a></li>
            <li><a href="/admin/cad-uploads" class="<?= str_starts_with(uri_string(), 'admin/cad-uploads') ? 'active' : '' ?>">CAD Intake</a></li>
            <li><a href="/admin/drive-sync" class="<?= str_starts_with(uri_string(), 'admin/drive-sync') ? 'active' : '' ?>">Drive Sync</a></li>
        </ul>

        <div style="display: flex; align-items: center; gap: 16px;">
            <div class="admin-status-pill">
                <span class="admin-pulse-dot"></span>
                <span>BAMBU A1 : ACTIVE</span>
            </div>
            <a href="/" target="_blank" class="admin-btn sm secondary">Storefront ↗</a>
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
