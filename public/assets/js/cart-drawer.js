/**
 * Kerf 3D Studio — Global Brutalist Receipt Cart Drawer Engine
 */
(function () {
  const drawer   = document.getElementById('k3d-cart-drawer');
  const backdrop = document.getElementById('k3d-cart-backdrop');
  const closeBtn = document.getElementById('k3d-cart-close-btn');
  const container = document.getElementById('k3d-cart-items-container');
  const navBadge = document.getElementById('k3d-nav-cart-count');
  const drawerBadge = document.getElementById('k3d-cart-badge-count');
  const subtotalEl = document.getElementById('k3d-drawer-subtotal');
  const shippingEl = document.getElementById('k3d-drawer-shipping');
  const grandTotalEl = document.getElementById('k3d-drawer-grand-total');

  let currentShippingZone = 'inside_dhaka';
  let cachedCartData = null;

  function openDrawer() {
    if (drawer) {
      drawer.classList.add('is-open');
      document.body.style.overflow = 'hidden';
    }
  }

  function closeDrawer() {
    if (drawer) {
      drawer.classList.remove('is-open');
      document.body.style.overflow = '';
    }
  }

  // Bind Open Triggers
  document.querySelectorAll('.k3d-open-cart').forEach(btn => {
    btn.addEventListener('click', function (e) {
      e.preventDefault();
      openDrawer();
    });
  });

  if (closeBtn) closeBtn.addEventListener('click', closeDrawer);
  if (backdrop) backdrop.addEventListener('click', closeDrawer);

  window.addEventListener('keydown', function (e) {
    if (e.key === 'Escape' && drawer && drawer.classList.contains('is-open')) {
      closeDrawer();
    }
  });

  // Render Cart DOM
  function renderCart(data) {
    cachedCartData = data;

    // Update Badges
    if (navBadge) navBadge.textContent = data.total_items;
    if (drawerBadge) drawerBadge.textContent = `${data.total_items} ${data.total_items === 1 ? 'ITEM' : 'ITEMS'}`;

    // Subtotal
    if (subtotalEl) subtotalEl.textContent = data.subtotal_fmt;

    // Shipping & Grand Total
    const shippingRate = currentShippingZone === 'inside_dhaka' ? data.shipping_inside : data.shipping_outside;
    const shippingFmt  = currentShippingZone === 'inside_dhaka' ? data.shipping_inside_fmt : data.shipping_outside_fmt;
    const grandTotal   = (data.subtotal + shippingRate).toFixed(2);

    if (shippingEl) shippingEl.textContent = shippingFmt;
    if (grandTotalEl) grandTotalEl.textContent = `৳${Number(grandTotal).toLocaleString('en-US', { minimumFractionDigits: 2 })}`;

    // Render Item Rows
    if (!container) return;

    if (!data.items || data.items.length === 0) {
      container.innerHTML = `
        <div class="k3d-cart-empty-notice" style="padding: 48px 0; text-align: center; color: var(--k3d-meta); font-family: var(--k3d-mono); font-size: 11px;">
          YOUR ARTIFACT BAG IS CURRENTLY EMPTY.
          <div style="margin-top: 14px;">
            <a href="/shop" class="k3d-button is-style-outline" style="font-size: 10px; padding: 10px 14px;" onclick="window.k3dCart.close()">BROWSE ARTIFACTS &rarr;</a>
          </div>
        </div>
      `;
      return;
    }

    let html = '';
    data.items.forEach(item => {
      const thumbHtml = item.thumbnail 
        ? `<img src="${item.thumbnail}" alt="${item.name}">` 
        : `<span style="font-size: 9px; font-weight: 700; color: var(--k3d-meta); text-align: center;">${item.sku || 'K3D'}</span>`;

      html += `
        <div class="k3d-receipt-item" data-key="${item.key}">
          <div class="k3d-receipt-thumb">
            ${thumbHtml}
          </div>
          <div class="k3d-receipt-item-info">
            <strong>${item.name}</strong>
            <span class="k3d-item-spec">${item.specs || 'STANDARD'}</span>
            <div class="k3d-qty-stepper">
              <button type="button" class="k3d-qty-btn" onclick="window.k3dCart.updateQty('${item.key}', ${item.quantity - 1})">&minus;</button>
              <span class="k3d-qty-val">${item.quantity}</span>
              <button type="button" class="k3d-qty-btn" onclick="window.k3dCart.updateQty('${item.key}', ${item.quantity + 1})">&plus;</button>
            </div>
          </div>
          <div class="k3d-item-right">
            <span class="k3d-line-price">৳${Number(item.line_total).toFixed(2)}</span>
            <button type="button" class="k3d-item-remove" onclick="window.k3dCart.removeItem('${item.key}')">REMOVE</button>
          </div>
        </div>
      `;
    });

    container.innerHTML = html;
  }

  // Fetch Cart State from Backend
  async function fetchCart() {
    try {
      const res = await fetch('/cart/data');
      if (res.ok) {
        const data = await res.json();
        renderCart(data);
      }
    } catch (e) {
      console.warn('Could not fetch cart data:', e);
    }
  }

  // Global Cart API
  window.k3dCart = {
    open: openDrawer,
    close: closeDrawer,
    refresh: fetchCart,

    setShipping: function (zone) {
      currentShippingZone = zone;
      if (cachedCartData) {
        renderCart(cachedCartData);
      }
    },

    addItem: async function (payload) {
      try {
        let fd;
        if (payload instanceof FormData) {
          fd = payload;
        } else {
          fd = new FormData();
          if (typeof payload === 'object' && payload !== null) {
            for (const [k, v] of Object.entries(payload)) {
              if (v !== null && v !== undefined) fd.append(k, v);
            }
          } else {
            fd.append('product_id', payload);
            fd.append('quantity', 1);
          }
        }

        // Include CSRF if present in DOM
        const csrfInput = document.querySelector('input[name="csrf_test_name"]');
        if (csrfInput && !fd.has(csrfInput.name)) {
          fd.append(csrfInput.name, csrfInput.value);
        }

        const res = await fetch('/cart/add', {
          method: 'POST',
          body: fd,
          headers: {
            'X-Requested-With': 'XMLHttpRequest'
          }
        });
        if (res.ok) {
          const data = await res.json();
          renderCart(data);
          openDrawer();
          return data;
        } else {
          const errData = await res.json().catch(() => null);
          console.error('Cart add error:', errData);
          throw new Error(errData?.error || 'Failed to add item');
        }
      } catch (e) {
        console.error('Failed to add item to cart:', e);
        throw e;
      }
    },

    addCustomPrint: async function (customData) {
      try {
        const fd = new FormData();
        for (const [k, v] of Object.entries(customData)) {
          fd.append(k, v);
        }
        const res = await fetch('/cart/add-custom', {
          method: 'POST',
          body: fd,
          headers: {
            'X-Requested-With': 'XMLHttpRequest'
          }
        });
        if (res.ok) {
          const data = await res.json();
          renderCart(data);
          openDrawer();
        }
      } catch (e) {
        console.error('Failed to add custom print to cart:', e);
      }
    },

    updateQty: async function (key, newQty) {
      try {
        const fd = new FormData();
        fd.append('key', key);
        fd.append('quantity', newQty);

        const res = await fetch('/cart/update', {
          method: 'POST',
          body: fd,
          headers: {
            'X-Requested-With': 'XMLHttpRequest'
          }
        });
        if (res.ok) {
          const data = await res.json();
          renderCart(data);
        }
      } catch (e) {
        console.error('Failed to update cart qty:', e);
      }
    },

    removeItem: async function (key) {
      try {
        const fd = new FormData();
        fd.append('key', key);

        const res = await fetch('/cart/remove', {
          method: 'POST',
          body: fd,
          headers: {
            'X-Requested-With': 'XMLHttpRequest'
          }
        });
        if (res.ok) {
          const data = await res.json();
          renderCart(data);
        }
      } catch (e) {
        console.error('Failed to remove item from cart:', e);
      }
    }
  };

  // Initial Fetch on DOM Ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', fetchCart);
  } else {
    fetchCart();
  }
})();
