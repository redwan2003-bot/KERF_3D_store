/**
 * Kerf 3D Studio — Product Specimen Interactive Controller
 * Handles tactile variation swatch selection, gallery switcher, AJAX add-to-cart,
 * and Sticky Mobile Action Bar
 */
(function () {
  'use strict';

  const varButtons = document.querySelectorAll('.k3d-var-btn');
  const hiddenVarInput = document.getElementById('k3d-selected-var-id');
  const priceDisplay = document.querySelector('.k3d-product-price');
  const ctaPrice = document.getElementById('k3d-cta-price');
  const buyForm = document.querySelector('.k3d-buy-row');
  const addBtn = document.querySelector('.k3d-add-button');
  const stickyBar = document.getElementById('k3d-sticky-mobile-bar');
  const stickyAddBtn = document.getElementById('k3d-sticky-add-btn');
  const stickyPriceDisplay = document.getElementById('k3d-sticky-price-display');

  // 1. Tactile Swatch Selection
  varButtons.forEach(btn => {
    btn.addEventListener('click', function () {
      varButtons.forEach(b => b.classList.remove('is-selected'));
      this.classList.add('is-selected');

      const varId = this.getAttribute('data-variation-id');
      const price = parseFloat(this.getAttribute('data-price'));

      if (hiddenVarInput) hiddenVarInput.value = varId;

      const formattedPrice = `৳${price.toLocaleString('en-US', { minimumFractionDigits: 2 })}`;

      if (priceDisplay) {
        priceDisplay.innerHTML = `${formattedPrice} <small>BDT / READY-MADE</small>`;
      }

      if (ctaPrice) {
        ctaPrice.textContent = `${formattedPrice} →`;
      }

      if (stickyPriceDisplay) {
        stickyPriceDisplay.textContent = formattedPrice;
      }
    });
  });

  // 2. AJAX Add-to-Bag Submission (Main Button)
  if (buyForm) {
    buyForm.addEventListener('submit', async function (e) {
      e.preventDefault();

      if (!window.k3dCart) {
        buyForm.submit();
        return;
      }

      const originalText = addBtn ? addBtn.innerHTML : '';
      if (addBtn) {
        addBtn.disabled = true;
        addBtn.innerHTML = 'ADDING ARTIFACT... <span>✦</span>';
      }

      try {
        const formData = new FormData(buyForm);
        await window.k3dCart.addItem(formData);
      } catch (err) {
        console.error('Failed to add to bag:', err);
      } finally {
        if (addBtn) {
          addBtn.disabled = false;
          addBtn.innerHTML = originalText;
        }
      }
    });
  }

  // 3. Sticky Mobile Action Bar (Scroll Detection & Instant Add)
  if (stickyBar && buyForm) {
    function checkSticky() {
      const rect = buyForm.getBoundingClientRect();
      if (rect.bottom < 0) {
        stickyBar.classList.add('is-visible');
      } else {
        stickyBar.classList.remove('is-visible');
      }
    }

    window.addEventListener('scroll', checkSticky, { passive: true });
    window.addEventListener('resize', checkSticky, { passive: true });
    checkSticky();

    if (stickyAddBtn) {
      stickyAddBtn.addEventListener('click', async function (e) {
        e.preventDefault();
        const qtyInput = document.getElementById('k3d-quantity');
        const varInput = document.getElementById('k3d-selected-var-id');
        const prodInput = buyForm.querySelector('input[name="product_id"]');

        const originalText = stickyAddBtn.innerHTML;
        stickyAddBtn.disabled = true;
        stickyAddBtn.innerHTML = '<span>ADDING... ✦</span>';

        try {
          if (window.k3dCart) {
            const fd = new FormData();
            if (prodInput) fd.append('product_id', prodInput.value);
            if (varInput && varInput.value) fd.append('variation_id', varInput.value);
            fd.append('quantity', qtyInput ? qtyInput.value : 1);

            await window.k3dCart.addItem(fd);
            stickyAddBtn.innerHTML = '<span>ADDED ✓</span>';
            setTimeout(() => {
              stickyAddBtn.disabled = false;
              stickyAddBtn.innerHTML = originalText;
            }, 1400);
          } else {
            buyForm.submit();
          }
        } catch (err) {
          console.error('Sticky add error:', err);
          stickyAddBtn.disabled = false;
          stickyAddBtn.innerHTML = originalText;
        }
      });
    }
  }
})();
