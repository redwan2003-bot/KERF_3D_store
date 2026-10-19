# Kerf 3D Store

CodeIgniter/Tailwind CSS application foundation for Kerf 3D, a Dhaka-based 3D-printing studio and curated artifact store.

## Repository layout

```text
CLAUDE.md                         Agent and project instructions
docs/                             Project, CodeIgniter, MySQL, and deployment documentation
                                  Cost-optimized deployment guidance
gutenberg/                        Gutenberg page and component markup
assets/css/                       Global and page-specific CSS
```

## Current status

This repository contains the design foundation and application architecture. It is not yet connected to a live CodeIgniter/MySQL deployment.

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

Before production integration, translate the approved markup into CodeIgniter views/components and connect them to a MySQL staging database. Do not hardcode live credentials, payment numbers, courier credentials, customer data, or private upload URLs.

## Next implementation priorities

1. Scaffold CodeIgniter 4 with environment-based configuration.
2. Add Tailwind CSS build tooling and translate the approved page foundations into views.
3. Create the MySQL schema for products, variations, quotes, uploads, carts, orders, payments, and shipping.
4. Implement secure STL/OBJ/3MF uploads and Three.js quote estimation.
5. Wire cart, courier rates, payment TrxID, deposit, and order metadata.
6. Add staging QA, migrations, backups, and deployment documentation.

See `docs/cost-optimized-stack.md` for the recommended free-first launch profile.
