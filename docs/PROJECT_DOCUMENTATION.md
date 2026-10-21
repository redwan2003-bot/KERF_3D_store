# Kerf 3D — Full Project Documentation

## 1. Purpose

Kerf 3D is a premium, editorial 3D-printing ecommerce store for Dhaka, Bangladesh. It has two commercial modes:

1. A curated catalog of ready-made printed artifacts.
2. A custom printing service where customers upload a 3D model and receive a live BDT quote.

The site combines strong ecommerce usability with a distinctive industrial-archival identity.

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

### CodeIgniter stack

- CodeIgniter 4.x application.
- PHP 8.3 with Composer dependency management.
- Server-rendered CodeIgniter views with Tailwind CSS.
- Alpine.js or small vanilla modules only where interaction requires it.
- Three.js viewer with a custom server-side quote calculation service.
- MySQL 8.x with migrations, seeders, foreign keys, and indexed order/catalog queries.
- Manual bKash/Nagad/Rocket TrxID capture plus COD; merchant APIs remain optional future adapters.
- OpenLiteSpeed caching plus application/query caching where justified.
- SMTP mail adapter for transactional email.
- Automated MySQL dumps and filesystem/object-storage backup rotation.

### Server target

- OpenLiteSpeed in Docker.
- Container name: `3dprint_ols`.
- HTTP: port `8080`.
- HTTPS/QUIC: port `8443`.
- WebAdmin: port `7080`.
- MySQL 8.x on `ols_network`.
- PHP upload/post limits: 128 MB.

These infrastructure values are project targets. Verify the actual host, Docker Compose files, PHP runtime, database credentials, and network before changing anything.

## 4. Pricing and order logic

### Ready-made catalog

Ready-made artifacts use fixed BDT prices and variable attributes:

- Material (PLA, TPU 95A, PETG if activated).
- Filament shade.
- Stock status.
- Weight.
- Layer height.
- Infill.

### Custom quote

Custom quote values should be visible to the customer:

- Mesh filename.
- Mesh type (.stl, .obj, .3mf).
- Mesh volume.
- Selected material.
- Effective density.
- Estimated weight.
- Infill.
- Setup fee (৳50).
- Print subtotal.
- Courier rate.
- Deposit due now (৳100 advance deposit via bKash).
- Remaining balance.

Formula:

```text
print subtotal = estimated grams × material rate
custom model total = print subtotal + ৳50 setup fee
deposit due now = ৳100 mandatory advance deposit
remaining balance = custom model total + shipping - deposit already paid
```

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
| `global-tokens.css` | Shared design tokens and baseline typography/layout styles |
| `mockups/homepage.html` | Homepage semantic HTML mockup |
| `homepage.css` | Homepage-specific styles |
| `mockups/shop.html` | Shop/catalog semantic HTML mockup |
| `shop.css` | Shop/catalog styles |
| `mockups/product.html` | Product specimen template markup |
| `product.css` | Product detail styles |
| `mockups/cart-drawer.html` | Receipt cart drawer markup |
| `cart-drawer.css` | Cart drawer styles |
| `mockups/checkout.html` | Checkout/invoice markup |
| `checkout.css` | Checkout styles |
| `mockups/order-confirmation.html` | Workshop ticket markup |
| `order-confirmation.css` | Order ticket styles |
| `mockups/materials.html` | Bambu Lab A1 materials page markup |
| `materials.css` | Materials page styles |
| `mockups/quote.html` | Custom 3D mesh quote calculator markup |
| `quote.css` | Custom quote and mesh intake styles |

## 8. View implementation in CodeIgniter

1. Create CodeIgniter 4 view templates translating the semantic HTML mockups from `mockups/`.
2. Connect shared layout header, navigation, and footer components.
3. Enqueue `global-tokens.css` followed by page-specific CSS or compile into unified Tailwind styles.
4. Render the SVG logo cleanly in the header.
5. Create controllers and routes for Home, Shop, Product, Materials, Cart, Checkout, and Quote.
6. Connect product data and variation IDs from MySQL.
7. Connect quoting calculator and payment intake.
8. Test the complete purchase paths across responsive breakpoints.

## 9. Dynamic integration required

The static mockups use sample product names, prices, order numbers, and customer details. Replace them with dynamic data from the application layer.

Required dynamic work:

- Catalog product query and pagination.
- Product variation selection and price updates.
- Cart item quantity management and session persistence.
- Courier rate calculation (৳70 inside Dhaka / ৳130 outside Dhaka).
- 3D file uploader (STL/OBJ/3MF up to 128 MB) and quote calculation service.
- bKash/Nagad/Rocket TrxID recording and manual verification workflow.
- Custom order deposit (৳100) and remaining balance handling.
- Confirmation ticket rendering with unique order number and queue state.
- Transactional email templates via SMTP adapter.
- Courier dispatch booking via Steadfast / Pathao workflow.

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
5. Confirm setup fee (৳50).
6. Confirm ৳100 advance deposit.
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

- Keep payment and courier credentials out of source files (use `.env`).
- Treat customer uploads as untrusted files; validate on client and server.
- Do not expose private upload paths.
- Enable MySQL daily backups.
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
- Hosting/staging access.
- Final logo favicon crop.
