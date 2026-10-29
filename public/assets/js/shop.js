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
  const activeFiltersBar = document.getElementById('k3d-active-filters');
  const filterChipsContainer = document.getElementById('k3d-filter-chips');
  const clearAllFiltersBtn = document.getElementById('k3d-clear-all-filters');
  const productCards = Array.from(document.querySelectorAll('.k3d-product-card'));
  const totalCount   = productCards.length;

  const materialChecks = Array.from(document.querySelectorAll('input[name="material[]"]'));
  const swatches       = Array.from(document.querySelectorAll('.k3d-swatches .swatch'));
  const elementalPills = Array.from(document.querySelectorAll('.k3d-elemental-pill'));
  let activeElement    = 'all';

  // ── SyuRo Elemental Polymer Filter ─────────────────────────────
  elementalPills.forEach(pill => {
    pill.addEventListener('click', function () {
      elementalPills.forEach(p => p.classList.remove('is-active'));
      this.classList.add('is-active');
      activeElement = this.getAttribute('data-element') || 'all';
      filterCatalog();
    });
  });

  // ── Active Filter Chips Controller ────────────────────────────
  function updateActiveChips(rawQuery, selectedMats, currentElement) {
    if (!activeFiltersBar || !filterChipsContainer) return;

    const chips = [];

    if (rawQuery.trim()) {
      chips.push({
        label: `SEARCH: "${rawQuery.trim()}"`,
        type: 'query'
      });
    }

    selectedMats.forEach(m => {
      chips.push({
        label: `POLYMER: ${m.toUpperCase()}`,
        type: 'material',
        value: m
      });
    });

    if (currentElement !== 'all') {
      chips.push({
        label: `ELEMENT: ${currentElement.toUpperCase()}`,
        type: 'element',
        value: currentElement
      });
    }

    if (chips.length === 0) {
      activeFiltersBar.style.display = 'none';
      filterChipsContainer.innerHTML = '';
      return;
    }

    activeFiltersBar.style.display = 'flex';
    filterChipsContainer.innerHTML = chips.map((c, i) => `
      <span class="k3d-filter-chip">
        ${c.label}
        <button type="button" data-chip-index="${i}" aria-label="Remove filter">&times;</button>
      </span>
    `).join('');

    filterChipsContainer.querySelectorAll('button').forEach(btn => {
      btn.addEventListener('click', function () {
        const idx = parseInt(this.getAttribute('data-chip-index'), 10);
        const chip = chips[idx];
        if (!chip) return;

        if (chip.type === 'query') {
          if (searchInput) searchInput.value = '';
        } else if (chip.type === 'material') {
          materialChecks.forEach(cb => {
            if (cb.value.toLowerCase() === chip.value.toLowerCase()) cb.checked = false;
          });
        } else if (chip.type === 'element') {
          activeElement = 'all';
          elementalPills.forEach(p => {
            if (p.getAttribute('data-element') === 'all') p.classList.add('is-active');
            else p.classList.remove('is-active');
          });
        }
        filterCatalog();
      });
    });
  }

  // ── 1. Real-Time Keystroke & Facet Catalog Filter ──────────────
  function filterCatalog() {
    const rawQuery = (searchInput ? searchInput.value : '') || '';
    const query = rawQuery.trim().toLowerCase();
    const tokens = query.split(/\s+/).filter(Boolean);

    const selectedMats = materialChecks
      .filter(cb => cb.checked)
      .map(cb => cb.value.toLowerCase());

    updateActiveChips(rawQuery, selectedMats, activeElement);

    let matchCount = 0;

    const noFilters = tokens.length === 0 && selectedMats.length === 0 && activeElement === 'all';

    if (noFilters) {
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
        const tags     = card.getAttribute('data-tags') || '';
        const mat      = card.getAttribute('data-material') || 'pla';
        const haystack = `${name} ${sku} ${category} ${tags} ${mat}`;

        const matchesTokens = tokens.length === 0 || tokens.every(token => haystack.includes(token));
        const matchesMaterial = selectedMats.length === 0 || selectedMats.some(m => haystack.includes(m) || mat === m);
        const matchesElement = activeElement === 'all' || mat === activeElement || haystack.includes(activeElement);

        if (matchesTokens && matchesMaterial && matchesElement) {
          card.style.display = '';
          matchCount++;
        } else {
          card.style.display = 'none';
        }
      });

      if (emptyState) {
        if (matchCount === 0) {
          emptyState.style.display = 'block';
          if (emptyQuery) emptyQuery.textContent = rawQuery.trim() || selectedMats.join(', ') || activeElement;
        } else {
          emptyState.style.display = 'none';
        }
      }
    }

    if (visibleCount) {
      visibleCount.textContent = matchCount;
    }
  }

  // Bind Material Checkboxes
  materialChecks.forEach(cb => {
    cb.addEventListener('change', filterCatalog);
  });

  // Bind Shade Swatches
  swatches.forEach(sw => {
    sw.addEventListener('click', function () {
      const shadeName = (this.getAttribute('aria-label') || '').toLowerCase();
      if (searchInput && shadeName) {
        searchInput.value = shadeName;
        filterCatalog();
        searchInput.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
      }
    });
  });

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
    if (searchInput) searchInput.value = '';
    materialChecks.forEach(cb => { cb.checked = false; });
    activeElement = 'all';
    elementalPills.forEach(p => {
      if (p.getAttribute('data-element') === 'all') p.classList.add('is-active');
      else p.classList.remove('is-active');
    });
    filterCatalog();
    if (searchInput) searchInput.focus();
  }

  if (clearBtn) {
    clearBtn.addEventListener('click', resetSearch);
  }

  if (emptyReset) {
    emptyReset.addEventListener('click', resetSearch);
  }

  if (clearAllFiltersBtn) {
    clearAllFiltersBtn.addEventListener('click', resetSearch);
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
