<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= esc($title ?? 'Kerf 3D Studio — Precision Additive Manufacturing & Curated Artifacts') ?></title>
    <meta name="description" content="<?= esc($meta_description ?? 'Curated 3D printed artifacts and on-demand FDM additive manufacturing on Bambu Lab A1 in Dhaka, Bangladesh.') ?>">

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="/assets/images/favicon.svg">

    <!-- Typography: Syne, Plus Jakarta Sans, Space Mono -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600&family=Space+Mono:ital,wght@0,400;0,700;1,400&family=Syne:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Global Design Tokens & Typography -->
    <link rel="stylesheet" href="/assets/css/global-tokens.css?v=<?= time() ?>">
    <link rel="stylesheet" href="/assets/css/cart-drawer.css?v=<?= time() ?>">

    <!-- Page Specific Stylesheet -->
    <?php if (!empty($pageCss)): ?>
        <?php foreach ((array) $pageCss as $cssFile): ?>
            <link rel="stylesheet" href="/assets/css/<?= esc($cssFile) ?>?v=<?= time() ?>">
        <?php endforeach; ?>
    <?php endif; ?>
</head>
<body>

    <!-- Site Navigation Header -->
    <?= $this->include('partials/site_header') ?>

    <!-- Main Content Injection -->
    <main class="k3d-main-wrapper" id="main-content">
        <?= $this->renderSection('content') ?>
    </main>

    <!-- Site Footer -->
    <?= $this->include('partials/site_footer') ?>

    <!-- Global Cart Drawer (Receipt Panel) -->
    <?= $this->include('partials/cart_drawer') ?>

    <!-- Global Brutalist Cart Drawer Controller -->
    <script src="/assets/js/cart-drawer.js"></script>

    <!-- Page Specific Injected Scripts -->
    <?= $this->renderSection('scripts') ?>
</body>
</html>
