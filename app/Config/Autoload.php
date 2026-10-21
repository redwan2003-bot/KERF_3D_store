<?php

namespace Config;

use CodeIgniter\Config\AutoloadConfig;

class Autoload extends AutoloadConfig
{
    /**
     * Map namespaces to filesystem directories
     */
    public $psr4 = [
        APP_NAMESPACE => APPPATH,
        'Config'      => APPPATH . 'Config',
    ];

    /**
     * Class map for non-PSR-4 compliant classes
     */
    public $classmap = [];

    /**
     * Helper or procedural files to load automatically
     */
    public $files = [];
}
