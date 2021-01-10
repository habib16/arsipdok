<?php

namespace App\Controllers;

class Pages extends BaseController
{
    protected $pagesModel;
    public function __construct()
    {
        $this->pagesModel = new \App\Models\PagesModel();
    }

	public function index()
	{
		$data = [
            'title' => 'Dashboard',
            'data_masuk' => $this->pagesModel->getDataMasuk(), 
            'data_keluar' => $this->pagesModel->getDataKeluar(),
            'data_total' => $this->pagesModel->getDataTotal()
		];
		
		return view('pages/home', $data);
	}

    public function input()
    {
        $data = [
            'title' => 'Tambah Data'
        ];
        return view('pages/create', $data);
    }

    public function rincian_dok()
    {
        return view('dokumen/index');
    }
}
