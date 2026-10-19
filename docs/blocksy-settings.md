# Kerf 3D Blocksy Configuration

Apply these settings before pasting `global-tokens.css` into Appearance → Customize → Additional CSS.

## Site identity

- Site title: `Kerf 3D`
- Tagline: `Precision Additive Manufacturing & Curated Artifacts`
- Site icon: create a square crop from the supplied Kerf logo only after approving the crop.
- Logo: upload `Kerf Logo-02 (1).svg` as the primary logo; preserve the native brown `#4A321F`.
- Header logo height: desktop `54px`, mobile `42px`.

## Global colors

| Blocksy token | Value |
|---|---|
| Site background | `#F8F6F0` |
| Card/surface | `#FFFFFF` |
| Text | `#181818` |
| Headings | `#181818` |
| Links/hover accent | `#C86446` |
| Borders | `#E5E0D8` |
| Secondary text | `#766E65` |

Set all border radius controls to `0px`. Use 1px borders for cards, fields, header rows, and content dividers.

## Typography

- Headings: `Syne`, weight 700; fallback `Arial Black, sans-serif`.
- Body: `Plus Jakarta Sans`, weight 400; fallback `Arial, sans-serif`.
- Technical labels, rates, product metadata, buttons, and receipt text: `Space Mono`, weights 400/700.
- Body size: `16px`.
- Body line height: `1.6`.
- Navigation labels: `10px`, uppercase, monospaced, letter spacing `0.08em`.

Load the fonts through Blocksy’s Typography controls or a theme enqueue. Do not rely on CSS `@import` for production font delivery.

## Header

- Header layout: logo left, primary navigation center/right, cart trigger at far right.
- Primary navigation: `SHOP`, `CUSTOM QUOTE`, `MATERIALS`.
- Header background: transparent parchment.
- Header bottom border: `1px solid #E5E0D8`.
- Sticky header: enable only if the resulting height remains below `88px`.
- Cart icon: use the receipt/cart drawer trigger, not a generic full-page cart link.

## Layout

- Content width: `1440px` maximum.
- Desktop page gutters: `24px` minimum, expanding to `5vw` for editorial pages.
- Mobile gutters: `18px`.
- WooCommerce product grid: 3 columns desktop, 2 tablet, 2 or 1 mobile depending on image width.
- Avoid rounded cards, shadows, gradients, and heavy page-builder wrappers.

## WooCommerce presentation

- Shop archive: use the custom collection markup and connect its product loop to WooCommerce data.
- Product page: use the custom specimen template and retain the 2×2 metadata grid.
- Cart: use the receipt drawer markup and connect quantities, courier rate, subtotal, and total to WooCommerce state.
- Checkout: use the invoice layout and preserve visible courier, payment, TrxID, and custom deposit states.
- Product image ratio: use consistent portrait/near-square media with a warm neutral background.

## Accessibility requirements

- Preserve visible focus states.
- Every swatch must have an accessible name and a non-color text label.
- Never use color alone to communicate stock, payment, or queue status.
- Keep text contrast at WCAG AA or better.
- Ensure drawer close, quantity, filter, and checkout controls are keyboard reachable.
