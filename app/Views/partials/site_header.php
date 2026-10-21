<header class="k3d-header" role="banner">
    <div class="k3d-header-inner k3d-container">
        <!-- Brand Wordmark & Native Color Mark -->
        <a href="/" class="k3d-brand" aria-label="Kerf 3D Studio Homepage">
            <span class="k3d-brand-mark" style="color: var(--k3d-logo-brown);">◒</span>
            <span class="k3d-brand-text">
                <strong>KERF 3D</strong>
                <small>STUDIO / DHAKA</small>
            </span>
        </a>

        <!-- Primary Navigation -->
        <nav class="k3d-nav" role="navigation" aria-label="Main Navigation">
            <a href="/shop" class="<?= (uri_string() === 'shop' || str_starts_with(uri_string(), 'product')) ? 'is-active' : '' ?>">SHOP</a>
            <a href="/quote" class="<?= (uri_string() === 'quote') ? 'is-active' : '' ?>">CUSTOM QUOTE</a>
            <a href="/materials" class="<?= (uri_string() === 'materials') ? 'is-active' : '' ?>">MATERIALS</a>
        </nav>

        <!-- Cart Trigger with Dynamic Badge -->
        <div class="k3d-header-actions">
            <button type="button" class="k3d-cart-trigger k3d-open-cart" aria-label="Open Shopping Bag">
                <span>BAG</span>
                <span class="k3d-cart-count" id="k3d-nav-cart-count">0</span>
            </button>
        </div>
    </div>
</header>
