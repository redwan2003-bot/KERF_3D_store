<?php

namespace App\Controllers;

class Materials extends BaseController
{
    public function index(): string
    {
        $data = [
            'title'   => 'Bambu Lab A1 Workshop & Materials Guide — Kerf 3D Studio',
            'pageCss' => ['materials.css'],
        ];

        return view('pages/materials', $data);
    }
}
