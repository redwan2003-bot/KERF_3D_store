const fs = require('fs');
const http = require('http');
const path = require('path');

const ARTIFACT_DIR = 'C:\\Users\\Redwan Ahmmed\\.gemini\\antigravity\\brain\\48efa7c1-4697-40a6-aa7c-121bf1c91d84';

async function getWsUrl() {
  const json = await new Promise((resolve, reject) => {
    http.get('http://127.0.0.1:9222/json/list', (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(JSON.parse(data)));
    }).on('error', reject);
  });
  const page = json.find(t => t.type === 'page');
  if (!page) throw new Error('No page target found in Chrome DevTools');
  return page.webSocketDebuggerUrl;
}

async function run() {
  const wsUrl = await getWsUrl();
  const ws = new WebSocket(wsUrl);

  let id = 1;
  const callbacks = new Map();

  ws.onmessage = (event) => {
    const msg = JSON.parse(event.data);
    if (msg.id && callbacks.has(msg.id)) {
      callbacks.get(msg.id)(msg);
      callbacks.delete(msg.id);
    }
  };

  const send = (method, params = {}) => new Promise((resolve) => {
    const reqId = id++;
    callbacks.set(reqId, resolve);
    ws.send(JSON.stringify({ id: reqId, method, params }));
  });

  await new Promise(r => ws.onopen = r);
  await send('Page.enable');
  await send('DOM.enable');

  async function capturePage(options) {
    const { url, filename, actions, width = 1440, height = 900, fullPage = false } = options;
    console.log(`\nNavigating to ${url}...`);
    await send('Page.navigate', { url });
    await new Promise(r => setTimeout(r, 2200));

    if (actions) {
      await actions(send);
    }

    if (fullPage) {
      const heightRes = await send('Runtime.evaluate', {
        expression: 'Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)'
      });
      const scrollHeight = heightRes.result.result.value || 1200;
      await send('Emulation.setDeviceMetricsOverride', {
        width,
        height: Math.min(scrollHeight, 4000),
        deviceScaleFactor: 1,
        mobile: false
      });
    } else {
      await send('Emulation.setDeviceMetricsOverride', {
        width,
        height,
        deviceScaleFactor: 1,
        mobile: false
      });
    }

    await new Promise(r => setTimeout(r, 600));

    const shot = await send('Page.captureScreenshot', {
      format: 'png',
      captureBeyondViewport: fullPage
    });

    const targetPath = path.join(ARTIFACT_DIR, filename);
    fs.writeFileSync(targetPath, Buffer.from(shot.result.data, 'base64'));
    console.log(`Saved: ${targetPath} (${Math.round(shot.result.data.length * 0.75 / 1024)} KB)`);
  }

  // 1. Cart Drawer View (with Free Shipping Bar)
  await capturePage({
    url: 'http://localhost:8080/shop',
    filename: 'screen_01_cart_drawer.png',
    width: 1440,
    height: 960,
    actions: async (send) => {
      await send('Runtime.evaluate', {
        expression: `
          if (window.k3dCart) {
            window.k3dCart.open();
          } else {
            const drawer = document.getElementById('k3d-cart-drawer');
            if (drawer) drawer.classList.add('is-open');
          }
        `
      });
      await new Promise(r => setTimeout(r, 800));
    }
  });

  // 2. Catalog Archive (with Active Filter Chips)
  await capturePage({
    url: 'http://localhost:8080/shop',
    filename: 'screen_02_catalog_archive.png',
    width: 1440,
    height: 1000,
    actions: async (send) => {
      await send('Runtime.evaluate', {
        expression: `
          const input = document.getElementById('k3d-catalog-search');
          if (input) {
            input.value = 'lamp';
            input.dispatchEvent(new Event('input', { bubbles: true }));
          }
          const tpuCheck = document.querySelector('input[name="material[]"][value="TPU"]');
          if (tpuCheck) {
            tpuCheck.checked = true;
            tpuCheck.dispatchEvent(new Event('change', { bubbles: true }));
          }
        `
      });
      await new Promise(r => setTimeout(r, 600));
    }
  });

  // 2b. Catalog Zero Results State
  await capturePage({
    url: 'http://localhost:8080/shop',
    filename: 'screen_02b_catalog_empty_state.png',
    width: 1440,
    height: 900,
    actions: async (send) => {
      await send('Runtime.evaluate', {
        expression: `
          const input = document.getElementById('k3d-catalog-search');
          if (input) {
            input.value = 'titanium bracket x9';
            input.dispatchEvent(new Event('input', { bubbles: true }));
          }
        `
      });
      await new Promise(r => setTimeout(r, 600));
    }
  });

  // 3. Checkout Intake (with Order Notes & Lockout submit)
  await capturePage({
    url: 'http://localhost:8080/checkout',
    filename: 'screen_03_checkout_intake.png',
    width: 1440,
    height: 1100,
    actions: async (send) => {
      await send('Runtime.evaluate', {
        expression: `
          const notes = document.querySelector('textarea[name="order_notes"]');
          if (notes) {
            notes.value = 'Please leave package with gate security and notify via WhatsApp upon arrival.';
          }
        `
      });
      await new Promise(r => setTimeout(r, 400));
    }
  });

  // 4. Slicing Configurator (with Camera Presets & Clear Mesh)
  await capturePage({
    url: 'http://localhost:8080/quote',
    filename: 'screen_04_quote_configurator.png',
    width: 1440,
    height: 1050,
    actions: async (send) => {
      // Allow Three.js scene to render
      await new Promise(r => setTimeout(r, 1500));
    }
  });

  // 5. Post-Purchase Tracking (with Workshop Telemetry Ticker & SMS Button)
  await capturePage({
    url: 'http://localhost:8080/track?ticket=K3D-2F5C4',
    filename: 'screen_05_order_tracking.png',
    width: 1440,
    height: 950
  });

  // 6. Thermal Printable Receipt (with Tear-Line & Packaging Slip)
  await capturePage({
    url: 'http://localhost:8080/track/receipt/K3D-2F5C4',
    filename: 'screen_06_thermal_receipt.png',
    width: 1200,
    height: 1400,
    fullPage: true
  });

  console.log('\nAll modified pages captured successfully!');
  ws.close();
}

run().catch(err => {
  console.error('Error during capture:', err);
  process.exit(1);
});
