<?php

namespace App\Commands;

use CodeIgniter\CLI\BaseCommand;
use CodeIgniter\CLI\CLI;

class EmailTest extends BaseCommand
{
    protected $group       = 'Kerf3D';
    protected $name        = 'email:test';
    protected $description = 'Test SMTP email delivery configuration for Kerf 3D Studio';

    protected $usage     = 'email:test [recipient_email]';
    protected $arguments = [
        'recipient_email' => 'Target email address (defaults to ADMIN_NOTIFICATION_EMAIL or kerf.3d@gmail.com)',
    ];

    public function run(array $params)
    {
        CLI::write('✦ Kerf 3D Studio — SMTP Email Diagnostic ✦', 'yellow');
        CLI::newLine();

        $recipient = $params[0] ?? env('ADMIN_NOTIFICATION_EMAIL', 'kerf.3d@gmail.com');

        $host     = env('email.SMTPHost', 'smtp.gmail.com');
        $port     = env('email.SMTPPort', 587);
        $crypto   = env('email.SMTPCrypto', 'tls');
        $user     = env('email.SMTPUser', 'kerf.3d@gmail.com');
        $pass     = env('email.SMTPPass', '');
        $fromMail = env('email.fromEmail', 'kerf.3d@gmail.com');
        $fromName = env('email.fromName', 'Kerf 3D Studio');

        CLI::write("Host:     {$host}:{$port}", 'cyan');
        CLI::write("Crypto:   {$crypto}", 'cyan');
        CLI::write("User:     {$user}", 'cyan');
        CLI::write("Pass:     " . (!empty($pass) ? '******** (configured)' : '[EMPTY — Please set email.SMTPPass in .env]'), empty($pass) ? 'red' : 'green');
        CLI::write("From:     {$fromName} <{$fromMail}>", 'cyan');
        CLI::write("To:       {$recipient}", 'cyan');
        CLI::newLine();

        if (empty($pass)) {
            CLI::error('[!] SMTP Password is empty in .env.');
            CLI::write("To send emails via Gmail:\n1. Go to https://myaccount.google.com/apppasswords\n2. Create an App Password for 'Kerf 3D Store'\n3. Paste the 16-character code into email.SMTPPass in .env\n", 'yellow');
            return;
        }

        CLI::write("Attempting to connect to {$host} and send test email...", 'yellow');

        $email = \Config\Services::email();
        $email->clear();
        $email->setFrom($fromMail, $fromName);
        $email->setTo($recipient);
        $email->setSubject("Workshop Verification — Kerf 3D Studio SMTP Test");
        $email->setMessage("
            <div style='font-family: monospace; padding: 24px; background: #f6f3eb; border: 1px solid #d4cebe; border-radius: 8px; color: #1c1917;'>
                <h2 style='color: #c86446; margin: 0 0 12px; font-size: 18px;'>KERF 3D STUDIO // SYSTEM VERIFICATION</h2>
                <p style='font-size: 14px; line-height: 1.6;'>This is a live notification test from your <strong>kerf3d.store</strong> order intake engine.</p>
                <p style='font-size: 14px; line-height: 1.6;'>SMTP outbound delivery is active via <code>{$host}:{$port} ({$crypto})</code>.</p>
                <hr style='border: 0; border-top: 1px dashed #b5ada0; margin: 18px 0;'>
                <small style='color: #78716c;'>Dhaka Additive Manufacturing Hub · " . date('Y-m-d H:i:s') . " UTC</small>
            </div>
        ");
        $email->setMailType('html');

        if ($email->send()) {
            CLI::write("✓ SUCCESS: Test email delivered successfully to {$recipient}!", 'green');
        } else {
            CLI::error("✗ FAILED: Unable to send email.");
            CLI::newLine();
            CLI::write($email->printDebugger(['headers', 'subject', 'body']), 'light_gray');
        }
    }
}
