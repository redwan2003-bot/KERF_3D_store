<?php

namespace App\Services;

class OrderNotificationService
{
    /**
     * Send order confirmation email to customer and notify workshop admin.
     */
    public function sendOrderConfirmation(array $order, array $customer, array $items): bool
    {
        $toEmail = $customer['email'] ?? null;
        $adminEmail = env('ADMIN_NOTIFICATION_EMAIL', 'kerf.3d@gmail.com');

        $customerSubject = "Workshop Ticket #{$order['order_number']} — Kerf 3D Studio Order Intake";
        $customerBody = $this->buildEmailTemplate($order, $customer, $items, false);

        $sentCustomer = false;
        $email = \Config\Services::email();

        $smtpPass = env('email.SMTPPass', '');
        $canSendSmtp = !empty($smtpPass) || env('email.protocol') === 'mail';

        // 1. Send to Customer if email provided and SMTP configured
        if (!empty($toEmail) && filter_var($toEmail, FILTER_VALIDATE_EMAIL)) {
            if ($canSendSmtp) {
                try {
                    $email->clear();
                    $email->setFrom(env('EMAIL_FROM_ADDRESS', 'kerf.3d@gmail.com'), 'Kerf 3D Studio Dhaka');
                    $email->setTo($toEmail);
                    $email->setSubject($customerSubject);
                    $email->setMessage($customerBody);
                    $email->setMailType('html');

                    $sentCustomer = (bool) $email->send(false);
                    if (!$sentCustomer) {
                        log_message('error', 'Order email to customer failed: ' . $email->printDebugger(['headers']));
                    }
                } catch (\Throwable $e) {
                    log_message('error', 'Order email exception: ' . $e->getMessage());
                }
            } else {
                // Log customer notification for inspection
                @file_put_contents(WRITEPATH . "logs/order_customer_{$order['order_number']}.html", $customerBody);
                $sentCustomer = true;
            }
        }

        // 2. Alert Admin / Workshop Owner with direct MakerWorld Slicing Links
        if (!empty($adminEmail)) {
            $adminSubject = "🚨 NEW ORDER #{$order['order_number']} — ৳" . number_format($order['total_bdt'], 2) . " [{$customer['name']} · {$customer['phone']}]";
            $adminBody = $this->buildEmailTemplate($order, $customer, $items, true);

            if ($canSendSmtp) {
                try {
                    $email->clear();
                    $email->setFrom(env('EMAIL_FROM_ADDRESS', 'kerf.3d@gmail.com'), 'Kerf 3D Intake Robot');
                    $email->setTo($adminEmail);
                    $email->setSubject($adminSubject);
                    $email->setMessage($adminBody);
                    $email->setMailType('html');
                    $email->send(false);
                } catch (\Throwable $e) {
                    log_message('error', 'Admin alert email exception: ' . $e->getMessage());
                }
            } else {
                // Save admin alert receipt with MakerWorld links
                @file_put_contents(WRITEPATH . "logs/order_admin_{$order['order_number']}.html", $adminBody);
            }
        }

        return $sentCustomer;
    }

