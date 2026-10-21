<?php

namespace Config;

use CodeIgniter\Database\Config;

class Database extends Config
{
    /**
     * Directory containing Database Migrations & Seeds
     */
    public string $filesPath = APPPATH . 'Database' . DIRECTORY_SEPARATOR;

    /**
     * Default connection group
     */
    public string $defaultGroup = 'default';

    /**
     * Primary Database Connection (MySQL 8.0+ / MariaDB 10.11+)
     */
    public array $default = [
        'DSN'          => '',
        'hostname'     => '127.0.0.1',
        'username'     => 'kerf3d_user',
        'password'     => 'kerf3d_secret',
        'database'     => 'kerf3d_store',
        'DBDriver'     => 'MySQLi',
        'DBPrefix'     => '',
        'pConnect'     => false,
        'DBDebug'      => true,
        'charset'      => 'utf8mb4',
        'DBCollat'     => 'utf8mb4_unicode_ci',
        'swapPre'      => '',
        'encrypt'      => false,
        'compress'     => false,
        'strictOn'     => false,
        'failover'     => [],
        'port'         => 3306,
        'numberNative' => false,
        'dateFormat'   => [
            'date'     => 'Y-m-d',
            'datetime' => 'Y-m-d H:i:s',
            'time'     => 'H:i:s',
        ],
    ];

    /**
     * Test Suite Database Connection
     */
    public array $tests = [
        'DSN'         => '',
        'hostname'    => '127.0.0.1',
        'username'    => '',
        'password'    => '',
        'database'    => ':memory:',
        'DBDriver'    => 'SQLite3',
        'DBPrefix'    => 'db_',
        'pConnect'    => false,
        'DBDebug'     => true,
        'charset'     => 'utf8',
        'DBCollat'    => '',
        'swapPre'     => '',
        'encrypt'     => false,
        'compress'    => false,
        'strictOn'    => false,
        'failover'    => [],
        'port'        => 3306,
        'foreignKeys' => true,
        'busyTimeout' => 1000,
        'dateFormat'  => [
            'date'     => 'Y-m-d',
            'datetime' => 'Y-m-d H:i:s',
            'time'     => 'H:i:s',
        ],
    ];

    public function __construct()
    {
        parent::__construct();

        if (ENVIRONMENT === 'testing') {
            $this->defaultGroup = 'tests';
        }

        // Override defaults with environment variables if present
        if ($host = env('database.default.hostname')) {
            $this->default['hostname'] = $host;
        }
        if ($db = env('database.default.database')) {
            $this->default['database'] = $db;
        }
        if ($user = env('database.default.username')) {
            $this->default['username'] = $user;
        }
        if ($pass = env('database.default.password')) {
            $this->default['password'] = $pass;
        }
        if ($port = env('database.default.port')) {
            $this->default['port'] = (int) $port;
        }
    }
}
