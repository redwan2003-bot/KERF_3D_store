<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= esc($title ?? 'Kerf 3D Studio — Precision Additive Manufacturing & Curated Artifacts') ?></title>
    <meta name="description" content="<?= esc($meta_description ?? 'Curated 3D printed artifacts and on-demand FDM additive manufacturing on Bambu Lab A1 in Dhaka, Bangladesh.') ?>">
    <link rel="canonical" href="<?= esc($canonical_url ?? current_url()) ?>">

    <!-- OpenGraph Social Cards (WhatsApp / Facebook) -->
    <meta property="og:type" content="<?= esc($og_type ?? 'website') ?>">
    <meta property="og:site_name" content="KERF 3D Studio">
    <meta property="og:title" content="<?= esc($og_title ?? $title ?? 'Kerf 3D Studio') ?>">
    <meta property="og:description" content="<?= esc($og_description ?? $meta_description ?? 'Curated 3D printed artifacts and on-demand FDM additive manufacturing on Bambu Lab A1 in Dhaka.') ?>">
    <meta property="og:url" content="<?= esc($canonical_url ?? current_url()) ?>">
    <meta property="og:image" content="<?= esc($og_image ?? base_url('assets/images/favicon.svg')) ?>">

    <!-- Twitter Cards -->
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:title" content="<?= esc($og_title ?? $title ?? 'Kerf 3D Studio') ?>">
    <meta name="twitter:description" content="<?= esc($og_description ?? $meta_description ?? 'Curated 3D printed artifacts and on-demand FDM additive manufacturing.') ?>">
    <meta name="twitter:image" content="<?= esc($og_image ?? base_url('assets/images/favicon.svg')) ?>">

    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="/assets/images/favicon.svg">

    <!-- Typography: Outfit (Display & Unique Geometry), Plus Jakarta Sans (Body), Space Mono (Hardware Telemetry) -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@500;600;700;800;900&family=Plus+Jakarta+Sans:wght@400;500;600;700&family=Space+Mono:ital,wght@0,400;0,700;1,400&display=swap" rel="stylesheet">

    <!-- Global Design Tokens & Typography -->
    <link rel="stylesheet" href="/assets/css/global-tokens.css?v=<?= time() ?>">
    <link rel="stylesheet" href="/assets/css/cart-drawer.css?v=<?= time() ?>">

    <!-- Page Specific Stylesheet -->
    <?php if (!empty($pageCss)): ?>
        <?php foreach ((array) $pageCss as $cssFile): ?>
            <link rel="stylesheet" href="/assets/css/<?= esc($cssFile) ?>?v=<?= time() ?>">
        <?php endforeach; ?>
    <?php endif; ?>

    <!-- Studio E-Commerce Analytics & Conversion Event Engine -->
    <?= $this->include('partials/analytics_head') ?>

    <!-- Schema.org JSON-LD Structured Data for GEO & AI Search Engines -->
    <?= $this->include('partials/schema_org') ?>
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

    <!-- Floating Workshop WhatsApp Concierge -->
    <?= $this->include('partials/floating_whatsapp') ?>

    <!-- Global Cart Drawer (Receipt Panel) -->
    <?= $this->include('partials/cart_drawer') ?>

    <!-- Global Brutalist Cart Drawer Controller -->
    <script src="/assets/js/cart-drawer.js"></script>

    <!-- Page Specific Injected Scripts -->
    <?= $this->renderSection('scripts') ?>
</body>
</html>
