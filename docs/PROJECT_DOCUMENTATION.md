# Kerf 3D — Full Project Documentation

## 1. Purpose

Kerf 3D is a premium, editorial 3D-printing ecommerce store for Dhaka, Bangladesh. It has two commercial modes:

1. A curated catalog of ready-made printed artifacts.
2. A custom printing service where customers upload a 3D model and receive a live BDT quote.

The site must combine strong ecommerce usability with a distinctive industrial-archival identity.

## 2. Brand and identity

The supplied SVG logo is the official brand mark. Its native brown is `#4A321F`. Preserve the original vector artwork. The site’s accent color is terracotta `#C86446`; the logo brown and terracotta are complementary and should not be substituted casually.

Brand voice:

- Precise, calm, technical, editorial.
- Short labels and direct CTAs.
- Avoid exaggerated claims such as “perfect,” “indestructible,” or “CNC precision.”
- Explain material and delivery limitations honestly.

Suggested tagline:

`Precision Additive Manufacturing & Curated Artifacts`

## 3. Technical target

### WordPress stack

- WordPress 6.x.
- WooCommerce.
- Blocksy theme with child theme.
- Gutenberg blocks, custom HTML blocks, and CSS.
- Birlo 3D Print Lite for WooCommerce or the installed equivalent for 3D upload/quote functionality.
- Variation Swatches for WooCommerce.
- Deshi Pay/bKash-compatible gateway with manual TrxID capture.
- LiteSpeed Cache.
- FluentSMTP.
- UpdraftPlus.

### Server target from the reference brief

- OpenLiteSpeed in Docker.
- Container name: `3dprint_ols`.
- HTTP: port `8080`.
- HTTPS/QUIC: port `8443`.
- WebAdmin: port `7080`.
- MariaDB 10.11 on `ols_network`.
- PHP upload/post limits: 128 MB.

These infrastructure values are project targets. Verify the actual host, Docker Compose files, PHP runtime, database credentials, and network before changing anything.

## 4. Pricing and order logic

### Ready-made catalog

Ready-made artifacts use normal WooCommerce fixed prices and variable attributes:

- Material.
- Filament shade.
- Stock status.
- Weight.
- Layer height.
- Infill.

### Custom quote

Custom quote values should be visible to the customer:

- Mesh filename.
- Mesh type.
- Mesh volume.
- Selected material.
- Effective density.
- Estimated weight.
- Infill.
- Setup fee.
- Print subtotal.
- Courier rate.
- Deposit due now.
- Remaining balance.

Formula:

```text
estimated grams × selected rate + ৳50 setup fee = custom production amount
```

The exact final price is dependent on Birlo’s mesh estimator and must be verified against test models. Do not hardcode a quote result without confirming Birlo’s units and calculation behavior.

## 5. Printer profile

The active machine is Bambu Lab A1. The Workshop & Materials Guide uses the following official specifications:

| Specification | Value |
|---|---|
| Technology | FDM |
| Build volume | 256 × 256 × 256 mm |
| Included nozzle | 0.4 mm stainless steel |
| Optional nozzles | 0.2 / 0.6 / 0.8 mm |
| Max hot end | 300 °C |
| Max bed | 100 °C |
| Max toolhead speed | 500 mm/s |
| Ideal materials | PLA / PETG / TPU / PVA |
| Not recommended | ABS / ASA / PC / PA / PET / fiber-reinforced polymers |
| Footprint | approximately 385 × 410 × 430 mm |
| Net weight | approximately 8.3 kg |

Official source: https://bambulab.com/pl/a1/tech-specs

## 6. Design system implementation

The primary CSS file is `global-tokens.css`. Page files depend on these custom properties:

```css
--k3d-canvas
--k3d-surface
--k3d-ink
--k3d-secondary
--k3d-meta
--k3d-border
--k3d-rust
--k3d-logo-brown
--k3d-display
--k3d-sans
--k3d-mono
```

If a page is rendered without `global-tokens.css`, its colors and fonts will fall back incorrectly. Always enqueue the global file before page-specific CSS.

## 7. File map

