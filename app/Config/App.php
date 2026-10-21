<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class App extends BaseConfig
{
    /**
     * Base Site URL
     */
    public string $baseURL = 'http://localhost:8080/';

    /**
     * Allowed Hostnames
     */
    public array $allowedHostnames = ['localhost', '127.0.0.1', 'kerf3d.store'];

    /**
     * Index File
     * Set to empty string for rewrite engines (OpenLiteSpeed, Nginx, Apache)
     */
    public string $indexPage = '';

    /**
     * URI Protocol
     */
    public string $uriProtocol = 'REQUEST_URI';

    /**
     * Default Locale
     */
    public string $defaultLocale = 'en';

    /**
     * Negotiate Locale
     */
    public bool $negotiateLocale = false;

    /**
     * Supported Locales
     */
    public array $supportedLocales = ['en', 'bn'];

    /**
     * Application Timezone
     * Dhaka, Bangladesh Standard Time (UTC+6)
     */
    public string $appTimezone = 'Asia/Dhaka';

    /**
     * Default Character Set
     */
    public string $charset = 'UTF-8';

    /**
     * Force Global Secure Requests
     */
    public bool $forceGlobalSecureRequests = false;

    /**
     * Reverse Proxy IPs
     */
    public string $proxyIPs = '';

    public function __construct()
    {
        parent::__construct();

        if ($envBaseURL = env('app.baseURL')) {
            $this->baseURL = rtrim($envBaseURL, '/') . '/';
        }
    }
}
