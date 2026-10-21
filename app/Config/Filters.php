<?php

namespace Config;

use CodeIgniter\Config\BaseConfig;
use CodeIgniter\Filters\CSRF;
use CodeIgniter\Filters\DebugToolbar;
use CodeIgniter\Filters\Honeypot;
use CodeIgniter\Filters\InvalidChars;
use CodeIgniter\Filters\SecureHeaders;

class Filters extends BaseConfig
{
    /**
     * Filter Aliases
     */
    public array $aliases = [
        'csrf'          => CSRF::class,
        'toolbar'       => DebugToolbar::class,
        'honeypot'      => Honeypot::class,
        'invalidchars'  => InvalidChars::class,
        'secureheaders' => SecureHeaders::class,
    ];

    /**
     * Special Required Filters
     */
    public array $required = [
        'before' => [],
        'after'  => [],
    ];

    /**
     * Global Filters applied to every request
     */
    public array $globals = [
        'before' => [
            // 'csrf',
        ],
        'after' => [
            // 'toolbar',
        ],
    ];

    public array $methods = [];

    public array $filters = [];
}
