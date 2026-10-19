# Kerf 3D — Claude Code Project Instructions

## Project identity

Kerf 3D is a Dhaka, Bangladesh-based 3D-printing studio and ecommerce store.

- Brand: `Kerf 3D`
- Domain: `kerf3d.store`
- Currency: Bangladeshi Taka, displayed as `৳`
- Primary engines:
  1. Ready-made catalog artifacts with material and filament-color variations.
  2. Custom on-demand printing from customer-uploaded `.STL`, `.OBJ`, and `.3MF` files.
- CMS target: WordPress 6.x + WooCommerce.
- Theme: Blocksy, Gutenberg-native.
- Primary printer: Bambu Lab A1.
- Business location: Dhaka, Bangladesh.

### Full planned stack

- Hosting/web server: OpenLiteSpeed in Docker.
- OLS container: `3dprint_ols`.
- Ports: HTTP `8080`, HTTPS/QUIC `8443`, WebAdmin `7080`.
- Database: MariaDB `10.11` on Docker bridge network `ols_network`.
- PHP target: LSPHP `8.3` with 128 MB upload/post limits.
- CMS: WordPress `6.x`.
- Ecommerce: WooCommerce.
- Theme: Blocksy + Blocksy child theme.
- Editor: Gutenberg.
- 3D quote engine: Birlo 3D Print Lite for WooCommerce.
- 3D viewer: Three.js through the quote engine.
- Product variations: WooCommerce Variation Swatches.
- Payments: Deshi Pay/bKash-compatible manual TrxID flow, with Nagad/Rocket support if enabled, plus COD.
- Cache: LiteSpeed Cache.
- Email: FluentSMTP.
- Backups: UpdraftPlus.
- Courier target: Steadfast/Pathao workflow; API integration is pending.
- Fonts: Syne, Plus Jakarta Sans, Space Mono.

Cost constraint: prefer free/core plugins and manual workflows at launch. Do not introduce a paid plugin or SaaS service without documenting its recurring cost, limits, privacy implications, and the business bottleneck it solves. See `docs/cost-optimized-stack.md`.

This project is a WordPress/WooCommerce implementation. Do not replace the target with Shopify, a page builder, or a generic ecommerce theme.

## Source-of-truth hierarchy

When information conflicts, use this order:

1. The latest explicit user instruction.
2. This file and `PROJECT_DOCUMENTATION.md`.
3. The supplied master prompt at `C:\Users\reahs\Downloads\kerf3d_store_master_prompt.md`.
4. Other reference files.

Files under the project `sources/` directory are read-only reference material. Do not edit, rename, move, or delete them.

The supplied logo is a brand asset, not an instruction file:

`C:\Users\reahs\Downloads\Kerf Logo-02 (1).svg`

Preserve the original logo artwork and native color `#4A321F` unless the owner explicitly requests a variation.

## Current implementation status

The `kerf3d-build/` directory contains portable Gutenberg markup and CSS artifacts. They are not yet connected to a live WordPress installation.

Completed artifacts:

- `homepage-gutenberg.html` / `homepage.css`
- `shop-gutenberg.html` / `shop.css`
- `product-gutenberg.html` / `product.css`
- `cart-drawer.html` / `cart-drawer.css`
- `checkout-gutenberg.html` / `checkout.css`
- `order-confirmation-gutenberg.html` / `order-confirmation.css`
- `materials-gutenberg.html` / `materials.css`
- `global-tokens.css`
- `blocksy-settings.md`
- `woocommerce-config.md`

These files are visual/structural foundations. Dynamic WooCommerce, Birlo, payments, uploads, and courier integration remain to be wired into a real staging installation.

Do not claim that the live store has been configured unless a real WordPress/WooCommerce environment has been provided and verified.

## Confirmed business rules

### Pricing

- PLA: `৳6.50 / gram`.
- PLA effective density for quoting: `0.50 g/cm³`.
- TPU 95A: `৳9.75 / gram`.
- TPU 95A effective density for quoting: `0.48 g/cm³`.
- Custom model base/setup fee: `৳50` per model upload.
- Custom-order advance deposit: mandatory `৳100` via bKash.

The conceptual custom quote formula is:

```text
print subtotal = estimated grams × material rate
custom model total = print subtotal + ৳50 setup fee
amount due now = ৳100 advance deposit for custom STL orders
remaining balance = custom model total + shipping − amount already paid
```

Never silently treat the deposit as the full order total. Display the deposit and remaining balance distinctly.

### Shipping

- Inside Dhaka: `৳70`, expected delivery `24–48 hours`.
- Outside Dhaka: `৳130`, expected delivery `2–4 days` via Steadfast/Pathao.

WooCommerce zones must be ordered from most specific to broadest because WooCommerce matches the first applicable zone.

### Custom uploads

- Accepted formats: `.STL`, `.OBJ`, `.3MF`.
- Maximum upload size: `128 MB`.
- Validate file type and size in the browser, server, web server, and Birlo/plugin layer.
- Never trust client-side validation alone.

