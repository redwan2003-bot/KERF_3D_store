<?php

namespace App\Controllers;

use CodeIgniter\Controller;
use CodeIgniter\HTTP\ResponseInterface;

class Sitemap extends Controller
{
    public function index(): ResponseInterface
    {
        $db = \Config\Database::connect();
        
        // Fetch all active products
        $products = $db->table('products')
            ->select('slug, updated_at')
            ->where('status', 'active')
            ->orderBy('id', 'ASC')
            ->get()
            ->getResultArray();

        $baseUrl = rtrim(base_url(), '/');
        $now = date('Y-m-d');

        $xml = '<?xml version="1.0" encoding="UTF-8"?>' . "\n";
        $xml .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">' . "\n";

        // Static core routes
        $staticRoutes = [
            ['loc' => $baseUrl . '/', 'priority' => '1.0', 'changefreq' => 'daily', 'lastmod' => $now],
            ['loc' => $baseUrl . '/shop', 'priority' => '0.9', 'changefreq' => 'daily', 'lastmod' => $now],
            ['loc' => $baseUrl . '/quote', 'priority' => '0.9', 'changefreq' => 'weekly', 'lastmod' => $now],
            ['loc' => $baseUrl . '/materials', 'priority' => '0.8', 'changefreq' => 'weekly', 'lastmod' => $now],
            ['loc' => $baseUrl . '/track', 'priority' => '0.7', 'changefreq' => 'daily', 'lastmod' => $now],
            ['loc' => $baseUrl . '/privacy', 'priority' => '0.3', 'changefreq' => 'monthly', 'lastmod' => $now],
            ['loc' => $baseUrl . '/terms', 'priority' => '0.3', 'changefreq' => 'monthly', 'lastmod' => $now],
        ];

        foreach ($staticRoutes as $route) {
            $xml .= '  <url>' . "\n";
            $xml .= '    <loc>' . htmlspecialchars($route['loc']) . '</loc>' . "\n";
            $xml .= '    <lastmod>' . $route['lastmod'] . '</lastmod>' . "\n";
            $xml .= '    <changefreq>' . $route['changefreq'] . '</changefreq>' . "\n";
            $xml .= '    <priority>' . $route['priority'] . '</priority>' . "\n";
            $xml .= '  </url>' . "\n";
        }

        // Dynamic Product Specimen Pages
        foreach ($products as $p) {
            $lastmod = !empty($p['updated_at']) ? date('Y-m-d', strtotime($p['updated_at'])) : $now;
            $url = $baseUrl . '/product/' . $p['slug'];
            
            $xml .= '  <url>' . "\n";
            $xml .= '    <loc>' . htmlspecialchars($url) . '</loc>' . "\n";
            $xml .= '    <lastmod>' . $lastmod . '</lastmod>' . "\n";
            $xml .= '    <changefreq>weekly</changefreq>' . "\n";
            $xml .= '    <priority>0.8</priority>' . "\n";
            $xml .= '  </url>' . "\n";
        }

        $xml .= '</urlset>';

        return $this->response
            ->setHeader('Content-Type', 'application/xml; charset=utf-8')
            ->setBody($xml);
    }
}
