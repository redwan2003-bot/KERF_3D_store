/**
 * Kerf 3D Studio — Custom CAD 3D Quoting Engine & WebGL Viewport
 * Complete interactive Three.js viewport, OrbitControls, binary/ASCII STL parser,
 * Bambu Studio 0.20mm Standard slicer fidelity, multi-angle orientation (45°, 90°, 180°, base snap),
 * and WhatsApp consultation order gate.
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
  const dimXEl        = document.getElementById('k3d-dim-x');
  const dimYEl        = document.getElementById('k3d-dim-y');
  const dimZEl        = document.getElementById('k3d-dim-z');
  const statBoxEl     = document.getElementById('k3d-stat-box');
  const statLayersEl  = document.getElementById('k3d-stat-layers');
  const statModelEl   = document.getElementById('k3d-stat-model');
  const statSupportEl = document.getElementById('k3d-stat-support');
  const statWeightEl  = document.getElementById('k3d-stat-weight');
  const statTimeEl    = document.getElementById('k3d-stat-time');
  const waConfirmBtn  = document.getElementById('k3d-wa-confirm-btn');

  // Price Calculation Elements
  const calcRateRowEl    = document.getElementById('k3d-calc-rate-row');
  const calcGramsLabelEl = document.getElementById('k3d-calc-grams-label');
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
  const btnOrient45   = document.getElementById('k3d-btn-orient-45');
  const btnOrient90   = document.getElementById('k3d-btn-orient-90');
  const btnOrient180  = document.getElementById('k3d-btn-orient-180');
  const btnAutoOrient = document.getElementById('k3d-btn-auto-orient');
  const btnCamIso     = document.getElementById('k3d-cam-iso');
  const btnCamTop     = document.getElementById('k3d-cam-top');
  const btnCamFront   = document.getElementById('k3d-cam-front');
  const btnClearMesh  = document.getElementById('k3d-btn-clear-mesh');

  // State Variables
  let scene, camera, renderer, controls, currentMesh, buildCage, gridHelper;
  let currentGeometry    = null;
  let meshVolumeCm3      = 280.0; // cm³
  let meshSurfaceAreaCm2 = 350.0; // cm²
  let boundingDims       = { x: 100, y: 130, z: 100 };
  let currentFile        = null;
  let uploadedFileId     = null;
  let activeRate         = 6.50;
  let activeDensity      = 1.240; // Raw PLA density g/cm³ (Bambu Studio PLA Basic)
  let activeInfill       = 20;
  let activeSupportPct   = 0;
  let activeSupportType  = 'none';
  let activeNozzle       = 0.4;
  let activeLayerHeight  = 0.20;
  let activeSpeedFactor  = 1.0;
  let activeWallCount    = 2;
  let isWireframe        = false;

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

    // Default Architectural Specimen
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
    displayGeometry(defGeo, 'Architectural_Column_Specimen.stl', true);
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

  // ── 2. Accurate Mathematical Volume & Surface Area Integration ──
  function computeSignedVolume(geometry) {
    if (!geometry || !geometry.attributes || !geometry.attributes.position) return 0;
    const pos = geometry.attributes.position;
    const hasIndex = geometry.index !== null;
    const index = hasIndex ? geometry.index : null;
    const numTriangles = hasIndex ? Math.floor(index.count / 3) : Math.floor(pos.count / 3);
    let totalVolume = 0;

    const p1 = new THREE.Vector3();
    const p2 = new THREE.Vector3();
    const p3 = new THREE.Vector3();
    const cross = new THREE.Vector3();

    for (let t = 0; t < numTriangles; t++) {
      const iA = hasIndex ? index.getX(t * 3 + 0) : t * 3 + 0;
      const iB = hasIndex ? index.getX(t * 3 + 1) : t * 3 + 1;
      const iC = hasIndex ? index.getX(t * 3 + 2) : t * 3 + 2;

      p1.fromBufferAttribute(pos, iA);
      p2.fromBufferAttribute(pos, iB);
      p3.fromBufferAttribute(pos, iC);

      cross.crossVectors(p2, p3);
      totalVolume += p1.dot(cross) / 6.0;
    }

    const volMm3 = Math.abs(totalVolume);
    return volMm3 / 1000.0; // cm³
  }

  function computeSurfaceArea(geometry) {
    if (!geometry || !geometry.attributes || !geometry.attributes.position) return 0;
    const pos = geometry.attributes.position;
    const hasIndex = geometry.index !== null;
    const index = hasIndex ? geometry.index : null;
    const numTriangles = hasIndex ? Math.floor(index.count / 3) : Math.floor(pos.count / 3);
    let totalArea = 0;

    const pA = new THREE.Vector3();
    const pB = new THREE.Vector3();
    const pC = new THREE.Vector3();
    const ab = new THREE.Vector3();
    const ac = new THREE.Vector3();
    const cross = new THREE.Vector3();

    for (let t = 0; t < numTriangles; t++) {
      const iA = hasIndex ? index.getX(t * 3 + 0) : t * 3 + 0;
      const iB = hasIndex ? index.getX(t * 3 + 1) : t * 3 + 1;
      const iC = hasIndex ? index.getX(t * 3 + 2) : t * 3 + 2;

      pA.fromBufferAttribute(pos, iA);
      pB.fromBufferAttribute(pos, iB);
      pC.fromBufferAttribute(pos, iC);

      ab.subVectors(pB, pA);
      ac.subVectors(pC, pA);
      cross.crossVectors(ab, ac);
      totalArea += cross.length() * 0.5;
    }

    return totalArea / 100.0; // cm²
  }

  // ── 3. Bed Alignment & Mesh Display ───────────────────────────
  function alignMeshToBed() {
    if (!currentMesh) return;

    currentMesh.updateMatrixWorld(true);
    const bbox = new THREE.Box3().setFromObject(currentMesh);
    const size = new THREE.Vector3();
    bbox.getSize(size);

    // Snap bottom of mesh cleanly to build plate (Y = 0)
    currentMesh.position.y -= bbox.min.y;
    currentMesh.position.x = 0;
    currentMesh.position.z = 0;

    const dx = Math.max(1, Math.round(size.x));
    const dy = Math.max(1, Math.round(size.y));
    const dz = Math.max(1, Math.round(size.z));
    boundingDims = { x: dx, y: dy, z: dz };

    // Update 3D viewport dimension indicators
    if (dimXEl) dimXEl.textContent = `X: ${dx} MM`;
    if (dimYEl) dimYEl.textContent = `Y: ${dy} MM`;
    if (dimZEl) dimZEl.textContent = `Z: ${dz} MM`;
    if (statBoxEl) statBoxEl.textContent = `${dx} × ${dy} × ${dz} MM`;

    updateQuotePricing();
  }

  function displayGeometry(geometry, fileName, shouldRefocus = true) {
    currentGeometry = geometry;
    geometry.computeVertexNormals();
    geometry.computeBoundingBox();

    // Center geometry around its centroid once
    geometry.center();

    // Calculate true signed volume & surface area
    const calculatedVol = computeSignedVolume(geometry);
    const calculatedArea = computeSurfaceArea(geometry);

    geometry.computeBoundingBox();
    const bbox = geometry.boundingBox;
    const dx = Math.max(1, Math.round(bbox.max.x - bbox.min.x));
    const dy = Math.max(1, Math.round(bbox.max.y - bbox.min.y));
    const dz = Math.max(1, Math.round(bbox.max.z - bbox.min.z));
    const boxVolCm3 = (dx * dy * dz) / 1000.0;

    // Watertight check: if signed volume is realistic compared to bounding volume
    meshVolumeCm3 = (calculatedVol >= boxVolCm3 * 0.15)
      ? Math.round(calculatedVol * 10) / 10
      : Math.max(15, Math.round(boxVolCm3 * 0.45 * 10) / 10);

    meshSurfaceAreaCm2 = (calculatedArea > 1)
      ? Math.round(calculatedArea * 10) / 10
      : Math.round(((dx * dy + dy * dz + dz * dx) * 2 / 100) * 10) / 10;

    // Replace Mesh in scene (without disposing active geometry!)
    if (currentMesh) {
      scene.remove(currentMesh);
    }

    const material = getActiveMaterial();
    currentMesh = new THREE.Mesh(geometry, material);
    currentMesh.rotation.set(0, 0, 0);
    scene.add(currentMesh);

    alignMeshToBed();

    if (shouldRefocus) {
      frameCameraToMesh();
    }

    const clearBtn = document.getElementById('k3d-btn-clear-mesh');
    if (clearBtn) {
      clearBtn.style.display = (fileName && fileName !== 'Architectural_Column_Specimen.stl') ? 'inline-block' : 'none';
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

  // ── 4. Multi-Angle Orientation & Base Snapping Engine ─────────
  function rotateMeshAngle(angleDeg, axisName = 'x') {
    if (!currentMesh) return;
    const rad = THREE.MathUtils.degToRad(angleDeg);
    if (axisName === 'x') {
      currentMesh.rotation.x += rad;
    } else if (axisName === 'y') {
      currentMesh.rotation.y += rad;
    } else {
      currentMesh.rotation.z += rad;
    }
    alignMeshToBed();
  }

  function autoOrientGeometry() {
    if (!currentGeometry || !currentMesh) return;

    const pos = currentGeometry.attributes.position;
    if (!pos || pos.count < 3) return;

    const pA = new THREE.Vector3();
    const pB = new THREE.Vector3();
    const pC = new THREE.Vector3();
    const cb = new THREE.Vector3();
    const ab = new THREE.Vector3();
    const normal = new THREE.Vector3();

    const clusters = [];
    const SIMILARITY_THRESHOLD = 0.985;

    const hasIndex = currentGeometry.index !== null;
    const index = hasIndex ? currentGeometry.index : null;
    const numTriangles = hasIndex ? Math.floor(index.count / 3) : Math.floor(pos.count / 3);

    for (let t = 0; t < numTriangles; t++) {
      const iA = hasIndex ? index.getX(t * 3 + 0) : t * 3 + 0;
      const iB = hasIndex ? index.getX(t * 3 + 1) : t * 3 + 1;
      const iC = hasIndex ? index.getX(t * 3 + 2) : t * 3 + 2;

      pA.fromBufferAttribute(pos, iA);
      pB.fromBufferAttribute(pos, iB);
      pC.fromBufferAttribute(pos, iC);

      cb.subVectors(pC, pB);
      ab.subVectors(pA, pB);
      cb.cross(ab);

      const area = cb.length() * 0.5;
      if (area < 0.0001) continue;

      normal.copy(cb).normalize();

      let matched = false;
      for (let c = 0; c < clusters.length; c++) {
        if (clusters[c].normal.dot(normal) > SIMILARITY_THRESHOLD) {
          clusters[c].area += area;
          clusters[c].normal.addScaledVector(normal, area / (clusters[c].area + area)).normalize();
          matched = true;
          break;
        }
      }

      if (!matched && clusters.length < 64) {
        clusters.push({ normal: normal.clone(), area: area });
      }
    }

    if (clusters.length === 0) return;

    clusters.sort((a, b) => b.area - a.area);
    let bestNormal = clusters[0].normal.clone();

    // Snap to cardinal axis if near-orthogonal
    const axes = [
      new THREE.Vector3(1, 0, 0),
      new THREE.Vector3(-1, 0, 0),
      new THREE.Vector3(0, 1, 0),
      new THREE.Vector3(0, -1, 0),
      new THREE.Vector3(0, 0, 1),
      new THREE.Vector3(0, 0, -1)
    ];
    for (const axis of axes) {
      if (bestNormal.dot(axis) > 0.90) {
        bestNormal.copy(axis);
        break;
      }
    }

    // Orient best normal to point straight down (0, -1, 0)
    const targetDown = new THREE.Vector3(0, -1, 0);
    const quat = new THREE.Quaternion().setFromUnitVectors(bestNormal, targetDown);
    currentMesh.quaternion.copy(quat);
    alignMeshToBed();
  }

  function pulseButton(btn, text) {
    if (!btn) return;
    const orig = btn.textContent;
    btn.textContent = text;
    btn.classList.add('is-active');
    setTimeout(() => {
      btn.textContent = orig;
      btn.classList.remove('is-active');
    }, 1100);
  }

  // ── 5. Viewport Control Button Listeners ───────────────────────
  function initViewerControls() {
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

    if (btnOrient45) {
      btnOrient45.addEventListener('click', function () {
        rotateMeshAngle(45, 'x');
        pulseButton(this, '45° ✓');
      });
    }

    if (btnOrient90) {
      btnOrient90.addEventListener('click', function () {
        rotateMeshAngle(90, 'x');
        pulseButton(this, '90° ✓');
      });
    }

    if (btnOrient180) {
      btnOrient180.addEventListener('click', function () {
        rotateMeshAngle(180, 'x');
        pulseButton(this, '180° ✓');
      });
    }

    if (btnAutoOrient) {
      btnAutoOrient.addEventListener('click', function () {
        autoOrientGeometry();
        pulseButton(this, 'BASE ✓');
      });
    }

    // Camera Viewport Presets
    function setCameraPreset(preset) {
      if (!camera) return;
      const maxDim = Math.max(boundingDims.x, boundingDims.y, boundingDims.z, 60);
      const fov = camera.fov * (Math.PI / 180);
      const cameraDist = Math.abs(maxDim / 2 / Math.tan(fov / 2)) * 1.85;
      const targetY = boundingDims.y / 2;

      if (preset === 'top') {
        camera.position.set(0, cameraDist * 1.6, 0.001);
        camera.lookAt(0, targetY, 0);
      } else if (preset === 'front') {
        camera.position.set(0, targetY, cameraDist * 1.5);
        camera.lookAt(0, targetY, 0);
      } else { // 'iso'
        camera.position.set(cameraDist * 0.75, cameraDist * 0.85, cameraDist * 1.05);
        camera.lookAt(0, targetY, 0);
      }

      if (controls) {
        controls.target.set(0, targetY, 0);
        controls.update();
      }

      if (btnCamIso) btnCamIso.classList.toggle('is-active', preset === 'iso');
      if (btnCamTop) btnCamTop.classList.toggle('is-active', preset === 'top');
      if (btnCamFront) btnCamFront.classList.toggle('is-active', preset === 'front');
    }

    if (btnCamIso) {
      btnCamIso.addEventListener('click', function () {
        setCameraPreset('iso');
      });
    }

    if (btnCamTop) {
      btnCamTop.addEventListener('click', function () {
        setCameraPreset('top');
      });
    }

    if (btnCamFront) {
      btnCamFront.addEventListener('click', function () {
        setCameraPreset('front');
      });
    }

    // Clear Mesh Action
    function clearMeshState() {
      if (currentMesh && scene) {
        scene.remove(currentMesh);
        if (currentMesh.geometry) currentMesh.geometry.dispose();
        currentMesh = null;
      }
      currentGeometry = null;
      currentFile = null;
      uploadedFileId = null;

      const fileInput = document.getElementById('k3d-cad-file-input');
      if (fileInput) fileInput.value = '';

      if (modelTag) {
        modelTag.innerHTML = '<strong>NO MODEL LOADED</strong> / 0.0 MB';
      }

      const fitBadge = document.getElementById('k3d-fit-badge');
      if (fitBadge) {
        fitBadge.textContent = 'AWAITING CAD FILE';
        fitBadge.className = 'k3d-build-badge is-valid';
      }

      const clearBtn = document.getElementById('k3d-btn-clear-mesh');
      if (clearBtn) clearBtn.style.display = 'none';

      loadDefaultSpecimen();
      if (typeof window.k3dToast === 'function') {
        window.k3dToast('CAD MESH UNLOADED');
      }
    }

    if (btnClearMesh) {
      btnClearMesh.addEventListener('click', function () {
        clearMeshState();
      });
    }
  }

  // ── 6. Bambu Studio Slicer Fidelity Pricing Engine ────────────
  function updateQuotePricing() {
    // 1. Sliced layers based on chosen nozzle & layer height
    const totalLayers = Math.max(1, Math.round(boundingDims.y / activeLayerHeight));

    // 2. Bambu Studio Physical Slicing Rules:
    // Solid shell: wall loops (2 walls = 0.085cm, 3 walls = 0.125cm, 4 walls = 0.165cm)
    const rawDensity = activeDensity; // 1.240 g/cm³ for PLA
    const shellThicknessCm = 0.085 + (activeWallCount - 2) * 0.040;
    const estShellVolCm3 = Math.min(meshVolumeCm3 * 0.75, Math.max(meshVolumeCm3 * 0.25, meshSurfaceAreaCm2 * shellThicknessCm));
    const infillVolCm3 = Math.max(0, meshVolumeCm3 - estShellVolCm3);
    const infillRatio = activeInfill / 100.0;

    // Shell is 100% dense plastic; infill core scales with Gyroid percentage
    const solidShellMass = estShellVolCm3 * rawDensity;
    const infillMass = infillVolCm3 * infillRatio * rawDensity;
    const modelGrams = Math.max(15, Math.round((solidShellMass + infillMass) * 10) / 10);

    // 3. Support filament calculation (matches Bambu Studio tree(auto) benchmark = +17.6%)
    let supportGrams = 0;
    if (activeSupportType === 'tree') {
      supportGrams = Math.round(modelGrams * 0.176 * 10) / 10;
    } else if (activeSupportType === 'standard') {
      supportGrams = Math.round(modelGrams * 0.280 * 10) / 10;
    }

    const totalGrams = Math.round((modelGrams + supportGrams) * 10) / 10;

    // 4. Bambu Studio Filament Length in meters (1.75mm PLA filament = ~3.03 g/m)
    const modelMeters = (modelGrams / 3.03).toFixed(1);
    const supportMeters = (supportGrams / 3.03).toFixed(1);
    const totalMeters = (totalGrams / 3.03).toFixed(1);

    // 5. Bambu Lab A1 Speed Benchmark (1.71 min/g * activeSpeedFactor + 17 min warmup & bed-leveling)
    const totalMinutes = Math.round(totalGrams * 1.71 * activeSpeedFactor + 17);
    const hours = Math.floor(totalMinutes / 60);
    const mins = totalMinutes % 60;
    const timeStr = hours > 0 ? `~${hours}H ${mins}M` : `~${mins}M`;

    // 6. Pricing Breakdown (NO SETUP FEE)
    const printSubtotal = Math.round(totalGrams * activeRate);
    const totalQuote = printSubtotal;
    const advanceDeposit = 100.0;
    const balanceDue = Math.max(0, totalQuote - advanceDeposit);

    // Check Bambu A1 volume limits (256 × 256 × 256 mm)
    const fitsA1 = boundingDims.x <= 256 && boundingDims.y <= 256 && boundingDims.z <= 256;

    // Tactical feedback flash
    [statWeightEl, statModelEl, statSupportEl, statTimeEl, calcSubtotalEl, calcTotalEl].forEach(el => {
      if (el) {
        el.classList.add('k3d-stat-flash');
        setTimeout(() => el.classList.remove('k3d-stat-flash'), 220);
      }
    });

    // Update Bambu Studio Slicing Telemetry Grid
    if (statBoxEl) statBoxEl.textContent = `${boundingDims.x} × ${boundingDims.y} × ${boundingDims.z} MM`;
    if (statLayersEl) statLayersEl.textContent = `${totalLayers} LAYERS @ ${activeLayerHeight.toFixed(2)}MM`;
    if (statModelEl) statModelEl.textContent = `${modelGrams.toFixed(1)} G (${modelMeters} M)`;
    if (statSupportEl) statSupportEl.textContent = `${supportGrams.toFixed(1)} G (${supportMeters} M)`;
    if (statWeightEl) statWeightEl.textContent = `${totalGrams.toFixed(1)} G (~${totalMeters} M)`;
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

    // Update Price Summary Breakdown (NO SETUP FEE)
    if (calcRateRowEl) calcRateRowEl.textContent = `৳${activeRate.toFixed(2)} / GRAM`;
    if (calcGramsLabelEl) calcGramsLabelEl.textContent = `${totalGrams.toFixed(0)}G`;
    if (calcSubtotalEl) calcSubtotalEl.textContent = `৳${printSubtotal.toLocaleString('en-US', { minimumFractionDigits: 2 })}`;
    if (calcTotalEl) calcTotalEl.textContent = `৳${totalQuote.toLocaleString('en-US', { minimumFractionDigits: 2 })}`;
    if (calcBalanceEl) calcBalanceEl.textContent = `৳${balanceDue.toLocaleString('en-US', { minimumFractionDigits: 2 })} + courier`;
    if (btnDepositLabel) btnDepositLabel.textContent = `+880 1754-550297 →`;

    // 7. Synchronize WhatsApp Pre-filled Technical Spec Intake
    if (waConfirmBtn) {
      const selectedMatInput = document.querySelector('input[name="quote_material"]:checked');
      const matName = selectedMatInput ? selectedMatInput.closest('label').querySelector('strong').textContent.trim() : 'PLA / RIGID BIOPOLYMER';
      const supportName = (activeSupportType === 'tree')
        ? 'Tree Supports (Auto) [+17.6%]'
        : (activeSupportType === 'standard' ? 'Linear Dense [+28%]' : 'No Supports (+0%)');
      const filename = currentFile ? currentFile.name : 'Custom_Architectural_Mesh.stl';

      const waMsg =
        `*Kerf 3D Studio — Custom CAD Quotation Intake*\n` +
        `------------------------------------------\n` +
        `📁 *Specimen:* ${filename}\n` +
        `📐 *Dimensions:* ${boundingDims.x} × ${boundingDims.y} × ${boundingDims.z} mm\n` +
        `📊 *Sliced Layers:* ${totalLayers} @ ${activeLayerHeight.toFixed(2)}mm (${activeNozzle}mm Nozzle, ${activeWallCount} Walls)\n` +
        `🧵 *Polymer:* ${matName}\n` +
        `🎛 *Infill:* ${activeInfill}% Gyroid\n` +
        `🌲 *Support:* ${supportName}\n` +
        `⚖️ *Model Mass:* ${modelGrams.toFixed(1)}g (${modelMeters}m)\n` +
        `🛠 *Support Mass:* ${supportGrams.toFixed(1)}g (${supportMeters}m)\n` +
        `📦 *Total Mass:* ${totalGrams.toFixed(1)}g (~${totalMeters}m filament)\n` +
        `⏱ *Est. Print Time:* ${timeStr} (Bambu Lab A1)\n` +
        `💰 *Specimen Estimate:* ৳${totalQuote.toLocaleString('en-US', { minimumFractionDigits: 2 })}\n` +
        `💳 *Mandatory Advance Deposit:* ৳100 (via bKash)\n` +
        (uploadedFileId ? `🆔 *Upload Intake ID:* #${uploadedFileId}\n` : '') +
        `------------------------------------------\n` +
        `Hi Kerf 3D, I would like to review this custom CAD specimen and confirm the slicing and production queue on WhatsApp.`;

      waConfirmBtn.href = `https://wa.me/8801754550297?text=${encodeURIComponent(waMsg)}`;
    }

    return { modelGrams, supportGrams, totalGrams, totalQuote, advanceDeposit, fitsA1 };
  }

  // ── 7. Polymer Material & Infill Selection Wiring ─────────────
  function initMaterialControls() {
    // 1. Polymer Material Radio & Card Selection
    const materialOptions = document.querySelectorAll('.k3d-radio-option');
    const materialRadios  = document.querySelectorAll('input[name="quote_material"]');

    function selectMaterial(radio) {
      if (!radio) return;
      radio.checked = true;
      materialOptions.forEach(opt => {
        const r = opt.querySelector('input[type="radio"]');
        opt.classList.toggle('is-selected', r && r.checked);
      });
      activeRate = parseFloat(radio.getAttribute('data-rate')) || (radio.value.includes('tpu') ? 9.75 : 6.50);
      activeDensity = parseFloat(radio.getAttribute('data-density')) || 1.240;

      if (currentMesh) {
        currentMesh.material = getActiveMaterial();
      }
      updateQuotePricing();
    }

    materialRadios.forEach(radio => {
      radio.addEventListener('change', function () {
        selectMaterial(this);
      });
    });

    materialOptions.forEach(opt => {
      opt.addEventListener('click', function () {
        const radio = this.querySelector('input[type="radio"]');
        if (radio) selectMaterial(radio);
      });
    });

    // 2. Infill Density Radio & Pill Selection (Bambu Studio Presets)
    const infillPills   = document.querySelectorAll('.k3d-infill-pill');
    const infillRadios  = document.querySelectorAll('input[name="quote_infill"]');

    function selectInfill(radioOrVal) {
      const val = typeof radioOrVal === 'object' ? parseInt(radioOrVal.value, 10) : parseInt(radioOrVal, 10);
      activeInfill = val || 20;

      infillRadios.forEach(r => {
        if (parseInt(r.value, 10) === activeInfill) {
          r.checked = true;
        }
      });

      infillPills.forEach(pill => {
        const r = pill.querySelector('input[type="radio"]');
        const pillVal = r ? parseInt(r.value, 10) : parseInt(pill.getAttribute('data-infill'), 10);
        pill.classList.toggle('is-selected', pillVal === activeInfill);
      });

      updateQuotePricing();
    }

    infillRadios.forEach(radio => {
      radio.addEventListener('change', function () {
        selectInfill(this);
      });
    });

    infillPills.forEach(pill => {
      pill.addEventListener('click', function () {
        const radio = this.querySelector('input[type="radio"]');
        const val = radio ? radio.value : this.getAttribute('data-infill');
        selectInfill(val);
      });
    });

    // 3. Support Structures Radio & Pill Selection
    const supportPills   = document.querySelectorAll('.k3d-support-pill');
    const supportRadios  = document.querySelectorAll('input[name="quote_support"]');

    function selectSupport(radioOrVal) {
      const val = typeof radioOrVal === 'object' ? radioOrVal.value : radioOrVal;
      activeSupportType = val || 'none';

      let foundPct = 0;
      supportRadios.forEach(r => {
        if (r.value === activeSupportType) {
          r.checked = true;
          foundPct = parseFloat(r.getAttribute('data-support-pct')) || 0;
        }
      });
      activeSupportPct = foundPct;

      supportPills.forEach(pill => {
        const r = pill.querySelector('input[type="radio"]');
        const pillVal = r ? r.value : pill.getAttribute('data-support');
        pill.classList.toggle('is-selected', pillVal === activeSupportType);
      });

      updateQuotePricing();
    }

    supportRadios.forEach(radio => {
      radio.addEventListener('change', function () {
        selectSupport(this);
      });
    });

    supportPills.forEach(pill => {
      pill.addEventListener('click', function () {
        const radio = this.querySelector('input[type="radio"]');
        const val = radio ? radio.value : this.getAttribute('data-support');
        selectSupport(val);
      });
    });

    // 4. Nozzle & Layer Profile Radio & Pill Selection
    const nozzlePills   = document.querySelectorAll('label[data-nozzle]');
    const nozzleRadios  = document.querySelectorAll('input[name="quote_nozzle"]');

    function selectNozzle(radioOrVal) {
      const val = typeof radioOrVal === 'object' ? radioOrVal.value : radioOrVal;
      activeNozzle = parseFloat(val) || 0.4;

      nozzleRadios.forEach(r => {
        if (parseFloat(r.value) === activeNozzle) {
          r.checked = true;
          activeLayerHeight = parseFloat(r.getAttribute('data-layer-height')) || 0.20;
          activeSpeedFactor = parseFloat(r.getAttribute('data-speed-factor')) || 1.0;
        }
      });

      nozzlePills.forEach(pill => {
        const pillVal = parseFloat(pill.getAttribute('data-nozzle'));
        pill.classList.toggle('is-selected', pillVal === activeNozzle);
      });

      updateQuotePricing();
    }

    nozzleRadios.forEach(radio => {
      radio.addEventListener('change', function () {
        selectNozzle(this);
      });
    });

    nozzlePills.forEach(pill => {
      pill.addEventListener('click', function () {
        const radio = this.querySelector('input[type="radio"]');
        const val = radio ? radio.value : this.getAttribute('data-nozzle');
        selectNozzle(val);
      });
    });

    // 5. Perimeter Walls Radio & Pill Selection
    const wallPills   = document.querySelectorAll('label[data-walls]');
    const wallRadios  = document.querySelectorAll('input[name="quote_walls"]');

    function selectWalls(radioOrVal) {
      const val = typeof radioOrVal === 'object' ? parseInt(radioOrVal.value, 10) : parseInt(radioOrVal, 10);
      activeWallCount = val || 2;

      wallRadios.forEach(r => {
        if (parseInt(r.value, 10) === activeWallCount) {
          r.checked = true;
        }
      });

      wallPills.forEach(pill => {
        const pillVal = parseInt(pill.getAttribute('data-walls'), 10);
        pill.classList.toggle('is-selected', pillVal === activeWallCount);
      });

      updateQuotePricing();
    }

    wallRadios.forEach(radio => {
      radio.addEventListener('change', function () {
        selectWalls(this);
      });
    });

    wallPills.forEach(pill => {
      pill.addEventListener('click', function () {
        const radio = this.querySelector('input[type="radio"]');
        const val = radio ? radio.value : this.getAttribute('data-walls');
        selectWalls(val);
      });
    });
  }

  // ── 8. Robust STL Parser (Binary & ASCII) ─────────────────────
  function parseStlFallback(buffer) {
    const reader = new DataView(buffer);
    const size = buffer.byteLength;

    let isBinary = false;
    if (size >= 84) {
      const numTriangles = reader.getUint32(80, true);
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

  // ── 9. File Upload & Processing ───────────────────────────────
  async function handleCadFile(file) {
    if (!file) return;

    currentFile = file;
    const ext = file.name.split('.').pop().toLowerCase();
    const sizeMb = (file.size / (1024 * 1024)).toFixed(2);

    if (modelTag) {
      modelTag.innerHTML = `<strong>${file.name}</strong> / ${sizeMb} MB <span style="color:var(--k3d-rust);">ANALYZING GEOMETRY...</span>`;
    }

    // Client-side parsing and rendering
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

    // Stream upload to backend in background
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
          // Refresh WhatsApp spec with Upload ID
          updateQuotePricing();
        }
      }
    } catch (err) {
      console.warn('Background upload note:', err);
    }
  }

  // ── 10. Drag & Drop and File Input Listeners ───────────────────
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

  // ── 11. WhatsApp Specimen Confirmation Wiring ─────────────────
  function initSubmitButton() {
    if (waConfirmBtn) {
      waConfirmBtn.addEventListener('click', function () {
        updateQuotePricing();
      });
    }

    if (addQuoteBtn) {
      addQuoteBtn.addEventListener('click', function (e) {
        e.preventDefault();
        if (waConfirmBtn && waConfirmBtn.href) {
          window.open(waConfirmBtn.href, '_blank');
        }
      });
    }
  }

  // ── 12. Bootstrap on Ready ────────────────────────────────────
  function start() {
    initThree();
    initViewerControls();
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