## Bambu Lab A1 source of truth

The printer is a Bambu Lab A1, not a generic CoreXY machine. Do not describe it as CoreXY.

Verified A1 specifications:

- Printing technology: FDM.
- Build volume: `256 × 256 × 256 mm`.
- Chassis: steel + extruded aluminum.
- Hot end: all-metal.
- Included nozzle: `0.4 mm` stainless steel.
- Optional nozzle sizes: `0.2`, `0.6`, and `0.8 mm`.
- Maximum hot-end temperature: `300 °C`.
- Maximum build-plate temperature: `100 °C`.
- Maximum toolhead speed: `500 mm/s`.
- Maximum acceleration: `10,000 mm/s²`.
- Ideal filaments: PLA, PETG, TPU, and PVA.
- Not recommended: ABS, ASA, PC, PA, PET, and carbon/glass-fiber-reinforced polymers.
- Monitoring: low-rate camera up to 1080p, timelapse support.
- Sensors: filament runout, filament odometry, filament tangle, and power-loss recovery.
- Machine footprint: approximately `385 × 410 × 430 mm`.
- Net weight: approximately `8.3 kg`.

Official reference: https://bambulab.com/pl/a1/tech-specs

Do not promise engineering performance, tolerances, or heat resistance beyond the selected material and actual geometry. State that quoted tolerances are practical production targets and depend on orientation, slicing, geometry, and fit.

## Design system

The visual identity is “industrial archival / technical editorial craft.” It combines CAD language, workshop documentation, specimen sheets, and physical receipts.

### Colors

```text
Canvas       #F8F6F0  warm archival parchment
Surface      #FFFFFF  clean white
Ink          #181818  deep charcoal
Secondary    #2E2A27  dark ash brown
Meta         #766E65  warm stone grey
Border       #E5E0D8  fine architectural divider
Accent       #C86446  terracotta rust
Accent dark  #A84E34  hover rust
Logo brown   #4A321F  native SVG logo color
```

### Typography

- Headings: Syne, 600/700.
- Body: Plus Jakarta Sans, 400, 16px baseline.
- Technical metadata, rates, buttons, receipts: Space Mono, 400/700, uppercase where appropriate.
- Always provide fallbacks.
- Prefer locally hosted fonts or Blocksy font controls over arbitrary CSS imports.

### Geometry

- Border radius: `0px`.
- Borders: `1px solid #E5E0D8` unless a high-contrast technical divider is appropriate.
- Prefer sharp rectangles, grids, asymmetric columns, and generous editorial whitespace.
- Avoid generic rounded ecommerce cards, glossy gradients, excessive shadows, and template-like UI.

## Approved design direction

The homepage is a custom hybrid:

- HAUS Studio: bold art direction, oversized type, numbering, black technical panels.
- Krafti: workshop/process narrative.
- CLAY: curated artifact archive logic.
- Mesa House: warm premium product presentation.
- Ceramika: clear ecommerce flow only.

The homepage must feel like a “3D artifact archive” rather than a pottery store or generic ecommerce template.

The three locked anchor references are:

1. Collection/shop: Nowaste / Ceramics Studio style.
2. Product detail: Olive Ateliers specimen-sheet style.
3. Cart drawer: 1/1 Studio receipt/cart style.

Do not import new Pinterest references for the remaining pages unless the owner supplies or approves them.

## Page architecture

### Homepage `/`

Required sections:

1. Technical ticker.
2. Editorial hero with Kerf logo and dual CTA.
3. Live PLA/TPU material-rate panel.
4. Two engine cards: catalog and custom mesh upload.
5. Featured artifact archive.
6. “From Mesh to Object” four-stage process.
7. Workshop tolerances and A1 capability panel.
8. Final quote CTA.

### Shop `/shop`

- Sticky left filter sidebar.
- Material checkboxes.
- Filament shade swatches with text labels.
- Availability filters.
- Inside/outside Dhaka courier information.
- Three-column desktop archive grid, responsive tablet/mobile behavior.
- Product metadata: material, weight, layer height, inventory number, BDT price.

### Product `/product/...`

- Asymmetric gallery and information split.
- Inventory number and stock state.
- Product title, BDT price, description.
- Variation swatches.
- 2×2 metadata grid: material, layer height, weight, infill.
- Gallery/3D viewer region.
- Solid add-to-bag CTA.
- Dispatch and custom-quote cross-link.

### Cart drawer

- Right-side receipt panel.
- Itemized line items and quantity controls.
- Material and color metadata.
- Courier region selector.
- Subtotal, courier, and total due.
- Custom-order deposit notice.
- Checkout CTA.

### Checkout `/checkout`

- Contact fields.
- Inside/Outside Dhaka selector.
- Delivery address.
- bKash/Nagad/Rocket TrxID flow.
- COD for catalog items with custom-order deposit warning.
- Sticky invoice card.
- Show “total due now” separately from custom-order balance.

