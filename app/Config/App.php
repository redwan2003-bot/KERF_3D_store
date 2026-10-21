<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;

class App extends BaseConfig
{
    public string $baseURL = 'http://localhost:8080/';
    public array $allowedHostnames = ['localhost', '127.0.0.1', 'kerf3d.store'];
    public string $indexPage = '';
    public string $uriProtocol = 'REQUEST_URI';
    public string $permittedURIChars = 'a-z 0-9~%.:_\-';
    public string $defaultLocale = 'en';
    public bool $negotiateLocale = false;
    public array $supportedLocales = ['en', 'bn'];
    public string $appTimezone = 'Asia/Dhaka';
    public string $charset = 'UTF-8';
    public bool $forceGlobalSecureRequests = false;
    public array $proxyIPs = [];
    public bool $CSPEnabled = false;

    public function __construct()
    {
        parent::__construct();

        if ($envBaseURL = env('app.baseURL')) {
            $this->baseURL = rtrim($envBaseURL, '/') . '/';
        }
    }
}