    /**
     * Generate responsive brutalist HTML receipt email.
     */
    private function buildEmailTemplate(array $order, array $customer, array $items, bool $isAdmin = false): string
    {
        $itemsHtml = '';
        $adminMwLinks = [];

        foreach ($items as $item) {
            $name  = htmlspecialchars($item['product_name_snapshot'] ?? 'Specimen');
            $specs = htmlspecialchars($item['specs_snapshot'] ?? 'Standard');
            $qty   = (int) ($item['quantity'] ?? 1);
            $total = number_format($item['line_total_bdt'] ?? 0, 2);
            $mwUrl = !empty($item['makerworld_url_snapshot']) ? trim($item['makerworld_url_snapshot']) : '';

            $mwHtml = '';
            if (!empty($mwUrl)) {
                $mwHtml = "
                <div style='margin-top: 4px;'>
                    <a href='{$mwUrl}' target='_blank' style='display: inline-block; font-family: monospace; font-size: 11px; color: #c86446; text-decoration: underline; font-weight: bold;'>
                        MakerWorld Model ↗
                    </a>
                </div>";
                $adminMwLinks[] = [
                    'name' => $name,
                    'url'  => $mwUrl,
                    'qty'  => $qty,
                    'specs'=> $specs,
                ];
            }

            $itemsHtml .= "
            <tr style='border-bottom: 1px dashed #e5e0d8;'>
                <td style='padding: 12px 0;'>
                    <strong style='font-family: monospace; font-size: 13px; color: #181818;'>{$name}</strong><br>
                    <span style='font-family: monospace; font-size: 11px; color: #766e65;'>{$specs} × {$qty}</span>
                    {$mwHtml}
                </td>
                <td style='padding: 12px 0; text-align: right; vertical-align: top; font-family: monospace; font-size: 13px; font-weight: bold; color: #181818;'>
                    ৳{$total}
                </td>
            </tr>";
        }

        $orderNum  = htmlspecialchars($order['order_number']);
        $custName  = htmlspecialchars($customer['name'] ?? 'Customer');
        $custPhone = htmlspecialchars($customer['phone'] ?? '');
        $address   = nl2br(htmlspecialchars($customer['address_line'] ?? 'Dhaka'));
        $zoneLabel = ($order['shipping_zone'] === 'inside_dhaka') ? 'Inside Dhaka (24—48H Hub Courier)' : 'Outside Dhaka (2—4 Days Nationwide)';
        $subtotal  = number_format($order['subtotal_bdt'], 2);
        $shipping  = number_format($order['shipping_cost_bdt'], 2);
        $total     = number_format($order['total_bdt'], 2);
        $trxId     = !empty($order['trx_id']) ? htmlspecialchars($order['trx_id']) : 'Pending Verification';
        $payMethod = strtoupper($order['payment_method'] ?? 'BKASH');

        $cleanPhone = preg_replace('/[^0-9]/', '', $custPhone);
        if (str_starts_with($cleanPhone, '01')) {
            $cleanPhone = '88' . $cleanPhone;
        }

        // Admin Slicing & Direct Dispatch Box
        $adminHeaderBlock = '';
        if ($isAdmin) {
            $mwLinksListHtml = '';
            if (!empty($adminMwLinks)) {
                $mwLinksListHtml .= "<ul style='margin: 8px 0; padding-left: 18px; line-height: 1.8;'>";
                foreach ($adminMwLinks as $mw) {
                    $mwLinksListHtml .= "<li><strong style='color:#fff;'>{$mw['name']}</strong> [Qty: {$mw['qty']}, {$mw['specs']}] &rarr; <a href='{$mw['url']}' target='_blank' style='color:#ff8a65; text-decoration:underline; font-weight:bold;'>{$mw['url']}</a></li>";
                }
                $mwLinksListHtml .= "</ul>";
            } else {
                $mwLinksListHtml = "<p style='margin: 6px 0; font-size: 11px; color: #bdb6ad;'>No external MakerWorld models (Original Studio Specimen or Custom CAD).</p>";
            }

            $waReplyMsg = rawurlencode("Hello {$custName}, this is Kerf 3D Studio Dhaka confirming receipt of your Order #{$orderNum}.");
            $waReplyUrl = "https://wa.me/{$cleanPhone}?text={$waReplyMsg}";

            $adminHeaderBlock = "
            <div style='background: #181818; color: #fff; padding: 18px 20px; border-bottom: 3px solid #c86446; font-family: monospace;'>
                <div style='display: flex; justify-content: space-between; align-items: center;'>
                    <strong style='color: #c86446; font-size: 13px; letter-spacing: 0.08em;'>✦ WORKSHOP BAMBU STUDIO QUEUE ALERT</strong>
                    <span style='background: #c86446; color: #fff; padding: 2px 6px; font-size: 10px; font-weight: bold;'>ADMIN DISPATCH</span>
                </div>
                <div style='margin-top: 10px; font-size: 12px;'>
                    <strong>MAKERWORLD SLICER LINKS FOR THIS ORDER:</strong>
                    {$mwLinksListHtml}
                </div>
                <div style='margin-top: 14px; padding-top: 10px; border-top: 1px dashed rgba(255,255,255,0.2);'>
                    <a href='{$waReplyUrl}' style='background: #25D366; color: #fff; text-decoration: none; padding: 6px 12px; font-size: 11px; font-weight: bold; display: inline-block; border-radius: 2px;'>
                        WHATSAPP CUSTOMER ({$custPhone}) ↗
                    </a>
                </div>
            </div>";
        }

        // WhatsApp Customer Direct Link
        $waCustomerMsg = rawurlencode("Hello Kerf 3D Studio, I placed Order #{$orderNum}. Total: ৳{$total} BDT. Please verify my order.");
        $waCustomerUrl = "https://wa.me/8801754550297?text={$waCustomerMsg}";

        return <<<HTML
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Workshop Ticket #{$orderNum}</title>
</head>
<body style="margin: 0; padding: 20px; background-color: #f8f6f0; font-family: 'Space Mono', 'Courier New', monospace; color: #181818;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0" style="max-width: 600px; margin: 0 auto; background-color: #ffffff; border: 2px solid #181818;">
    <tr>
      <td style="padding: 0;">
        {$adminHeaderBlock}
        <div style="padding: 24px; border-bottom: 2px solid #181818; background-color: #f8f6f0;">
          <table width="100%">
            <tr>
              <td>
                <strong style="font-size: 18px; letter-spacing: -0.02em; color: #181818;">KERF 3D STUDIO</strong><br>
                <span style="font-size: 10px; color: #766e65; letter-spacing: 0.1em;">DHAKA WORKSHOP // INTAKE RECEIPT</span>
              </td>
              <td style="text-align: right;">
                <span style="background: #c86446; color: #fff; padding: 4px 8px; font-size: 11px; font-weight: bold;">TICKET #{$orderNum}</span>
              </td>
            </tr>
          </table>
        </div>
      </td>
    </tr>
    <tr>
      <td style="padding: 24px;">
        <p style="font-size: 13px; line-height: 1.6; margin-top: 0;">
          Hello <strong>{$custName}</strong>,<br>
          Your artifact order has entered our Dhaka studio manufacturing queue.
        </p>

        <table width="100%" style="margin: 20px 0; border-collapse: collapse;">
          <thead>
            <tr style="border-bottom: 2px solid #181818;">
              <th align="left" style="font-size: 10px; color: #766e65; padding-bottom: 8px;">SPECIMEN ITEM</th>
              <th align="right" style="font-size: 10px; color: #766e65; padding-bottom: 8px;">LINE TOTAL</th>
            </tr>
          </thead>
          <tbody>
            {$itemsHtml}
          </tbody>
        </table>

        <!-- Totals Ledger -->
        <table width="100%" style="margin-top: 14px; border-top: 2px solid #181818; padding-top: 10px;">
          <tr>
            <td style="font-size: 11px; color: #766e65; padding: 4px 0;">ARTIFACT SUBTOTAL</td>
            <td align="right" style="font-size: 11px; font-weight: bold;">৳{$subtotal}</td>
          </tr>
          <tr>
            <td style="font-size: 11px; color: #766e65; padding: 4px 0;">COURIER DISPATCH</td>
            <td align="right" style="font-size: 11px; font-weight: bold;">৳{$shipping}</td>
          </tr>
          <tr style="border-top: 1px dashed #e5e0d8;">
            <td style="font-size: 14px; font-weight: bold; color: #c86446; padding: 10px 0;">TOTAL DUE</td>
            <td align="right" style="font-size: 16px; font-weight: bold; color: #c86446; padding: 10px 0;">৳{$total} BDT</td>
          </tr>
        </table>

        <!-- Logistics & Payment Box -->
        <div style="background: #f8f6f0; border: 1px solid #e5e0d8; padding: 14px; margin-top: 20px; font-size: 11px; line-height: 1.6;">
          <strong>COURIER DISPATCH REGION:</strong> {$zoneLabel}<br>
          <strong>DELIVERY DESTINATION:</strong> {$address}<br>
          <strong>CONTACT PHONE:</strong> {$custPhone}<br>
          <hr style="border: 0; border-top: 1px dashed #e5e0d8; margin: 8px 0;">
          <strong>PAYMENT METHOD:</strong> {$payMethod}<br>
          <strong>SUBMITTED TrxID:</strong> <code style="background: #181818; color: #fff; padding: 2px 6px;">{$trxId}</code>
        </div>

        <p style="font-size: 11px; color: #766e65; line-height: 1.6; margin-top: 20px;">
          <strong>Next Step:</strong> We verify all mobile financial payments (bKash/Nagad: <code>01754550297</code>). Once verified, your print job will be sliced and assigned to our Bambu Lab A1 fleet.
        </p>

        <div style="margin-top: 18px; text-align: center;">
          <a href="{$waCustomerUrl}" style="background: #25D366; color: #fff; text-decoration: none; padding: 10px 18px; font-size: 12px; font-weight: bold; display: inline-block; border-radius: 2px;">
            DIRECT WHATSAPP CONFIRMATION (+880 1754-550297) ↗
          </a>
        </div>
      </td>
    </tr>
    <tr>
      <td style="padding: 14px 24px; background: #181818; color: #f8f6f0; font-size: 9px; text-align: center;">
        KERF 3D STUDIO · DHAKA, BANGLADESH · BAMBU LAB A1 PRECISION MANUFACTURING
      </td>
    </tr>
  </table>
</body>
</html>
HTML;
    }
}
