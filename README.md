# Kerf 3D Store

WordPress/WooCommerce source foundation for Kerf 3D, a Dhaka-based 3D-printing studio and curated artifact store.

## Repository layout

```text
CLAUDE.md                         Agent and project instructions
docs/                             Project, Blocksy, and WooCommerce documentation
                                  Cost-optimized deployment guidance
gutenberg/                        Gutenberg page and component markup
assets/css/                       Global and page-specific CSS
```

## Current status

This repository contains the first design and implementation foundation. It is not yet connected to a live WordPress installation.

Completed page foundations:

- Homepage
- Collection/shop archive
- Product specimen page
- Receipt cart drawer
- Checkout/invoice page
- Order confirmation/workshop ticket
- Bambu Lab A1 materials guide

## Development rules

Read `CLAUDE.md` before making changes. Keep all Kerf 3D work in this repository. Do not modify unrelated project files or synced reference material outside this repository.

Before production integration, connect the markup and styles to a WordPress Blocksy child theme and WooCommerce staging site. Do not hardcode live credentials, payment numbers, courier credentials, customer data, or private upload URLs.

## Next implementation priorities

1. Create the Blocksy child theme package.
2. Enqueue global and page-specific CSS.
3. Connect Gutenberg markup to WooCommerce products and variations.
4. Integrate Birlo uploads and quote calculation.
5. Wire cart, courier rates, payment TrxID, deposit, and order metadata.
6. Add staging QA and deployment documentation.

See `docs/cost-optimized-stack.md` for the recommended free-first launch profile.
