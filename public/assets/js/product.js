/**
 * Kerf 3D Studio — Product Specimen Interactive Controller
 * Handles tactile variation swatch selection, gallery switcher, and AJAX add-to-cart
 */
(function () {
  const varButtons = document.querySelectorAll('.k3d-var-btn');
  const hiddenVarInput = document.getElementById('k3d-selected-var-id');
  const priceDisplay = document.querySelector('.k3d-product-price');
  const ctaPrice = document.getElementById('k3d-cta-price');
  const buyForm = document.querySelector('.k3d-buy-row');
  const addBtn = document.querySelector('.k3d-add-button');

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
    });
  });

  // 2. AJAX Add-to-Bag Submission
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
})();
