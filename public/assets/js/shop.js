/**
 * Kerf 3D Studio — Catalog Controller
 * Real-time instant keystroke search & Quick-Add to bag interaction
 */
(function () {
  'use strict';

  const searchInput  = document.getElementById('k3d-catalog-search');
  const clearBtn     = document.getElementById('k3d-search-clear');
  const visibleCount = document.getElementById('k3d-visible-count');
  const emptyState   = document.getElementById('k3d-search-empty');
  const emptyQuery   = document.getElementById('k3d-empty-query');
  const emptyReset   = document.getElementById('k3d-empty-clear-btn');
  const productCards = Array.from(document.querySelectorAll('.k3d-product-card'));
  const totalCount   = productCards.length;

  // ── 1. Real-Time Keystroke Catalog Filter ─────────────────────
  function filterCatalog() {
    if (!searchInput) return;

    const rawQuery = searchInput.value || '';
    const query = rawQuery.trim().toLowerCase();
    const tokens = query.split(/\s+/).filter(Boolean);

    let matchCount = 0;

    if (tokens.length === 0) {
      // Show all cards
      productCards.forEach(card => {
        card.style.display = '';
      });
      matchCount = totalCount;
      if (clearBtn) clearBtn.style.display = 'none';
      if (emptyState) emptyState.style.display = 'none';
    } else {
      if (clearBtn) clearBtn.style.display = 'inline-flex';

      productCards.forEach(card => {
        const name     = card.getAttribute('data-name') || '';
        const sku      = card.getAttribute('data-sku') || '';
        const category = card.getAttribute('data-category') || '';
        const haystack = `${name} ${sku} ${category}`;

        const isMatch = tokens.every(token => haystack.includes(token));

        if (isMatch) {
          card.style.display = '';
          matchCount++;
        } else {
          card.style.display = 'none';
        }
      });

      if (emptyState) {
        if (matchCount === 0) {
          emptyState.style.display = 'block';
          if (emptyQuery) emptyQuery.textContent = rawQuery.trim();
        } else {
          emptyState.style.display = 'none';
        }
      }
    }

    if (visibleCount) {
      visibleCount.textContent = matchCount;
    }
  }

  if (searchInput) {
    searchInput.addEventListener('input', filterCatalog);
    searchInput.addEventListener('keydown', function (e) {
      if (e.key === 'Escape') {
        searchInput.value = '';
        filterCatalog();
        searchInput.blur();
      }
    });
  }

  function resetSearch() {
    if (searchInput) {
      searchInput.value = '';
      filterCatalog();
      searchInput.focus();
    }
  }

  if (clearBtn) {
    clearBtn.addEventListener('click', resetSearch);
  }

  if (emptyReset) {
    emptyReset.addEventListener('click', resetSearch);
  }

  // ── 2. Quick Add To Bag Interaction ───────────────────────────
  document.addEventListener('click', async function (e) {
    const quickAddBtn = e.target.closest('.k3d-quick-add-btn');
    if (!quickAddBtn) return;

    e.preventDefault();
    e.stopPropagation();

    const productId = quickAddBtn.getAttribute('data-product-id');
    const labelEl   = quickAddBtn.querySelector('.k3d-quick-add-label');
    const originalText = labelEl ? labelEl.textContent : '+ QUICK ADD';

    if (quickAddBtn.disabled) return;

    quickAddBtn.disabled = true;
    quickAddBtn.classList.add('is-adding');
    if (labelEl) labelEl.textContent = 'ADDING...';

    try {
      if (window.k3dCart) {
        await window.k3dCart.addItem({
          product_id: productId,
          quantity: 1
        });

        quickAddBtn.classList.remove('is-adding');
        quickAddBtn.classList.add('is-added');
        if (labelEl) labelEl.textContent = 'ADDED ✓';

        setTimeout(() => {
          quickAddBtn.classList.remove('is-added');
          if (labelEl) labelEl.textContent = originalText;
          quickAddBtn.disabled = false;
        }, 1400);
      } else {
        // Fallback: direct form post
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = '/cart/add';
        const pInput = document.createElement('input');
        pInput.type = 'hidden';
        pInput.name = 'product_id';
        pInput.value = productId;
        form.appendChild(pInput);
        document.body.appendChild(form);
        form.submit();
      }
    } catch (err) {
      console.error('Quick add failed:', err);
      quickAddBtn.classList.remove('is-adding');
      quickAddBtn.classList.add('is-error');
      if (labelEl) labelEl.textContent = 'ERROR ✕';

      setTimeout(() => {
        quickAddBtn.classList.remove('is-error');
        if (labelEl) labelEl.textContent = originalText;
        quickAddBtn.disabled = false;
      }, 1500);
    }
  });

})();
