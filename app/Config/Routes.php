<?php

namespace Config;

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
$routes->setAutoRoute(false);

// ── Storefront Core Routes ──────────────────────────────────
$routes->get('/', 'Home::index');
$routes->get('shop', 'Shop::index');
$routes->get('product/(:segment)', 'Product::view/$1');
$routes->get('materials', 'Materials::index');

// ── Custom 3D Mesh Quote & Upload ───────────────────────────
$routes->get('quote', 'Quote::index');
$routes->post('quote/calculate', 'Quote::calculate');
$routes->post('quote/upload', 'Quote::upload');

// ── Cart & Session API ──────────────────────────────────────
$routes->get('cart', 'Cart::index');
$routes->post('cart/add', 'Cart::add');
$routes->post('cart/update', 'Cart::update');
$routes->post('cart/remove', 'Cart::remove');
$routes->get('cart/data', 'Cart::getCartData');

// ── Checkout & Order Intake ─────────────────────────────────
$routes->get('checkout', 'Checkout::index');
$routes->post('checkout/place-order', 'Checkout::placeOrder');
$routes->get('order/confirmed/(:segment)', 'Order::confirmed/$1');

// ── Studio Admin Routes (Protected) ─────────────────────────
$routes->group('admin', static function ($routes) {
    $routes->get('/', 'Admin\Dashboard::index');
    $routes->get('api/telemetry', 'Admin\Dashboard::telemetry');
    $routes->get('orders', 'Admin\Orders::index');
    $routes->get('orders/(:segment)', 'Admin\Orders::view/$1');
    $routes->post('orders/(:segment)/verify-payment', 'Admin\Orders::verifyPayment/$1');
    $routes->post('orders/(:segment)/status', 'Admin\Orders::updateStatus/$1');
    $routes->get('cad-uploads', 'Admin\CadUploads::index');
    $routes->get('drive-sync', 'Admin\Drive::index');
    $routes->post('drive-sync/run', 'Admin\Drive::runSync');
});
