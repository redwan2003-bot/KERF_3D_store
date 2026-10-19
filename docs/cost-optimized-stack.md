# Kerf 3D Cost-Optimized Stack

## Recommendation

Launch with a free-first stack and pay only for infrastructure or functionality that directly creates orders.

### Keep

- WordPress core.
- WooCommerce core.
- Blocksy Free.
- Gutenberg.
- MariaDB 10.11.
- OpenLiteSpeed.
- LiteSpeed Cache.
- Manual flat-rate shipping.
- Manual bKash/Nagad/Rocket TrxID verification.
- COD for eligible ready-made products.
- Bambu Studio for production slicing and final print validation.

### Defer

- Blocksy Pro.
- Premium variation swatch extensions.
- Courier API automation.
- Paid SMTP plans.
- Paid backup storage.
- Paid 3D quoting plans.
- Advanced analytics and automation plugins.

WooCommerce core is free. Blocksy Free already supports the core header/footer builders, global colors, typography, and WooCommerce integration; Pro is optional for advanced features. Verify current plugin licensing before purchase.

## Minimum-cost launch profile

| Area | Low-cost choice | Trade-off |
|---|---|---|
| Theme | Blocksy Free | Build custom patterns instead of using Pro Content Blocks |
| Store | WooCommerce core | No paid WooCommerce extension required for basic products |
| Variations | Native WooCommerce dropdowns with custom CSS | Less polished than paid swatches; can be upgraded later |
| Payments | Manual bKash/Nagad/Rocket + COD | Orders require manual TrxID verification |
| Shipping | Two WooCommerce flat-rate zones | No automatic courier label or tracking creation |
| Quote phase 1 | Quote request + secure upload + manual Bambu Studio quote | Not instant; lowest recurring cost |
| Quote phase 2 | Free/limited quote service such as PrintPrice or Quote3D, after compatibility testing | External service limits, privacy and usage considerations |
| Email | FluentSMTP with an existing SMTP account | Provider sending limits still apply |
| Cache | LiteSpeed Cache | Requires compatible LiteSpeed hosting |
| Backup | UpdraftPlus free to local/offsite destination | Storage destination and retention may cost money |
| Courier | Manual Steadfast/Pathao booking | Staff must create parcels manually |

## 3D quoting decision

Instant mesh pricing is the main potential recurring cost. There are three choices:

### Option A — cheapest and safest launch

Use a custom quote-request page:

1. Customer uploads STL/OBJ/3MF.
2. Customer selects PLA or TPU.
3. Customer enters quantity and notes.
4. Store receives the file and request.
5. Operator opens the model in Bambu Studio, validates the slice, calculates material, and sends a quote.

This avoids an external quote-service subscription but adds manual work and quote delay.

### Option B — free/limited cloud calculator

Test a WordPress plugin/service with a free tier. PrintPrice’s WordPress listing currently describes a free tier limited to five paid orders per month and cloud-based mesh calculation. Quote3D describes cloud-based model pricing and WooCommerce cart integration. Confirm current terms, privacy, storage, and limits before using either service.

### Option C — paid automation

Use Birlo or another paid/managed calculator when order volume justifies it. Do not pay for it before testing the exact pricing formula, file limits, storage behavior, and WooCommerce cart handoff.

## Payment cost reduction

Start with manual MFS payment collection rather than a full merchant API integration:

- bKash manual/send-money instructions.
- Nagad manual/send-money instructions.
- Rocket manual/send-money instructions.
- TrxID field.
- Admin verification status.
- COD for ready-made catalog products.
- Mandatory `৳100` bKash deposit for custom orders.

Payment gateway transaction fees still apply according to the provider. Free plugin status does not mean payment processing is free.

## What not to remove

Do not remove:

- Backups.
- HTTPS.
- Server-side upload validation.
- Payment verification records.
- Order metadata for custom files and deposits.
- Email delivery testing.
- Staging tests before payment or checkout changes.

## Upgrade triggers

Pay for automation only when one of these becomes true:

- Manual quoting takes more than one business day.
- More than five custom quote orders arrive per month.
- Manual courier booking becomes a daily bottleneck.
- Variation management becomes difficult with native dropdowns.
- Email volume exceeds the existing SMTP provider’s limits.
- Backups need longer retention or managed offsite storage.

## Current recommended launch stack

```text
WordPress 6.x
WooCommerce core
Blocksy Free
Gutenberg
MariaDB 10.11
OpenLiteSpeed
LiteSpeed Cache
FluentSMTP with existing SMTP provider
UpdraftPlus free
Manual bKash/Nagad/Rocket + COD
WooCommerce flat-rate shipping
Manual Bambu Studio quote validation at launch
```
