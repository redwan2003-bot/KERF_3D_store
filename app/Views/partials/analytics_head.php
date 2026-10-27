<?php
$ga4Id = env('GA4_MEASUREMENT_ID', '');
$metaPixelId = env('META_PIXEL_ID', '');
?>
<?php if (!empty($ga4Id)): ?>
  <!-- Google Analytics 4 (GA4) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=<?= esc($ga4Id) ?>"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', '<?= esc($ga4Id) ?>');
  </script>
<?php endif; ?>

<?php if (!empty($metaPixelId)): ?>
  <!-- Meta Pixel Code -->
  <script>
    !function(f,b,e,v,n,t,s)
    {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
    n.callMethod.apply(n,arguments):n.queue.push(arguments)};
    if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
    n.queue=[];t=b.createElement(e);t.async=!0;
    t.src=v;s=b.getElementsByTagName(e)[0];
    s.parentNode.insertBefore(t,s)}(window, document,'script',
    'https://connect.facebook.net/en_US/fbevents.js');
    fbq('init', '<?= esc($metaPixelId) ?>');
    fbq('track', 'PageView');
  </script>
  <noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=<?= esc($metaPixelId) ?>&ev=PageView&noscript=1"/></noscript>
<?php endif; ?>

<!-- Unified Studio Conversion Event Dispatcher -->
<script>
  window.k3dTrack = function(eventName, params) {
    params = params || {};
    try {
      // 1. Google Analytics 4 E-Commerce Standard
      if (typeof window.gtag === 'function') {
        window.gtag('event', eventName, params);
      }
      // 2. Meta Pixel E-Commerce Standard
      if (typeof window.fbq === 'function') {
        window.fbq('track', eventName, params);
      }
      // Debug log in dev mode
      if (window.location.hostname === 'localhost' || window.location.hostname === '127.0.0.1') {
        console.log('[K3D Analytics Event]', eventName, params);
      }
    } catch (e) {
      console.warn('[K3D Analytics Error]', e);
    }
  };
</script>
