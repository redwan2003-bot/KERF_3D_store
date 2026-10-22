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
        $username = trim((string) $this->request->getPost('username'));
        $password = trim((string) $this->request->getPost('password'));

        $expectedUser = env('ADMIN_USERNAME', 'admin');
        $expectedPass = env('ADMIN_PASSWORD', 'kerf3d_admin_secret_change_me');

        if ($username === $expectedUser && $password === $expectedPass) {
            $this->session->set([
                'is_admin_logged_in' => true,
                'admin_user'         => $username,
                'logged_in_at'       => time(),
            ]);

            return redirect()->to('/admin')->with('success', 'Authenticated as Studio Admin.');
        }

        return redirect()->back()->with('error', 'Invalid username or access key.');
    }

    public function logout()
    {
        $this->session->remove(['is_admin_logged_in', 'admin_user', 'logged_in_at']);
        return redirect()->to('/admin/login')->with('success', 'Logged out of Studio Admin session.');
    }
}