| File | Role |
|---|---|
| `CLAUDE.md` | Agent rules and authoritative project context |
| `PROJECT_DOCUMENTATION.md` | Human/developer project documentation |
| `global-tokens.css` | Shared design tokens and Blocksy/WooCommerce baseline styles |
| `blocksy-settings.md` | Manual Blocksy setup instructions |
| `woocommerce-config.md` | WooCommerce business-rule configuration blueprint |
| `homepage-gutenberg.html` | Homepage Gutenberg block markup |
| `homepage.css` | Homepage-specific styles |
| `shop-gutenberg.html` | Shop/catalog Gutenberg markup |
| `shop.css` | Shop/catalog styles |
| `product-gutenberg.html` | Product specimen template markup |
| `product.css` | Product detail styles |
| `cart-drawer.html` | Receipt cart drawer markup |
| `cart-drawer.css` | Cart drawer styles |
| `checkout-gutenberg.html` | Checkout/invoice markup |
| `checkout.css` | Checkout styles |
| `order-confirmation-gutenberg.html` | Workshop ticket markup |
| `order-confirmation.css` | Order ticket styles |
| `materials-gutenberg.html` | Bambu Lab A1 materials page markup |
| `materials.css` | Materials page styles |

## 8. How to install the artifacts

1. Create a staging WordPress site.
2. Install Blocksy and WooCommerce.
3. Create/activate a Blocksy child theme.
4. Copy CSS files into the child theme `assets/` directory.
5. Enqueue CSS in `functions.php`.
6. Upload the SVG logo and configure the Blocksy header.
7. Create the Home, Shop, Materials, Checkout, and Quote pages.
8. Paste the corresponding Gutenberg markup through the editor’s Code Editor.
9. Use the product markup as the basis for the single-product template.
10. Place the receipt drawer markup into the Blocksy off-canvas/header cart implementation.
11. Configure WooCommerce currency and shipping.
12. Connect real product data and variation IDs.
13. Connect Birlo and payment behavior.
14. Test the complete purchase paths.

Blocksy’s current typography controls are under `Appearance → Customize → Typography`; its header builder is under `Appearance → Customize → Header`. Blocksy also supports custom header content blocks when the standard header builder is insufficient.

## 9. Dynamic integration still required

The static artifacts intentionally use sample product names, prices, order numbers, and customer details. Replace them with dynamic data before production.

Required dynamic work:

- WooCommerce product loop and query.
- Product variation selection and price updates.
- Real cart item quantity and remove actions.
- Real courier selection and totals.
- Birlo uploader and quote calculation.
- Order item metadata.
- bKash TrxID validation state.
- Custom deposit and balance display.
- Real confirmation order number and queue state.
- Email templates through FluentSMTP.
- Courier dispatch integration if API credentials are supplied.

## 10. Testing matrix

### Catalog path

1. Open shop.
2. Filter PLA.
3. Select Terracotta.
4. Open product.
5. Select variation.
6. Add to cart.
7. Choose Inside Dhaka.
8. Complete bKash or COD flow.

### Custom path

1. Open `/quote`.
2. Upload valid STL under 128 MB.
3. Confirm preview and estimated weight.
4. Choose PLA or TPU.
5. Confirm setup fee.
6. Confirm ৳100 deposit.
7. Confirm shipping.
8. Submit TrxID.
9. Verify order metadata and confirmation ticket.

### Failure paths

- Unsupported file extension.
- File over 128 MB.
- Empty mesh.
- Mesh outside build volume.
- Missing TrxID for a custom order.
- Invalid shipping address.
- Payment verification pending.
- Courier rate unavailable.
- Mobile viewport at 320px width.

## 11. Security and operations

- Keep payment and courier credentials out of source files.
- Use WordPress secrets/environment configuration where possible.
- Treat customer uploads as untrusted files.
- Do not expose private upload paths.
- Enable backups before plugin/theme changes.
- Use staging for CSS, checkout, and payment changes.
- Clear LiteSpeed cache after deployment.
- Verify order emails and SMTP delivery.
- Never use sample customer data in production.

## 12. Pending owner decisions

Before production launch, confirm:

- Real product catalog and product photography.
- Final material/color inventory.
- Whether PETG is active and whether its rate is `৳7.50/g`.
- Dhaka delivery-area boundaries.
- bKash/Nagad/Rocket payment number.
- Custom-order payment schedule.
- Courier provider/API.
- Birlo version and exact configuration UI.
- Hosting/staging access.
- Final logo favicon crop.
