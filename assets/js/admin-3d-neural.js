/**
 * Kerf 3D Studio — Workshop Command Dashboard
 * Real-Time 3D Additive Lattice / Neural Brain Telemetry Visualizer
 */
(function () {
  const container = document.getElementById('k3d-3d-canvas-container');
  if (!container || typeof THREE === 'undefined') return;

  const width = container.clientWidth;
  const height = container.clientHeight || 420;

  // 1. Scene, Camera, Renderer
  const scene = new THREE.Scene();
  scene.fog = new THREE.FogExp2(0x0d0e11, 0.015);

  const camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 1000);
  camera.position.set(0, 5, 22);

  const renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true });
  renderer.setSize(width, height);
  renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  renderer.toneMapping = THREE.ACESFilmicToneMapping;
  renderer.toneMappingExposure = 1.2;
  container.appendChild(renderer.domElement);

  // 2. Lighting
  const ambientLight = new THREE.AmbientLight(0xffffff, 0.4);
  scene.add(ambientLight);

  const pointLight1 = new THREE.PointLight(0xc86446, 2.5, 50); // Terracotta rust
  pointLight1.position.set(10, 15, 10);
  scene.add(pointLight1);

  const pointLight2 = new THREE.PointLight(0x06b6d4, 1.8, 50); // Cyan
  pointLight2.position.set(-15, -10, -5);
  scene.add(pointLight2);

  const coreGlowLight = new THREE.PointLight(0x10b981, 1.5, 30); // Emerald
  scene.add(coreGlowLight);

  // 3. Central Additive Lattice / Neural Brain Geometry
  const coreGroup = new THREE.Group();
  scene.add(coreGroup);

  // Primary Geodesic Neural Lattice (Icosahedron Wireframe)
  const icoGeo = new THREE.IcosahedronGeometry(5.5, 2);
  const wireMat = new THREE.MeshBasicMaterial({
    color: 0x4a5568,
    wireframe: true,
    transparent: true,
    opacity: 0.35,
  });
  const wireMesh = new THREE.Mesh(icoGeo, wireMat);
  coreGroup.add(wireMesh);

  // Secondary Nested Gyroid Lattice (Octahedron Inner Core)
  const innerGeo = new THREE.OctahedronGeometry(3.6, 2);
  const innerMat = new THREE.MeshStandardMaterial({
    color: 0xc86446,
    roughness: 0.3,
    metalness: 0.8,
    wireframe: true,
    transparent: true,
    opacity: 0.65,
  });
  const innerMesh = new THREE.Mesh(innerGeo, innerMat);
  coreGroup.add(innerMesh);

  // Lattice Node Points (Glowing Neural Vertices)
  const nodePositions = icoGeo.attributes.position.array;
  const nodeGeo = new THREE.BufferGeometry();
  nodeGeo.setAttribute('position', new THREE.BufferAttribute(nodePositions, 3));
  const nodeMat = new THREE.PointsMaterial({
    color: 0x6ee7b7,
    size: 0.28,
    transparent: true,
    opacity: 0.9,
  });
  const nodePoints = new THREE.Points(nodeGeo, nodeMat);
  coreGroup.add(nodePoints);

  // 4. Orbital Telemetry Nodes
  const orbitalNodes = [];

  function createTelemetryNode(color, radius, speed, label, distance) {
    const group = new THREE.Group();

    // Glowing core sphere
    const sphereGeo = new THREE.SphereGeometry(radius, 16, 16);
    const sphereMat = new THREE.MeshStandardMaterial({
      color: color,
      emissive: color,
      emissiveIntensity: 0.8,
      roughness: 0.2,
      metalness: 0.5,
    });
    const sphere = new THREE.Mesh(sphereGeo, sphereMat);
    group.add(sphere);

    // Orbital ring
    const ringGeo = new THREE.TorusGeometry(radius * 1.8, 0.04, 8, 32);
    const ringMat = new THREE.MeshBasicMaterial({ color: color, wireframe: true, opacity: 0.4, transparent: true });
    const ring = new THREE.Mesh(ringGeo, ringMat);
    ring.rotation.x = Math.PI / 2;
    group.add(ring);

    // Laser connection line to center
    const lineMat = new THREE.LineBasicMaterial({ color: color, transparent: true, opacity: 0.25 });
    const lineGeo = new THREE.BufferGeometry().setFromPoints([new THREE.Vector3(0, 0, 0), new THREE.Vector3(distance, 0, 0)]);
    const line = new THREE.Line(lineGeo, lineMat);
    group.add(line);

    scene.add(group);
    orbitalNodes.push({ group, speed, distance, angle: Math.random() * Math.PI * 2, label });
    return group;
  }

  // Node 1: Bambu Lab A1 Active Print Node (Amber / Rust)
  createTelemetryNode(0xf59e0b, 0.65, 0.015, 'Bambu A1 Printhead', 9.2);

  // Node 2: Google Drive Media CDN Node (Emerald Green)
  createTelemetryNode(0x10b981, 0.55, -0.012, 'Drive Sync Gateway', 8.0);

  // Node 3: Intake / Order Transactions Node (Cyan)
  createTelemetryNode(0x06b6d4, 0.50, 0.018, 'MFS Intake Ledger', 10.5);

  // Node 4: Custom CAD Mesh Intake Node (Purple)
  createTelemetryNode(0xa855f7, 0.60, -0.009, 'Customer CAD Mesh', 11.8);

  // 5. Ambient Additive Filament Particles (Dust/Slicing Layer Cloud)
  const particleCount = 180;
  const particleGeo = new THREE.BufferGeometry();
  const particleCoords = new Float32Array(particleCount * 3);
  for (let i = 0; i < particleCount * 3; i += 3) {
    particleCoords[i] = (Math.random() - 0.5) * 30;
    particleCoords[i + 1] = (Math.random() - 0.5) * 20;
    particleCoords[i + 2] = (Math.random() - 0.5) * 30;
  }
  particleGeo.setAttribute('position', new THREE.BufferAttribute(particleCoords, 3));
  const particleMat = new THREE.PointsMaterial({
    color: 0x8b92a5,
    size: 0.12,
    transparent: true,
    opacity: 0.45,
  });
  const particleCloud = new THREE.Points(particleGeo, particleMat);
  scene.add(particleCloud);

  // 6. Interactive Mouse Drag & Momentum Controls
  let isDragging = false;
  let prevMouseX = 0;
  let prevMouseY = 0;
  let targetRotX = 0;
  let targetRotY = 0;

  container.addEventListener('mousedown', function (e) {
    isDragging = true;
    prevMouseX = e.clientX;
    prevMouseY = e.clientY;
  });

  window.addEventListener('mouseup', function () {
    isDragging = false;
  });

  window.addEventListener('mousemove', function (e) {
    if (!isDragging) return;
    const deltaX = e.clientX - prevMouseX;
    const deltaY = e.clientY - prevMouseY;
    targetRotY += deltaX * 0.005;
    targetRotX += deltaY * 0.005;
    prevMouseX = e.clientX;
    prevMouseY = e.clientY;
  });

  // Touch controls for mobile/tablet
  container.addEventListener('touchstart', function (e) {
    if (e.touches.length === 1) {
      isDragging = true;
      prevMouseX = e.touches[0].clientX;
      prevMouseY = e.touches[0].clientY;
    }
  }, { passive: true });

  window.addEventListener('touchend', function () {
    isDragging = false;
  });

  window.addEventListener('touchmove', function (e) {
    if (!isDragging || e.touches.length !== 1) return;
    const deltaX = e.touches[0].clientX - prevMouseX;
    const deltaY = e.touches[0].clientY - prevMouseY;
    targetRotY += deltaX * 0.007;
    targetRotX += deltaY * 0.007;
    prevMouseX = e.touches[0].clientX;
    prevMouseY = e.touches[0].clientY;
  }, { passive: true });

  // 7. Dynamic Telemetry Polling
  let activityFactor = 0.5;
  const hudElement = document.getElementById('k3d-telemetry-hud');

  async function pollTelemetry() {
    try {
      const res = await fetch('/admin/api/telemetry');
      if (res.ok) {
        const data = await res.json();
        activityFactor = data.activity_level || 0.5;

        if (hudElement) {
          hudElement.innerHTML = `
            <div><strong>CORE TELEMETRY:</strong> <span style="color:#10b981">ONLINE</span></div>
            <div>Bambu A1 Jobs: <strong>${data.printer.active_jobs} Active / ${data.printer.queued_jobs} Queued</strong></div>
            <div>Nozzle: <strong>${data.printer.nozzle_temp}&deg;C</strong> | Bed: <strong>${data.printer.bed_temp}&deg;C</strong></div>
            <div>Drive CDN: <strong style="color:#10b981">${data.drive_cdn.last_status.toUpperCase()}</strong></div>
            <div>CAD Intake: <strong>${data.cad_intake.total_files} Meshes</strong></div>
          `;
        }
      }
    } catch (e) {
      // Offline fallback
    }
  }

  pollTelemetry();
  setInterval(pollTelemetry, 6000);

  // 8. Animation Loop
  let clock = new THREE.Clock();

  function animate() {
    requestAnimationFrame(animate);

    const elapsedTime = clock.getElapsedTime();
    const speedMultiplier = 1.0 + activityFactor * 1.5;

    // Smooth camera / core rotation interpolation
    coreGroup.rotation.y += (targetRotY - coreGroup.rotation.y) * 0.08 + 0.003 * speedMultiplier;
    coreGroup.rotation.x += (targetRotX - coreGroup.rotation.x) * 0.08;

    innerMesh.rotation.y -= 0.006 * speedMultiplier;
    innerMesh.rotation.z += 0.004 * speedMultiplier;

    // Pulsing neural vertex glow
    const pulseScale = 1.0 + Math.sin(elapsedTime * (2.0 + activityFactor * 2.0)) * 0.06;
    wireMesh.scale.set(pulseScale, pulseScale, pulseScale);
    nodePoints.scale.set(pulseScale, pulseScale, pulseScale);

    // Orbiting nodes position update
    orbitalNodes.forEach(node => {
      node.angle += node.speed * speedMultiplier;
      node.group.position.x = Math.cos(node.angle) * node.distance;
      node.group.position.z = Math.sin(node.angle) * node.distance;
      node.group.position.y = Math.sin(elapsedTime * 1.5 + node.distance) * 1.8;
      node.group.rotation.y += 0.02;
    });

    // Slow ambient particle drift
    particleCloud.rotation.y += 0.0005;

    renderer.render(scene, camera);
  }

  animate();

  // 9. Resize Handling
  window.addEventListener('resize', function () {
    const newWidth = container.clientWidth;
    const newHeight = container.clientHeight || 420;
    camera.aspect = newWidth / newHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(newWidth, newHeight);
  });
})();
