# Kerf 3D Cost-Optimized CodeIgniter Stack

## Recommended stack

```text
CodeIgniter 4.x
PHP 8.3
Tailwind CSS
MySQL 8.x
OpenLiteSpeed in Docker
Three.js for model preview
Manual bKash/Nagad/Rocket TrxID verification + COD
Manual Steadfast/Pathao booking at launch
```

This removes WordPress, WooCommerce, Blocksy, and paid ecommerce plugins. The trade-off is that Kerf 3D owns the catalog, cart, checkout, quote, payment, and admin code.

## Keep costs low

- Use CodeIgniter core, Composer, Tailwind, and MySQL without commercial plugins.
- Start with manual mesh review in Bambu Studio before adding automated geometry parsing.
- Use a simple database-backed cart and order workflow before adding external SaaS.
- Use manual MFS verification with a TrxID and admin status rather than merchant API integration.
- Use flat shipping rules for Inside Dhaka (`৳70`) and Outside Dhaka (`৳130`) before courier API automation.
- Use existing SMTP and local/offsite MySQL backups.
- Keep the inspiration queue separate from products so third-party licensing does not create catalog or storage cost.

## Main cost risks

| Area | Low-cost launch choice | Upgrade trigger |
|---|---|---|
| 3D quoting | Manual Bambu Studio validation | Quote volume creates more than one business day of delay |
| Payments | Manual TrxID review | Reconciliation volume or gateway policy requires API automation |
| Courier | Manual Steadfast/Pathao booking | Daily parcel volume makes manual entry a bottleneck |
| Storage | Local protected uploads + scheduled backup | File volume or retention requires object storage |
| Email | Existing SMTP provider | Delivery or volume limits are reached |
| Monitoring | Server logs and uptime checks | Paid observability becomes cheaper than troubleshooting time |

## Non-negotiable controls

- HTTPS and secure cookies.
- Server-side upload validation for STL, OBJ, and 3MF files up to 128 MB.
- Private upload storage and authenticated download routes.
- MySQL migrations and daily backup verification.
- CSRF protection, authorization, rate limiting, and prepared queries.
- Payment verification records and the mandatory `৳100` custom-order deposit.
- Staging tests before any checkout, payment, upload, or pricing release.
