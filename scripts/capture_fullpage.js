const fs = require('fs');
const http = require('http');

async function main() {
  const json = await new Promise((resolve, reject) => {
    http.get('http://127.0.0.1:9222/json/list', (res) => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => resolve(JSON.parse(data)));
    }).on('error', reject);
  });

  const page = json.find(t => t.type === 'page');
  if (!page) {
    throw new Error('No page target found');
  }

  const ws = new WebSocket(page.webSocketDebuggerUrl);

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
  await send('Page.navigate', { url: 'http://localhost:8080/' });

  // Wait 2.5 seconds for complete rendering, fonts, and images
  await new Promise(r => setTimeout(r, 2500));

  const heightRes = await send('Runtime.evaluate', {
    expression: 'Math.max(document.body.scrollHeight, document.documentElement.scrollHeight)'
  });
  const scrollHeight = heightRes.result.result.value;
  console.log(`Document Scroll Height: ${scrollHeight}px`);

  // Set device metrics to match full scroll height
  await send('Emulation.setDeviceMetricsOverride', {
    width: 1440,
    height: scrollHeight,
    deviceScaleFactor: 1,
    mobile: false
  });

  const shot = await send('Page.captureScreenshot', {
    format: 'png',
    captureBeyondViewport: true
  });

  const dest = process.argv[2] || 'homepage_screenshot.png';
  fs.writeFileSync(dest, Buffer.from(shot.result.data, 'base64'));
  console.log(`Screenshot saved successfully to: ${dest}`);

  ws.close();
}

main().catch(err => {
  console.error(err);
  process.exit(1);
});
