<?php

namespace App\Controllers;

class Home extends BaseController
{
	protected $homeModel;
    public function __construct()
    {
        $this->homeModel = new \App\Models\HomeModel();
	}
	
	public function index()
	{
		$data = [
            'title' => 'Dashboard',
            'data_masuk' => $this->homeModel->getDataMasuk()
		];
		
		return view('pages/home', $data);
	}

	//--------------------------------------------------------------------

}
