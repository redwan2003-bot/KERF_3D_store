# Kerf 3D Legacy WooCommerce Configuration Blueprint

> Legacy reference only. WooCommerce is no longer part of the active architecture. Translate the business rules here into CodeIgniter services, MySQL migrations, controllers, and admin workflows.

This file translates the approved Kerf 3D business rules into WooCommerce settings. It is a deployment checklist, not a claim that a live WordPress installation has already been changed.

## General settings

| Setting | Value |
|---|---|
| Store currency | Bangladeshi taka (৳) |
| Currency position | Left |
| Thousand separator | `,` |
| Decimal separator | `.` |
| Number of decimals | `2` |
| Selling location | Bangladesh |
| Shipping location | Customer billing/shipping address |
| Weight unit | `g` |
| Dimension unit | `mm` |
| Tax display | Configure after Bangladesh tax policy is confirmed |

## Product data contracts

### Ready-made catalog products

- Product type: Variable product
- Required attributes: Material, Filament Shade
- Material terms: PLA, TPU 95A, PETG (only if enabled in the catalog)
- Variation metadata: weight in grams, layer height, infill, inventory number, stock status
- Variation pricing: fixed BDT price per ready-made artifact
- Swatch UI: Variation Swatches for WooCommerce

### Custom print products

- Product type: Hidden/simple service product or Birlo-managed quote line
- Accepted files: `.stl`, `.obj`, `.3mf`
- Maximum upload: `128 MB`
- Required quote values: file name, material, estimated grams, infill, setup fee, calculated print price
- Base setup fee: `৳50` per uploaded model
- Mandatory custom-order advance deposit: `৳100` via bKash

## Material pricing

| Material | Rate | Effective density | Customer-facing label |
|---|---:|---:|---|
| PLA | `৳6.50 / g` | `0.50 g/cm³` | PLA / rigid |
| TPU 95A | `৳9.75 / g` | `0.48 g/cm³` | TPU 95A / flexible |

Birlo’s final quote should be calculated as:

```text
print subtotal = max(estimated grams × material rate, 0)
custom model total = print subtotal + ৳50 setup fee
custom order due now = ৳100 advance deposit
```

The remaining balance must be displayed clearly before checkout submission. Do not silently treat the deposit as the whole order total.

## Shipping zones

Create two WooCommerce shipping zones in this order:

1. `Inside Dhaka`
   - Region: Dhaka delivery area
   - Flat rate: `৳70`
   - Delivery text: `24–48 hours`

2. `Outside Dhaka`
   - Region: Bangladesh excluding the Dhaka delivery area
   - Flat rate: `৳130`
   - Delivery text: `2–4 days via Steadfast / Pathao`

Add a final catch-all Bangladesh zone only if the checkout requires it. The catch-all must never override the two explicit zones.

## Payment methods

### bKash / Nagad / Rocket manual payment

- Enable manual TrxID capture through the selected Deshi Pay gateway.
- Show merchant/personal number and payment instructions before the TrxID field.
- Require TrxID for custom-print orders.
- Keep payment status `On hold` until the TrxID is verified.
- Store the verification state in order notes and protected order metadata.

### Cash on Delivery

- Enable COD for ready-made products.
- For custom STL orders, show the mandatory `৳100 bKash advance deposit` notice.
- Do not allow a custom-print order to proceed as zero-deposit COD.

## Checkout display contract

The checkout summary should expose these rows:

```text
ARTIFACTS / itemized products
CUSTOM SETUP / ৳50 per uploaded model, when applicable
ADVANCE DEPOSIT / ৳100 for custom STL orders, when applicable
COURIER / ৳70 or ৳130
TOTAL DUE NOW / current payable amount
BALANCE AFTER VERIFICATION / remaining custom-print balance, when applicable
```

## Upload and server limits

Apply the limit at every layer, not only in the browser:

```ini
upload_max_filesize = 128M
post_max_size = 128M
client_max_body_size 128M
```

The browser dropzone must validate extension and file size for usability, while the server and Birlo must validate them again for security and correctness.

## Integration order

1. Configure currency, units, and product attributes.
2. Create shipping zones and test rates with Dhaka and non-Dhaka addresses.
3. Configure material rates and the `৳50` setup fee in Birlo.
4. Configure manual payment and TrxID verification.
5. Add the custom-order deposit logic.
6. Connect WooCommerce product data to the shop and product templates.
7. Test ready-made, custom STL, inside-Dhaka, outside-Dhaka, bKash, and COD paths.
