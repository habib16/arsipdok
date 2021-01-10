<?php

namespace App\Controllers;

class AccountsList extends BaseController
{
    protected $accountsListModel;
    public function __construct()
    {
        $this->accountsListModel = new \App\Models\AccountsListModel();
    }

    public function index()
    {

        $data = [
            'title' => 'List Akun',
            'user' => $this->accountsListModel->getAccount()
        ];
        return view('accounts_list/home', $data);
    }

    public function input()
    {
        $data = [
            'title' => 'Tambah Data'
        ];
        return view('accounts_list/create', $data);
    }
    public function delete($id)
    {
        $this->accountsListModel->delete($id);


        session()->setFLashData('pesan', 'Data Berhasil dihapus');
        return redirect()->to('/accountslist');
    }
    public function edit($id)
    {
        $data = [
            'title' => 'Form ubah Data',
            'validation' => \Config\Services::validation(),
            'akun' => $this->accountsListModel->getAccount($id)
        ];

        return view('accounts_list/edit', $data);
    }
    public function update($id)
    {
        $validation = \Config\Services::validation();
        // Array untuk Validation
        $validationData = [
            'username' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus di isi.'
                ]
            ],
            'email' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Perihal Harus di isi.'
                ]
            ],
        ];
        $saveData = [
            'username' => $this->request->getVar('username'),
            'email' => $this->request->getVar('email'),
        ];
        $this->accountsListModel->save($saveData);

        session()->setFLashData('pesan', 'Data Berhasil diubah');

        return redirect()->to('/accountslist');
    }
}