### Order confirmation `/checkout/order-received/`

- Printable workshop ticket.
- Order ID, timestamp, payment state, delivery address.
- Four queue stages: received, slicing/machine assignment, printing, dispatched.
- Refer to “Bambu Lab A1 print” rather than CoreXY.

### Materials `/materials`

- Bambu Lab A1 roster.
- Build volume and thermal limits.
- Nozzle and sensor information.
- PLA/TPU/PETG comparison matrix.
- Design-for-print guidance.
- Custom quote CTA.

### Quote `/quote`

This page still needs live implementation around the Birlo shortcode/integration:

- `[birlo_3d_print]` or the actual plugin-provided shortcode.
- 128 MB dropzone.
- STL/OBJ/3MF validation.
- Three.js viewer.
- Material rate selector.
- Infill selector.
- Weight and price calculation.
- Setup fee and deposit state.
- WooCommerce cart handoff.

Do not invent Birlo option names. Inspect the installed plugin documentation/UI before writing integration code.

## WordPress implementation plan

1. Create a staging backup.
2. Install/activate Blocksy, Blocksy Companion if required, WooCommerce, Birlo, variation swatches, payment, SMTP, cache, and backup plugins.
3. Create a Blocksy child theme.
4. Copy the approved CSS into the child theme `assets/` directory.
5. Enqueue CSS through `functions.php` with `filemtime()` cache busting.
6. Upload the logo and configure Blocksy Header → Logo.
7. Configure Blocksy colors, typography, header, footer, and layout.
8. Create pages and paste Gutenberg markup through Code Editor.
9. Configure WooCommerce currency, units, products, attributes, stock, and shipping zones.
10. Configure Birlo and verify the quote formula with real test files.
11. Configure payment and TrxID verification.
12. Connect dynamic cart, checkout, confirmation, and order metadata.
13. Test on staging at desktop, tablet, and mobile breakpoints.
14. Test ready-made and custom-print order paths.
15. Only then deploy to production.

## WooCommerce product contracts

### Ready-made products

- Variable product.
- Attributes: Material, Filament Shade.
- Variations contain fixed artifact price, weight, layer height, infill, inventory number, and stock state.
- Variation swatches must retain accessible text labels.

### Custom products

- Birlo-managed quote or hidden service product.
- Store uploaded file metadata securely: filename, extension, size, mesh volume, estimated grams, material, infill, setup fee, quote amount.
- Do not expose private upload URLs publicly.
- Attach custom metadata to the WooCommerce order and order item.

## QA checklist

### Visual

- Logo displays without distortion.
- No unintended rounded corners.
- No CoreXY wording remains.
- All pages share parchment, charcoal, terracotta, and border tokens.
- Product cards align at desktop and do not overflow on mobile.
- Receipt/cart panel remains usable at 320px width.

### Commerce

- PLA calculates at `৳6.50/g`.
- TPU calculates at `৳9.75/g`.
- Setup fee is `৳50` per uploaded model.
- Custom deposit is exactly `৳100`.
- Inside Dhaka shipping is `৳70`.
- Outside Dhaka shipping is `৳130`.
- Zone order does not allow a broad zone to override a specific zone.
- COD cannot bypass the custom-order deposit rule.

### Upload/security

- Reject unsupported extensions.
- Reject files over 128 MB at every layer.
- Sanitize filenames and metadata.
- Never execute or serve uploaded files as code.
- Verify Birlo’s server-side handling.

### Accessibility

- Visible keyboard focus.
- Swatches have text and accessible names.
- Form labels are explicit.
- Status is not communicated by color alone.
- Cart drawer has a labelled close button and sensible focus behavior.
- Contrast meets WCAG AA where practical.

### Performance

- Use optimized product images.
- Avoid loading every page CSS file globally when page-specific enqueueing is available.
- Use LiteSpeed Cache after functional testing.
- Load fonts locally where possible.
- Do not preload every font weight.

## Pending decisions

These must be confirmed before production:

1. Exact Bambu Lab A1 filament brands and available colors.
2. Whether PETG is actively sold and whether its rate is `৳7.50/g`.
3. Exact Dhaka postal-code/area definition for the Inside Dhaka zone.
4. bKash/Nagad/Rocket merchant or personal payment numbers.
5. Whether custom order balance is collected before production, at dispatch, or through COD.
6. Actual courier API provider and credentials.
7. Exact Birlo plugin version, settings names, shortcode behavior, and upload storage path.
8. Final production WordPress/staging URL.
9. Approved logo crop for favicon/site icon.
10. Product photography or rendered 3D assets for the archive.

## Agent behavior

- Preserve user-owned files and unrelated project work.
- Never edit `sources/`.
- Do not overwrite existing files without reading them first.
- Prefer `apply_patch` for edits.
- Do not claim a live deployment or plugin configuration without verification.
- Ask before destructive changes, production deployment, payment changes, or credential handling.
- When a technical specification may have changed, verify against an official primary source.
