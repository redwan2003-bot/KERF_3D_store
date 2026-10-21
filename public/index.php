<?php

/**
 * Kerf 3D Studio — Front Controller
 */

// Check PHP version requirement.
$minPhpVersion = '8.1';
if (version_compare(PHP_VERSION, $minPhpVersion, '<')) {
    $message = sprintf(
        'Your PHP version must be %s or higher to run CodeIgniter. Current version: %s',
        $minPhpVersion,
        PHP_VERSION
    );

    header('HTTP/1.1 503 Service Unavailable.', true, 503);
    echo $message;

    exit(1);
}

// Path to the front controller
define('FCPATH', __DIR__ . DIRECTORY_SEPARATOR);

// Ensure the current directory is pointing to the front controller's directory
if (getcwd() . DIRECTORY_SEPARATOR !== FCPATH) {
    chdir(FCPATH);
}

/*
 *---------------------------------------------------------------
 * BOOTSTRAP CODEIGNITER
 *---------------------------------------------------------------
 */

require FCPATH . '../app/Config/Paths.php';

$paths = new Config\Paths();

// Ensure vendor autoloader is present
$bootstrapFile = rtrim($paths->systemDirectory, '\\/ ') . DIRECTORY_SEPARATOR . 'bootstrap.php';

if (! file_exists($bootstrapFile)) {
    // If running in development without vendor installed yet, show helpful diagnostic
    header('Content-Type: text/html; charset=utf-8');
    echo '<!DOCTYPE html><html><head><title>Kerf 3D Studio</title><style>body{font-family:sans-serif;background:#f8f6f0;color:#181818;padding:40px;line-height:1.6;}code{background:#eae6dc;padding:3px 8px;border-radius:4px;}</style></head><body>';
    echo '<h1>Kerf 3D Studio — Additive Manufacturing Engine</h1>';
    echo '<p>Framework core is not yet loaded. Please run <code>composer install</code> in the project root to install dependencies.</p>';
    echo '<hr><p><small>Environment: Development | Dhaka, Bangladesh</small></p>';
    echo '</body></html>';
    exit(0);
}

require $bootstrapFile;

use CodeIgniter\CodeIgniter;

$app = new CodeIgniter($paths);
$app->initialize();
$context = is_cli() ? 'php-cli' : 'web';
$app->setContext($context);

$app->run();
