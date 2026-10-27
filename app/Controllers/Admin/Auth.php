<?php

namespace App\Controllers\Admin;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class Auth extends BaseController
{
    public function login(): string
    {
        if ($this->session->get('is_admin_logged_in')) {
            return redirect()->to('/admin');
        }

        $data = [
            'title'   => 'Studio Admin Authentication — Kerf 3D Studio',
            'pageCss' => ['global-tokens.css'],
        ];

        return view('admin/login', $data);
    }

    public function attemptLogin()
    {
        $throttler   = \Config\Services::throttler();
        $clientIp    = $this->request->getIPAddress();
        $throttleKey = md5('admin_login_' . $clientIp);

        // Security: Restrict to max 5 authentication attempts per 60 seconds per IP
        if ($throttler->check($throttleKey, 5, 60) === false) {
            $lockSeconds = $throttler->getTokenTime();
            log_message('warning', "Admin login rate limit exceeded from IP {$clientIp}");
            return redirect()->back()->with('error', "Security Alert: Rate limit exceeded. Access locked for {$lockSeconds} seconds.");
        }

        $username = trim((string) $this->request->getPost('username'));
        $password = trim((string) $this->request->getPost('password'));

        $expectedUser = env('ADMIN_USERNAME', 'admin');
        $expectedPass = env('ADMIN_PASSWORD', 'kerf3d_admin_secret_change_me');

        // Timing-attack resistant verification
        $userMatch = hash_equals($expectedUser, $username);
        $passMatch = hash_equals($expectedPass, $password);

        if ($userMatch && $passMatch) {
            // Prevent session fixation attack
            $this->session->regenerate();

            $this->session->set([
                'is_admin_logged_in' => true,
                'admin_user'         => $username,
                'logged_in_at'       => time(),
                'logged_in_ip'       => $clientIp,
            ]);

            log_message('info', "Admin operator authenticated successfully from IP {$clientIp}");
            return redirect()->to('/admin')->with('success', 'Authenticated as Studio Admin.');
        }

        log_message('notice', "Failed admin authentication attempt for user '{$username}' from IP {$clientIp}");
        return redirect()->back()->with('error', 'Invalid operator identifier or security access key.');
    }

    public function logout()
    {
        $this->session->remove(['is_admin_logged_in', 'admin_user', 'logged_in_at', 'logged_in_ip']);
        $this->session->regenerate();
        return redirect()->to('/admin/login')->with('success', 'Logged out of Studio Admin session.');
    }
}
