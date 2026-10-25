<?php

namespace App\Controllers;

use CodeIgniter\Exceptions\PageNotFoundException;

class Track extends BaseController
{
    public function index(): string
    {
        $ticketQuery = trim((string) $this->request->getGet('ticket'));
        $phoneQuery  = trim((string) $this->request->getGet('phone'));

        $order    = null;
        $customer = null;
        $items    = [];
        $searched = false;
        $error    = null;

        if (!empty($ticketQuery)) {
            $searched = true;
            $db = \Config\Database::connect();

            // Match by order_number (e.g., K3D-261025-1C95) or partial/exact
            $builder = $db->table('orders')->where('order_number', $ticketQuery);
            $order = $builder->get()->getRowArray();

            if ($order) {
                $customer = $db->table('customers')->where('id', $order['customer_id'])->get()->getRowArray();

                // Optional phone verification if provided
                if (!empty($phoneQuery)) {
                    $cleanedSearchPhone = preg_replace('/[^0-9]/', '', $phoneQuery);
                    $cleanedCustPhone   = preg_replace('/[^0-9]/', '', (string)($customer['phone'] ?? ''));
                    
                    // Match last 10 digits
                    if (substr($cleanedSearchPhone, -10) !== substr($cleanedCustPhone, -10)) {
                        $order = null;
                        $customer = null;
                        $error = "Phone number does not match workshop records for ticket {$ticketQuery}.";
                    }
                }

                if ($order) {
                    $items = $db->table('order_items')
                        ->select('order_items.*, products.makerworld_url as prod_mw_url, products.slug as prod_slug')
                        ->join('products', 'products.id = order_items.product_id', 'left')
                        ->where('order_items.order_id', $order['id'])
                        ->get()->getResultArray();

                    foreach ($items as &$it) {
                        if (empty($it['makerworld_url_snapshot']) && !empty($it['prod_mw_url'])) {
                            $it['makerworld_url_snapshot'] = $it['prod_mw_url'];
                        }
                    }
                }
            } else {
                $error = "No workshop order found matching ticket ID \"{$ticketQuery}\". Please check your ticket number and try again.";
            }
        }

        $data = [
            'title'       => 'Live Workshop Order Tracking — Kerf 3D Studio',
            'pageCss'     => ['track.css'],
            'ticketQuery' => $ticketQuery,
            'phoneQuery'  => $phoneQuery,
            'searched'    => $searched,
            'error'       => $error,
            'order'       => $order,
            'customer'    => $customer,
            'items'       => $items,
        ];

        return view('pages/track', $data);
    }
}
