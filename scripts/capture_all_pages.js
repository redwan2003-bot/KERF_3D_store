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
    const { url, filename, actions, width = 1440, height = 900, waitMs = 2000, fullPage = false } = options;
    console.log(`Navigating to ${url}...`);
    await send('Page.navigate', { url });
    await new Promise(r => setTimeout(r, waitMs));

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
        height: Math.min(scrollHeight, 4500),
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
    console.log(`Saved: ${filename} (${Math.round(shot.result.data.length * 0.75 / 1024)} KB)`);
  }

  // 1. Homepage
  await capturePage({
    url: 'http://localhost:8080/',
    filename: 'site_preview_01_home.png',
    width: 1440,
    height: 1000
  });

  // 2. Catalog Archive / Shop
  await capturePage({
    url: 'http://localhost:8080/shop',
    filename: 'site_preview_02_shop.png',
    width: 1440,
    height: 1000
  });

  // 3. Product Detail Page
  await capturePage({
    url: 'http://localhost:8080/product/charlie-brown-airpods-pro-2nd-gen-case',
    filename: 'site_preview_03_product_detail.png',
    width: 1440,
    height: 980
  });

  // 4. Engineering Polymers & Materials Guide
  await capturePage({
    url: 'http://localhost:8080/materials',
    filename: 'site_preview_04_materials.png',
    width: 1440,
    height: 1050
  });

  // 5. Custom 3D Mesh Slicing Configurator
  await capturePage({
    url: 'http://localhost:8080/quote',
    filename: 'site_preview_05_slicer_quote.png',
    width: 1440,
    height: 1000,
    waitMs: 2500
  });

  // 6. Sliding Receipt Cart Drawer
  await capturePage({
    url: 'http://localhost:8080/shop',
    filename: 'site_preview_06_cart_drawer.png',
    width: 1440,
    height: 950,
    actions: async (send) => {
      await send('Runtime.evaluate', {
        expression: `if (window.k3dCart) { window.k3dCart.open(); }`
      });
      await new Promise(r => setTimeout(r, 600));
    }
  });

  // 7. Checkout Intake Ledger
  await capturePage({
    url: 'http://localhost:8080/checkout',
    filename: 'site_preview_07_checkout.png',
    width: 1440,
    height: 1100
  });

  // 8. Order Confirmed Page
  await capturePage({
    url: 'http://localhost:8080/order/confirmed/K3D-2F5C4',
    filename: 'site_preview_08_order_confirmed.png',
    width: 1440,
    height: 950
  });

  // 9. Post-Purchase Tracking
  await capturePage({
    url: 'http://localhost:8080/track?ticket=K3D-2F5C4',
    filename: 'site_preview_09_order_track.png',
    width: 1440,
    height: 1000
  });

  // 10. Thermal Printable Receipt & Packaging Slip
  await capturePage({
    url: 'http://localhost:8080/track/receipt/K3D-2F5C4',
    filename: 'site_preview_10_thermal_receipt.png',
    width: 1200,
    height: 1350,
    fullPage: true
  });

  // 11. Terms of Service
  await capturePage({
    url: 'http://localhost:8080/terms',
    filename: 'site_preview_11_terms.png',
    width: 1440,
    height: 950
  });

  // 12. Privacy Policy
  await capturePage({
    url: 'http://localhost:8080/privacy',
    filename: 'site_preview_12_privacy.png',
    width: 1440,
    height: 950
  });

  console.log('\nAll store pages captured successfully!');
  ws.close();
}

run().catch(err => {
  console.error('Error during capture:', err);
  process.exit(1);
});
