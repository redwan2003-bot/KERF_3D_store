<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= esc($title ?? 'Kerf 3D Studio — Precision Additive Manufacturing & Curated Artifacts') ?></title>
    <meta name="description" content="<?= esc($meta_description ?? 'Curated 3D printed artifacts and on-demand FDM additive manufacturing on Bambu Lab A1 in Dhaka, Bangladesh.') ?>">

    <!-- Typography: Syne, Plus Jakarta Sans, Space Mono -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600&family=Space+Mono:ital,wght@0,400;0,700;1,400&family=Syne:wght@600;700;800&display=swap" rel="stylesheet">

    <!-- Global Design Tokens & Typography -->
    <link rel="stylesheet" href="/assets/css/global-tokens.css">
    <link rel="stylesheet" href="/assets/css/cart-drawer.css">

    <!-- Page Specific Stylesheet -->
    <?php if (!empty($pageCss)): ?>
        <?php foreach ((array) $pageCss as $cssFile): ?>
            <link rel="stylesheet" href="/assets/css/<?= esc($cssFile) ?>">
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

    <!-- Vanilla Cart Drawer Interactions -->
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const drawer = document.getElementById('k3d-cart-drawer');
            const triggers = document.querySelectorAll('.k3d-open-cart');
            const closeBtn = document.querySelector('.k3d-cart-close');
            const backdrop = document.querySelector('.k3d-cart-backdrop');

            function openCart() {
                if (drawer) {
                    drawer.classList.add('is-open');
                    document.body.style.overflow = 'hidden';
                }
            }

            function closeCart() {
                if (drawer) {
                    drawer.classList.remove('is-open');
                    document.body.style.overflow = '';
                }
            }

            triggers.forEach(t => t.addEventListener('click', function(e) {
                e.preventDefault();
                openCart();
            }));

            if (closeBtn) closeBtn.addEventListener('click', closeCart);
            if (backdrop) backdrop.addEventListener('click', closeCart);

            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape' && drawer && drawer.classList.contains('is-open')) {
                    closeCart();
                }
            });
        });
    </script>
</body>
</html>
