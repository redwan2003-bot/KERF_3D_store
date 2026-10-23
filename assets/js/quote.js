/**
 * Kerf 3D Studio — Custom CAD 3D Quoting Engine & WebGL Viewport
 * Includes Three.js build volume viewer, client-side STL parser, real-time volume pricing, and AJAX intake
 */
(function () {
  const container = document.getElementById('k3d-viewer-container');
  const fileInput = document.getElementById('k3d-cad-file-input');
  const dropzone  = document.getElementById('k3d-upload-form');
  const modelTag  = document.getElementById('k3d-model-name-display');
  const fitBadge  = document.getElementById('k3d-fit-badge');

  // Dimension Callouts
  const dimXEl = document.getElementById('k3d-dim-x');
  const dimYEl = document.getElementById('k3d-dim-y');
  const dimZEl = document.getElementById('k3d-dim-z');
  const statBoxEl = document.getElementById('k3d-stat-box');
  const statWeightEl = document.getElementById('k3d-stat-weight');
  const statTimeEl = document.getElementById('k3d-stat-time');

  // Price Calculation Elements
  const calcGramsEl = document.getElementById('k3d-calc-grams');
  const calcRateEl  = document.getElementById('k3d-calc-rate');
  const calcSubtotalEl = document.getElementById('k3d-calc-subtotal');
  const calcTotalEl = document.getElementById('k3d-calc-total');
  const calcBalanceEl = document.getElementById('k3d-calc-balance');
  const addQuoteBtn = document.getElementById('k3d-add-quote-btn');

  let currentMesh = null;
  let meshVolumeCm3 = 280.0; // Default specimen volume cm3
  let boundingDims = { x: 120, y: 120, z: 180 };
  let currentFile = null;
  let uploadedFileId = null;
  let activeRate = 6.50;
  let activeDensity = 0.500;
  let activeInfill = 20;

  // 1. Three.js Scene Setup
  let scene, camera, renderer, buildCage, gridHelper;

  function initThree() {
    if (!container || typeof THREE === 'undefined') return;

    const width = container.clientWidth || 600;
    const height = container.clientHeight || 480;

    scene = new THREE.Scene();
    scene.background = new THREE.Color(0xded9cd);

    camera = new THREE.PerspectiveCamera(40, width / height, 1, 1000);
    camera.position.set(220, 260, 320);
    camera.lookAt(0, 80, 0);

    renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    renderer.setSize(width, height);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

    // Remove CSS mockups once WebGL is active
    const mockWireframe = document.getElementById('k3d-wireframe-mesh');
    const mockFloor = container.querySelector('.k3d-grid-floor');
    if (mockWireframe) mockWireframe.style.display = 'none';
    if (mockFloor) mockFloor.style.display = 'none';

    container.appendChild(renderer.domElement);

    // Lighting
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.75);
    scene.add(ambientLight);

    const dirLight1 = new THREE.DirectionalLight(0xffffff, 0.85);
    dirLight1.position.set(150, 300, 200);
    scene.add(dirLight1);

    const dirLight2 = new THREE.DirectionalLight(0xc86446, 0.4);
    dirLight2.position.set(-150, 100, -150);
    scene.add(dirLight2);

    // Bambu Lab A1 Bed Grid (256 x 256 mm)
    gridHelper = new THREE.GridHelper(256, 16, 0x181818, 0xa19a8d);
    gridHelper.position.y = 0;
    scene.add(gridHelper);

    // Bambu Lab A1 256³ mm Build Volume Cage
    const cageGeo = new THREE.BoxGeometry(256, 256, 256);
    const cageMat = new THREE.MeshBasicMaterial({
      color: 0x181818,
      wireframe: true,
      transparent: true,
      opacity: 0.12,
    });
    buildCage = new THREE.Mesh(cageGeo, cageMat);
    buildCage.position.y = 128;
    scene.add(buildCage);

    // Default Architectural Specimen (Ribbed Column Geometry)
    const defGeo = new THREE.CylinderGeometry(40, 50, 140, 24, 12);
    const defMat = new THREE.MeshStandardMaterial({
      color: 0xc86446,
      roughness: 0.35,
      metalness: 0.1,
      wireframe: false,
    });
    currentMesh = new THREE.Mesh(defGeo, defMat);
    currentMesh.position.y = 70;
    scene.add(currentMesh);

    // Mouse drag interaction
    setupControls();

    // Render loop
    animate();

    window.addEventListener('resize', onWindowResize);
  }

  // Mouse drag momentum controls
  let isDragging = false;
  let prevMouseX = 0;
  let prevMouseY = 0;
  let targetAngleY = 0;
  let targetAngleX = 0;

  function setupControls() {
    container.addEventListener('mousedown', function (e) {
      isDragging = true;
      prevMouseX = e.clientX;
      prevMouseY = e.clientY;
    });

    window.addEventListener('mouseup', function () { isDragging = false; });

    window.addEventListener('mousemove', function (e) {
      if (!isDragging) return;
      const deltaX = e.clientX - prevMouseX;
      const deltaY = e.clientY - prevMouseY;
      targetAngleY += deltaX * 0.006;
      targetAngleX += deltaY * 0.006;
      prevMouseX = e.clientX;
      prevMouseY = e.clientY;
    });

    // Touch support
    container.addEventListener('touchstart', function (e) {
      if (e.touches.length === 1) {
        isDragging = true;
        prevMouseX = e.touches[0].clientX;
        prevMouseY = e.touches[0].clientY;
      }
    }, { passive: true });

    window.addEventListener('touchend', function () { isDragging = false; });

    window.addEventListener('touchmove', function (e) {
      if (!isDragging || e.touches.length !== 1) return;
      const deltaX = e.touches[0].clientX - prevMouseX;
      const deltaY = e.touches[0].clientY - prevMouseY;
      targetAngleY += deltaX * 0.008;
      targetAngleX += deltaY * 0.008;
      prevMouseX = e.touches[0].clientX;
      prevMouseY = e.touches[0].clientY;
    }, { passive: true });
  }

  function onWindowResize() {
    if (!renderer || !camera || !container) return;
    const width = container.clientWidth || 600;
    const height = container.clientHeight || 480;
    camera.aspect = width / height;
    camera.updateProjectionMatrix();
    renderer.setSize(width, height);
  }

  function animate() {
    requestAnimationFrame(animate);

    if (currentMesh) {
      currentMesh.rotation.y += (targetAngleY - currentMesh.rotation.y) * 0.08 + 0.002;
      currentMesh.rotation.x += (targetAngleX - currentMesh.rotation.x) * 0.08;
    }

    renderer.render(scene, camera);
  }

  // 2. Real-time Price Calculation Engine
  function updateQuotePricing() {
    // Infill multiplier
    const infillFactor = (activeInfill / 100) * 0.6 + 0.4;
    const estimatedGrams = Math.max(15, Math.round(meshVolumeCm3 * activeDensity * infillFactor));
    const setupFee = 50.0;
    const printSubtotal = Math.round(estimatedGrams * activeRate);
    const totalQuote = printSubtotal + setupFee;
    const advanceDeposit = 100.0;
    const balanceDue = totalQuote - advanceDeposit;

    // Estimate print hours
    const estMinutes = Math.round(estimatedGrams * 2.3 + 25);
    const hours = Math.floor(estMinutes / 60);
    const mins = estMinutes % 60;

    // Update DOM
    if (statWeightEl) statWeightEl.textContent = `${estimatedGrams} GRAMS`;
    if (statTimeEl) statTimeEl.textContent = `~${hours}H ${mins}M`;
    if (calcGramsEl) calcGramsEl.textContent = estimatedGrams;
    if (calcRateEl) calcRateEl.textContent = activeRate.toFixed(2);
    if (calcSubtotalEl) calcSubtotalEl.textContent = `৳${printSubtotal.toLocaleString()}`;
    if (calcTotalEl) calcTotalEl.textContent = `৳${totalQuote.toLocaleString()}`;
    if (calcBalanceEl) calcBalanceEl.textContent = `৳${balanceDue.toLocaleString()} + courier`;

    // Check Bambu A1 volume limits (256 x 256 x 256 mm)
    const fitsA1 = boundingDims.x <= 256 && boundingDims.y <= 256 && boundingDims.z <= 256;
    if (fitBadge) {
      if (fitsA1) {
        fitBadge.className = 'k3d-build-badge is-valid';
        fitBadge.textContent = '✓ 256³ MM FIT (BAMBU A1)';
      } else {
        fitBadge.className = 'k3d-build-badge is-invalid';
        fitBadge.textContent = '⚠ EXCEEDS 256³ MM BOUNDS';
      }
    }

    return { estimatedGrams, totalQuote, advanceDeposit, fitsA1 };
  }

  // Listen to Polymer Material Radios
  document.querySelectorAll('input[name="quote_material"]').forEach(radio => {
    radio.addEventListener('change', function () {
      document.querySelectorAll('.k3d-radio-option').forEach(l => l.classList.remove('is-selected'));
      this.closest('.k3d-radio-option').classList.add('is-selected');

      const internalRates = { 'pla': 6.50, 'tpu-95a': 9.75 };
      activeRate = internalRates[this.value] || 6.50;
      activeDensity = parseFloat(this.getAttribute('data-density')) || 0.500;

      // Update material color of 3D mesh
      if (currentMesh && currentMesh.material) {
        currentMesh.material.color.set(this.value === 'pla' ? 0xc86446 : 0x181818);
      }

      updateQuotePricing();
    });
  });

  // Listen to Infill Density Radios
  document.querySelectorAll('input[name="quote_infill"]').forEach(radio => {
    radio.addEventListener('change', function () {
      document.querySelectorAll('.k3d-infill-pills label').forEach(l => l.classList.remove('is-selected'));
      this.closest('label').classList.add('is-selected');

      activeInfill = parseInt(this.value, 10) || 20;
      updateQuotePricing();
    });
  });

  // 3. Simple Client-Side STL Parser & Mesh Loader
  function parseSTL(buffer) {
    const isBinary = (function () {
      if (buffer.byteLength < 84) return false;
      const reader = new DataView(buffer);
      const numTriangles = reader.getUint32(80, true);
      return buffer.byteLength === 84 + numTriangles * 50;
    })();

    const vertices = [];

    if (isBinary) {
      const reader = new DataView(buffer);
      const numTriangles = reader.getUint32(80, true);
      let offset = 84;
      for (let i = 0; i < numTriangles; i++) {
        offset += 12; // skip normal
        for (let j = 0; j < 3; j++) {
          vertices.push(
            reader.getFloat32(offset, true),
            reader.getFloat32(offset + 4, true),
            reader.getFloat32(offset + 8, true)
          );
          offset += 12;
        }
        offset += 2; // skip attribute byte count
      }
    } else {
      // ASCII STL parsing
      const text = new TextDecoder().decode(buffer);
      const vertexRegex = /vertex\s+([^\s]+)\s+([^\s]+)\s+([^\s]+)/g;
      let match;
      while ((match = vertexRegex.exec(text)) !== null) {
        vertices.push(parseFloat(match[1]), parseFloat(match[2]), parseFloat(match[3]));
      }
    }

    const geometry = new THREE.BufferGeometry();
    geometry.setAttribute('position', new THREE.BufferAttribute(new Float32Array(vertices), 3));
    geometry.computeVertexNormals();
    return geometry;
  }

  // Handle uploaded CAD file
  async function handleCadFile(file) {
    if (!file) return;

    currentFile = file;
    const ext = file.name.split('.').pop().toLowerCase();
    const sizeMb = (file.size / (1024 * 1024)).toFixed(2);

    if (modelTag) {
      modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB`;
    }

    // 1. Read binary for Three.js rendering
    const reader = new FileReader();
    reader.onload = function (e) {
      try {
        const buffer = e.target.result;
        let geometry;

        if (ext === 'stl') {
          geometry = parseSTL(buffer);
        } else {
          // Fallback box for OBJ/3MF before full parser
          geometry = new THREE.BoxGeometry(80, 80, 80);
        }

        if (geometry) {
          geometry.computeBoundingBox();
          const bbox = geometry.boundingBox;

          const dx = Math.round(bbox.max.x - bbox.min.x);
          const dy = Math.round(bbox.max.y - bbox.min.y);
          const dz = Math.round(bbox.max.z - bbox.min.z);
          boundingDims = { x: dx, y: dy, z: dz };

          // Estimate rough volume cm3
          meshVolumeCm3 = Math.max(30, Math.round((dx * dy * dz) / 1000 * 0.42));

          // Center geometry
          geometry.center();

          if (scene && currentMesh) {
            scene.remove(currentMesh);
            const material = new THREE.MeshStandardMaterial({
              color: activeRate > 7 ? 0x2e2a27 : 0xc86446,
              roughness: 0.35,
              metalness: 0.1,
            });
            currentMesh = new THREE.Mesh(geometry, material);
            currentMesh.position.y = dy / 2;
            scene.add(currentMesh);
          }

          // Update dimension callouts
          if (dimXEl) dimXEl.textContent = `X: ${dx} MM`;
          if (dimYEl) dimYEl.textContent = `Y: ${dy} MM`;
          if (dimZEl) dimZEl.textContent = `Z: ${dz} MM`;
          if (statBoxEl) statBoxEl.textContent = `${dx} × ${dy} × ${dz} MM`;

          updateQuotePricing();
        }
      } catch (err) {
        console.warn('Three.js STL parsing note:', err);
      }
    };
    reader.readAsArrayBuffer(file);

    // 2. Upload file to backend (/quote/upload)
    const formData = new FormData();
    formData.append('mesh_file', file);

    try {
      if (modelTag) modelTag.innerHTML += ' <em>(Uploading to Drive...)</em>';
      const uploadRes = await fetch('/quote/upload', {
        method: 'POST',
        body: formData,
      });

      if (uploadRes.ok) {
        const data = await uploadRes.json();
        if (data.success) {
          uploadedFileId = data.upload_id;
          if (modelTag) {
            modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB <span style="color:#1f6b3d;">✓ STREAMED</span>`;
          }
        }
      }
    } catch (err) {
      console.error('File intake error:', err);
    }
  }

  // Drag & Drop Listeners
  if (dropzone) {
    ['dragenter', 'dragover'].forEach(evt => {
      dropzone.addEventListener(evt, e => {
        e.preventDefault();
        dropzone.classList.add('is-drag-over');
      });
    });

    ['dragleave', 'drop'].forEach(evt => {
      dropzone.addEventListener(evt, e => {
        e.preventDefault();
        dropzone.classList.remove('is-drag-over');
      });
    });

    dropzone.addEventListener('drop', e => {
      const dt = e.dataTransfer;
      if (dt.files && dt.files.length > 0) {
        handleCadFile(dt.files[0]);
      }
    });
  }

  if (fileInput) {
    fileInput.addEventListener('change', function () {
      if (this.files && this.files.length > 0) {
        handleCadFile(this.files[0]);
      }
    });
  }

  // 4. Add Custom Print to Bag Button
  if (addQuoteBtn) {
    addQuoteBtn.addEventListener('click', function () {
      const pricing = updateQuotePricing();
      const materialSelected = document.querySelector('input[name="quote_material"]:checked')?.value || 'pla';
      const filename = currentFile ? currentFile.name : 'Custom_Architectural_Mesh.stl';

      const customPayload = {
        upload_id: uploadedFileId || 0,
        material: materialSelected,
        infill: activeInfill,
        grams: pricing.estimatedGrams,
        total_quote: pricing.totalQuote,
        advance_deposit: pricing.advanceDeposit,
        filename: filename,
      };

      if (window.k3dCart) {
        window.k3dCart.addCustomPrint(customPayload);
      } else {
        alert('Custom Print Specimen added to bag! Proceeding to checkout...');
        window.location.href = '/checkout';
      }
    });
  }

  // Initialize
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      initThree();
      updateQuotePricing();
    });
  } else {
    initThree();
    updateQuotePricing();
  }
})();
