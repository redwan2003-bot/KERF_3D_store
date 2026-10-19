# Kerf 3D CodeIgniter + Tailwind Stack

## Runtime

- CodeIgniter 4.x
- PHP 8.3
- Composer
- MySQL 8.x on Docker network `ols_network`
- OpenLiteSpeed container `3dprint_ols`
- Tailwind CSS compiled into versioned production assets
- Three.js for the browser-side model preview
- Server-side quote service for validated STL, OBJ, and 3MF metadata

## Application modules

| Module | Responsibility |
|---|---|
| Catalog | Ready-made products, categories, material/shade variations, stock, attribution |
| Quote | Upload validation, model metadata, material pricing, ৳50 setup fee |
| Cart | Session/cart persistence, quantity, shipping estimate, totals |
| Checkout | Customer details, Dhaka zone, payment method, TrxID/deposit state |
| Orders | Order lifecycle, print queue, fulfillment notes, courier reference |
| Payments | Manual bKash/Nagad/Rocket verification and COD rules |
| Inspiration | MakerWorld references kept separate from purchasable catalog records |
| Admin | Moderation, license review, pricing, quote review, order operations |

## Required security boundaries

- Store uploads outside the public web root or behind authenticated download routes.
- Validate extension, MIME type, file signature, size, and parser safety server-side.
- Never execute or render uploaded files as HTML.
- Keep payment credentials, SMTP secrets, database credentials, and courier credentials in `.env`.
- Use CSRF protection, prepared queries/models, rate limiting, secure cookies, and authorization checks.
- Never expose a MakerWorld session cookie or API token to the application repository.

## Tailwind conventions

- Map the Kerf tokens in `tailwind.config.js` or the Tailwind v4 theme layer.
- Keep sharp rectangular geometry: `border-radius: 0`.
- Use Syne for headings, Plus Jakarta Sans for body text, and Space Mono for technical metadata.
- Build reusable components for `site-header`, `spec-grid`, `receipt-drawer`, `price-ticker`, `upload-dropzone`, and `queue-stepper`.
- Avoid inline styles for production UI; use component classes and token utilities.

## Initial build order

1. Scaffold CodeIgniter and environment configuration.
2. Add migrations and seeders for catalog, quote, cart, order, payment, and inspiration entities.
3. Port the approved page markup into server-rendered views.
4. Add Tailwind responsive behavior and accessibility states.
5. Implement upload validation and quote calculation.
6. Implement cart, checkout, manual payment verification, and shipping rules.
7. Add admin review and order operations.
8. Run staging security, pricing, upload, checkout, and Bambu Lab A1 fit tests.
