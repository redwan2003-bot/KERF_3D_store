<header class="k3d-header" role="banner">
    <div class="k3d-header-inner k3d-container">
        <!-- Official Vector Logo linked to Homepage -->
        <a href="/" class="k3d-brand" aria-label="Kerf Homepage">
            <img src="/assets/images/logo.svg" alt="Kerf Logo" class="k3d-brand-logo">
        </a>

        <!-- Primary Navigation -->
        <nav class="k3d-nav" role="navigation" aria-label="Main Navigation">
            <a href="/shop" class="<?= (uri_string() === 'shop' || str_starts_with(uri_string(), 'product')) ? 'is-active' : '' ?>">SHOP</a>
            <a href="/quote" class="<?= (uri_string() === 'quote') ? 'is-active' : '' ?>"><span class="k3d-hide-mobile">CUSTOM </span>QUOTE</a>
            <a href="/materials" class="<?= (uri_string() === 'materials') ? 'is-active' : '' ?>">MATERIALS</a>
            <a href="/track" class="<?= (uri_string() === 'track') ? 'is-active' : '' ?>">TRACK</a>
        </nav>

        <!-- Workshop Hardware Telemetry & Cart Trigger -->
        <div class="k3d-header-actions">
            <div class="k3d-header-heartbeat" title="Dhaka Workshop Fabrication Queue: ONLINE" aria-label="Workshop Status">
                <span class="k3d-heartbeat-dot"></span>
                <span class="k3d-heartbeat-label">A1 // ACTIVE</span>
            </div>
            <button type="button" class="k3d-cart-trigger k3d-open-cart" aria-label="Open Shopping Bag">
                <span>BAG</span>
                <span class="k3d-cart-count" id="k3d-nav-cart-count">0</span>
            </button>
        </div>
    </div>
</header>
