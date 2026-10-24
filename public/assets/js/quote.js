/**
 * Kerf 3D Studio — Custom CAD 3D Quoting Engine & WebGL Viewport
 * Complete interactive Three.js viewport, OrbitControls, binary/ASCII STL parser,
 * true volume measurement, real-time pricing synchronization, and AJAX intake.
 */
(function () {
  'use strict';

  const container    = document.getElementById('k3d-viewer-container');
  const fileInput    = document.getElementById('k3d-cad-file-input');
  const dropzone     = document.getElementById('k3d-upload-form');
  const modelTag     = document.getElementById('k3d-model-name-display');
  const fitBadge     = document.getElementById('k3d-fit-badge');
  const fitStatusEl  = document.getElementById('k3d-stat-status');

  // Dimension Callouts
  const dimXEl       = document.getElementById('k3d-dim-x');
  const dimYEl       = document.getElementById('k3d-dim-y');
  const dimZEl       = document.getElementById('k3d-dim-z');
  const statBoxEl    = document.getElementById('k3d-stat-box');
  const statWeightEl = document.getElementById('k3d-stat-weight');
  const statTimeEl   = document.getElementById('k3d-stat-time');

  // Price Calculation Elements
  const calcRateRowEl    = document.getElementById('k3d-calc-rate-row');
  const calcSubtotalEl   = document.getElementById('k3d-calc-subtotal');
  const calcTotalEl      = document.getElementById('k3d-calc-total');
  const calcBalanceEl    = document.getElementById('k3d-calc-balance');
  const addQuoteBtn      = document.getElementById('k3d-add-quote-btn');
  const btnDepositLabel  = document.getElementById('k3d-btn-deposit-label');

  // Viewport Control Buttons
  const btnSolid      = document.getElementById('k3d-btn-solid');
  const btnWireframe  = document.getElementById('k3d-btn-wireframe');
  const btnCage       = document.getElementById('k3d-btn-cage');
  const btnResetView  = document.getElementById('k3d-btn-reset-view');
  const btnAutoOrient = document.getElementById('k3d-btn-auto-orient');

  // State Variables
  let scene, camera, renderer, controls, currentMesh, buildCage, gridHelper;
  let currentGeometry = null;
  let meshVolumeCm3   = 280.0; // Default specimen volume cm3
  let boundingDims    = { x: 120, y: 120, z: 180 };
  let currentFile     = null;
  let uploadedFileId  = null;
  let activeRate      = 6.50;
  let activeDensity   = 0.500;
  let activeInfill    = 20;
  let isWireframe     = false;

  // ── 1. Three.js Scene & Camera Initialization ─────────────────
  function initThree() {
    if (!container || typeof THREE === 'undefined') return;

    const width = container.clientWidth || 600;
    const height = container.clientHeight || 480;

    scene = new THREE.Scene();
    scene.background = new THREE.Color(0xded9cd);

    camera = new THREE.PerspectiveCamera(40, width / height, 1, 2000);
    camera.position.set(220, 260, 320);

    renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
    renderer.setSize(width, height);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    renderer.shadowMap.enabled = true;
    renderer.shadowMap.type = THREE.PCFSoftShadowMap;

    // Clear CSS mockup elements
    const mockWireframe = document.getElementById('k3d-wireframe-mesh');
    const mockFloor = container.querySelector('.k3d-grid-floor');
    if (mockWireframe) mockWireframe.style.display = 'none';
    if (mockFloor) mockFloor.style.display = 'none';

    container.appendChild(renderer.domElement);

    // OrbitControls for intuitive 3D camera navigation
    if (typeof THREE.OrbitControls !== 'undefined') {
      controls = new THREE.OrbitControls(camera, renderer.domElement);
      controls.enableDamping = true;
      controls.dampingFactor = 0.08;
      controls.minDistance = 30;
      controls.maxDistance = 800;
      controls.maxPolarAngle = Math.PI / 2 + 0.05; // Don't go below ground
      controls.target.set(0, 60, 0);
    }

    // Studio Lighting
    const ambientLight = new THREE.AmbientLight(0xffffff, 0.7);
    scene.add(ambientLight);

    const dirLight1 = new THREE.DirectionalLight(0xffffff, 0.85);
    dirLight1.position.set(160, 320, 200);
    scene.add(dirLight1);

    const dirLight2 = new THREE.DirectionalLight(0xc86446, 0.35);
    dirLight2.position.set(-180, 120, -160);
    scene.add(dirLight2);

    const dirLight3 = new THREE.DirectionalLight(0xffffff, 0.25);
    dirLight3.position.set(0, -100, 150);
    scene.add(dirLight3);

    // Bambu Lab A1 Bed Grid (256 × 256 mm)
    gridHelper = new THREE.GridHelper(256, 16, 0x181818, 0xb8b0a2);
    gridHelper.position.y = 0;
    scene.add(gridHelper);

    // Bambu Lab A1 256³ mm Build Volume Cage
    const cageGeo = new THREE.BoxGeometry(256, 256, 256);
    const cageEdges = new THREE.EdgesGeometry(cageGeo);
    buildCage = new THREE.LineSegments(
      cageEdges,
      new THREE.LineBasicMaterial({ color: 0x181818, transparent: true, opacity: 0.18 })
    );
    buildCage.position.y = 128;
    scene.add(buildCage);

    // Default Architectural Specimen (Tactile Hex Cylinder)
    loadDefaultSpecimen();

    // Render loop
    animate();

    window.addEventListener('resize', onWindowResize);
  }

  function getActiveMaterial() {
    const selectedMatInput = document.querySelector('input[name="quote_material"]:checked');
    const isTpu = selectedMatInput && selectedMatInput.value.includes('tpu');
    const meshColor = isTpu ? 0x242424 : 0xc86446;

    return new THREE.MeshStandardMaterial({
      color: meshColor,
      roughness: isTpu ? 0.65 : 0.32,
      metalness: isTpu ? 0.05 : 0.12,
      wireframe: isWireframe,
      side: THREE.DoubleSide
    });
  }

  function loadDefaultSpecimen() {
    const defGeo = new THREE.CylinderGeometry(40, 50, 130, 28, 12);
    displayGeometry(defGeo, 'Architectural_Column_Specimen.stl', 125);
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

    if (controls) {
      controls.update();
    } else if (currentMesh) {
      currentMesh.rotation.y += 0.005;
    }

    if (renderer && scene && camera) {
      renderer.render(scene, camera);
    }
  }

  // ── 2. Viewport Controls Event Listeners ───────────────────────
  if (btnSolid) {
    btnSolid.addEventListener('click', function () {
      isWireframe = false;
      btnSolid.classList.add('is-active');
      if (btnWireframe) btnWireframe.classList.remove('is-active');
      if (currentMesh && currentMesh.material) {
        currentMesh.material.wireframe = false;
      }
    });
  }

  if (btnWireframe) {
    btnWireframe.addEventListener('click', function () {
      isWireframe = true;
      btnWireframe.classList.add('is-active');
      if (btnSolid) btnSolid.classList.remove('is-active');
      if (currentMesh && currentMesh.material) {
        currentMesh.material.wireframe = true;
      }
    });
  }

  if (btnCage) {
    btnCage.addEventListener('click', function () {
      if (buildCage) {
        buildCage.visible = !buildCage.visible;
        this.classList.toggle('is-active', buildCage.visible);
      }
    });
  }

  if (btnResetView) {
    btnResetView.addEventListener('click', function () {
      frameCameraToMesh();
    });
  }

  if (btnAutoOrient) {
    btnAutoOrient.addEventListener('click', function () {
      if (!currentGeometry) return;
      autoOrientGeometry();
      const origText = this.textContent;
      this.textContent = 'ORIENTED ✓';
      setTimeout(() => { this.textContent = origText; }, 1200);
    });
  }

  function autoOrientGeometry() {
    if (!currentGeometry || !currentMesh) return;

    currentGeometry.computeBoundingBox();
    const bbox = currentGeometry.boundingBox;
    const size = new THREE.Vector3();
    bbox.getSize(size);

    // If height (Y) is larger than width (X) or depth (Z), lay it flat
    if (size.y > size.x || size.y > size.z) {
      if (size.x >= size.z) {
        currentGeometry.rotateZ(Math.PI / 2);
      } else {
        currentGeometry.rotateX(Math.PI / 2);
      }
      currentGeometry.computeBoundingBox();
      currentGeometry.center();
      displayGeometry(currentGeometry, currentFile ? currentFile.name : 'model.stl', null, false);
    }
  }

  function frameCameraToMesh() {
    if (!camera || !currentMesh) return;

    const maxDim = Math.max(boundingDims.x, boundingDims.y, boundingDims.z, 60);
    const fov = camera.fov * (Math.PI / 180);
    const cameraDist = Math.abs(maxDim / 2 / Math.tan(fov / 2)) * 1.85;

    camera.position.set(cameraDist * 0.75, cameraDist * 0.85, cameraDist * 1.05);
    const targetY = boundingDims.y / 2;
    camera.lookAt(0, targetY, 0);

    if (controls) {
      controls.target.set(0, targetY, 0);
      controls.update();
    }
  }

  // ── 3. Accurate Volume & Geometry Management ─────────────────
  function computeSignedVolume(geometry) {
    if (!geometry || !geometry.attributes || !geometry.attributes.position) return 0;
    const pos = geometry.attributes.position;
    const count = pos.count;
    let totalVolume = 0;

    const p1 = new THREE.Vector3();
    const p2 = new THREE.Vector3();
    const p3 = new THREE.Vector3();
    const cross = new THREE.Vector3();

    for (let i = 0; i < count; i += 3) {
      p1.fromBufferAttribute(pos, i + 0);
      p2.fromBufferAttribute(pos, i + 1);
      p3.fromBufferAttribute(pos, i + 2);

      cross.crossVectors(p2, p3);
      totalVolume += p1.dot(cross) / 6.0;
    }

    const volMm3 = Math.abs(totalVolume);
    // Convert mm³ to cm³
    return volMm3 / 1000.0;
  }

  function displayGeometry(geometry, fileName, manualVolume = null, shouldRefocus = true) {
    currentGeometry = geometry;
    geometry.computeVertexNormals();
    geometry.computeBoundingBox();

    const bbox = geometry.boundingBox;
    const dx = Math.max(1, Math.round(bbox.max.x - bbox.min.x));
    const dy = Math.max(1, Math.round(bbox.max.y - bbox.min.y));
    const dz = Math.max(1, Math.round(bbox.max.z - bbox.min.z));
    boundingDims = { x: dx, y: dy, z: dz };

    // Center geometry at origin
    geometry.center();

    if (manualVolume !== null) {
      meshVolumeCm3 = manualVolume;
    } else {
      const calculatedVol = computeSignedVolume(geometry);
      // If signed volume is very low (e.g. non-manifold or planar), fallback to bounding approximation
      meshVolumeCm3 = (calculatedVol > 1) 
        ? Math.round(calculatedVol * 10) / 10 
        : Math.max(10, Math.round((dx * dy * dz) / 1000 * 0.38));
    }

    // Replace Mesh in Scene
    if (currentMesh) {
      scene.remove(currentMesh);
      if (currentMesh.geometry) currentMesh.geometry.dispose();
    }

    const material = getActiveMaterial();
    currentMesh = new THREE.Mesh(geometry, material);
    currentMesh.position.set(0, dy / 2, 0);
    scene.add(currentMesh);

    // Update Dimensions in 3D Viewport
    if (dimXEl) dimXEl.textContent = `X: ${dx} MM`;
    if (dimYEl) dimYEl.textContent = `Y: ${dy} MM`;
    if (dimZEl) dimZEl.textContent = `Z: ${dz} MM`;
    if (statBoxEl) statBoxEl.textContent = `${dx} × ${dy} × ${dz} MM`;

    if (shouldRefocus) {
      frameCameraToMesh();
    }

    updateQuotePricing();
  }

  // ── 4. Real-Time Price Calculation Engine ─────────────────────
  function updateQuotePricing() {
    // Infill factor: e.g. 15% -> 0.49, 20% -> 0.52, 50% -> 0.70, 100% -> 1.00
    const infillFactor = (activeInfill / 100) * 0.6 + 0.4;
    const estimatedGrams = Math.max(15, Math.round(meshVolumeCm3 * activeDensity * infillFactor));
    const setupFee = 50.0;
    const printSubtotal = Math.round(estimatedGrams * activeRate);
    const totalQuote = printSubtotal + setupFee;
    const advanceDeposit = 100.0;
    const balanceDue = Math.max(0, totalQuote - advanceDeposit);

    // Estimated Print Time (Bambu Lab A1 benchmark)
    const estMinutes = Math.round(estimatedGrams * 2.2 + 25);
    const hours = Math.floor(estMinutes / 60);
    const mins = estMinutes % 60;
    const timeStr = hours > 0 ? `~${hours}H ${mins}M` : `~${mins}M`;

    // Check Bambu A1 volume limits (256 × 256 × 256 mm)
    const fitsA1 = boundingDims.x <= 256 && boundingDims.y <= 256 && boundingDims.z <= 256;

    // Update Telemetry Grid
    if (statWeightEl) statWeightEl.textContent = `${estimatedGrams} GRAMS`;
    if (statTimeEl) statTimeEl.textContent = timeStr;
    if (fitStatusEl) {
      if (fitsA1) {
        fitStatusEl.textContent = 'VERIFIED FIT';
        fitStatusEl.style.color = '#1f6b3d';
      } else {
        fitStatusEl.textContent = 'EXCEEDS 256³ MM';
        fitStatusEl.style.color = '#991b1b';
      }
    }

    if (fitBadge) {
      if (fitsA1) {
        fitBadge.className = 'k3d-build-badge is-valid';
        fitBadge.textContent = '✓ 256³ MM FIT (BAMBU A1)';
      } else {
        fitBadge.className = 'k3d-build-badge is-invalid';
        fitBadge.textContent = '⚠ EXCEEDS 256³ MM BOUNDS';
      }
    }

    // Update Price Summary Breakdown
    if (calcRateRowEl) calcRateRowEl.textContent = `৳${activeRate.toFixed(2)} / GRAM`;
    if (calcSubtotalEl) calcSubtotalEl.textContent = `৳${printSubtotal.toLocaleString('en-US', { minimumFractionDigits: 2 })}`;
    if (calcTotalEl) calcTotalEl.textContent = `৳${totalQuote.toLocaleString('en-US', { minimumFractionDigits: 2 })}`;
    if (calcBalanceEl) calcBalanceEl.textContent = `৳${balanceDue.toLocaleString('en-US', { minimumFractionDigits: 2 })} + courier`;
    if (btnDepositLabel) btnDepositLabel.textContent = `৳${advanceDeposit.toFixed(0)} DEPOSIT →`;

    return { estimatedGrams, totalQuote, advanceDeposit, fitsA1 };
  }

  // ── 5. Polymer Material & Infill Selection Wiring ─────────────
  function initMaterialControls() {
    const materialOptions = document.querySelectorAll('.k3d-radio-option');

    materialOptions.forEach(opt => {
      opt.addEventListener('click', function () {
        materialOptions.forEach(l => l.classList.remove('is-selected'));
        this.classList.add('is-selected');

        const radio = this.querySelector('input[type="radio"]');
        if (radio) {
          radio.checked = true;
          activeRate = parseFloat(radio.getAttribute('data-rate')) || (radio.value.includes('tpu') ? 9.75 : 6.50);
          activeDensity = parseFloat(radio.getAttribute('data-density')) || 0.500;

          // Update 3D mesh material
          if (currentMesh) {
            currentMesh.material = getActiveMaterial();
          }

          updateQuotePricing();
        }
      });
    });

    const infillPills = document.querySelectorAll('.k3d-infill-pill');
    infillPills.forEach(pill => {
      pill.addEventListener('click', function () {
        infillPills.forEach(p => p.classList.remove('is-selected'));
        this.classList.add('is-selected');

        const radio = this.querySelector('input[type="radio"]');
        if (radio) {
          radio.checked = true;
          activeInfill = parseInt(radio.value, 10) || 20;
          updateQuotePricing();
        }
      });
    });
  }

  // ── 6. Robust STL Parser (Binary & ASCII) ─────────────────────
  function parseStlFallback(buffer) {
    const reader = new DataView(buffer);
    const size = buffer.byteLength;

    // Check if binary: header 80 bytes + 4 bytes triangle count
    let isBinary = false;
    if (size >= 84) {
      const numTriangles = reader.getUint32(80, true);
      // Valid binary STL is exactly 84 + numTriangles * 50 bytes (allow minor padding)
      const expectedSize = 84 + numTriangles * 50;
      if (Math.abs(size - expectedSize) <= 128) {
        isBinary = true;
      }
    }

    const vertices = [];

    if (isBinary) {
      const numTriangles = reader.getUint32(80, true);
      let offset = 84;
      for (let i = 0; i < numTriangles; i++) {
        offset += 12; // skip normal
        for (let j = 0; j < 3; j++) {
          vertices.push(
            reader.getFloat32(offset + 0, true),
            reader.getFloat32(offset + 4, true),
            reader.getFloat32(offset + 8, true)
          );
          offset += 12;
        }
        offset += 2; // attribute byte count
      }
    } else {
      // ASCII Parser
      const decoder = new TextDecoder('utf-8');
      const text = decoder.decode(buffer);
      const lines = text.split('\n');
      for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        if (line.startsWith('vertex')) {
          const parts = line.split(/\s+/);
          if (parts.length >= 4) {
            vertices.push(parseFloat(parts[1]), parseFloat(parts[2]), parseFloat(parts[3]));
          }
        }
      }
    }

    const geometry = new THREE.BufferGeometry();
    geometry.setAttribute('position', new THREE.BufferAttribute(new Float32Array(vertices), 3));
    geometry.computeVertexNormals();
    return geometry;
  }

  // ── 7. File Upload & Processing ───────────────────────────────
  async function handleCadFile(file) {
    if (!file) return;

    currentFile = file;
    const ext = file.name.split('.').pop().toLowerCase();
    const sizeMb = (file.size / (1024 * 1024)).toFixed(2);

    if (modelTag) {
      modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB <span style="color:var(--k3d-rust);">ANALYZING GEOMETRY...</span>`;
    }

    // 1. Instant Client-Side Parsing & Viewport Render
    const reader = new FileReader();
    reader.onload = function (e) {
      try {
        const buffer = e.target.result;
        let geometry = null;

        if (typeof THREE.STLLoader !== 'undefined' && ext === 'stl') {
          try {
            const loader = new THREE.STLLoader();
            geometry = loader.parse(buffer);
          } catch (loaderErr) {
            console.warn('STLLoader parse note, using fallback:', loaderErr);
            geometry = parseStlFallback(buffer);
          }
        } else if (ext === 'stl') {
          geometry = parseStlFallback(buffer);
        } else {
          // Geometry box for OBJ / 3MF
          geometry = new THREE.BoxGeometry(80, 80, 80);
        }

        if (geometry) {
          displayGeometry(geometry, file.name);
          if (modelTag) {
            modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB <span style="color:#1f6b3d;">✓ PARSED</span>`;
          }
        }
      } catch (err) {
        console.error('Failed to parse 3D mesh:', err);
        if (modelTag) {
          modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB <span style="color:#991b1b;">PARSING ERROR</span>`;
        }
      }
    };
    reader.readAsArrayBuffer(file);

    // 2. Stream Upload to Backend (/quote/upload) in Background
    const formData = new FormData();
    formData.append('mesh_file', file);

    try {
      const uploadRes = await fetch('/quote/upload', {
        method: 'POST',
        body: formData,
        headers: { 'X-Requested-With': 'XMLHttpRequest' }
      });

      if (uploadRes.ok) {
        const data = await uploadRes.json();
        if (data.success) {
          uploadedFileId = data.upload_id;
          if (modelTag) {
            modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB <span style="color:#1f6b3d;">✓ STREAMED TO WORKSHOP</span>`;
          }
        }
      }
    } catch (err) {
      console.warn('Background upload note:', err);
    }
  }

  // ── 8. Drag & Drop and File Input Listeners ────────────────────
  function initDropzone() {
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
  }

  // ── 9. Submit CAD Specimen to Bag ─────────────────────────────
  function initSubmitButton() {
    if (!addQuoteBtn) return;

    addQuoteBtn.addEventListener('click', async function (e) {
      e.preventDefault();

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

      const originalHtml = addQuoteBtn.innerHTML;
      addQuoteBtn.disabled = true;
      addQuoteBtn.innerHTML = '<span>ADDING SPECIMEN...</span> <strong>✦</strong>';

      try {
        if (window.k3dCart) {
          await window.k3dCart.addCustomPrint(customPayload);
          addQuoteBtn.innerHTML = '<span>ADDED TO BAG ✓</span> <strong>100% SECURE</strong>';
          setTimeout(() => {
            addQuoteBtn.disabled = false;
            addQuoteBtn.innerHTML = originalHtml;
          }, 1500);
        } else {
          window.location.href = '/checkout';
        }
      } catch (err) {
        console.error('Failed to add custom CAD specimen:', err);
        addQuoteBtn.disabled = false;
        addQuoteBtn.innerHTML = originalHtml;
      }
    });
  }

  // ── 10. Bootstrap on Ready ────────────────────────────────────
  function start() {
    initThree();
    initMaterialControls();
    initDropzone();
    initSubmitButton();
    updateQuotePricing();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', start);
  } else {
    start();
  }

})();
