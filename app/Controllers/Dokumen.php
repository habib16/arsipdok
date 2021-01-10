<?php

namespace App\Controllers;

class Dokumen extends BaseController
{
    protected $dokModel;
    protected $riwayatModel;
    public function __construct()
    {
        $this->dokModel = new \App\Models\DokumenModel();
        $this->riwayatModel = new \App\Models\RiwayatModel();
    }

    public function index()
    {
        // $dokumen = $this->dokModel->findAll();
        // $data = [
        //     'title' => 'List Surat',
        //     'dokumen' => $this->dokModel->getDokumen()
        // ];

        // return view('dokumen/index', $data);
        $currentPage = $this->request->getVar('page_dokumen') ? $this->request->getVar('page_dokumen') : 1;
        $query = $this->request->getVar("pencarian");
        $data = [
            'title' => 'List Surat',
            'dokumen' => $this->request->getVar("pencarian") ? $this->dokModel->search($query) : $this->dokModel->paginate(100, 'dokumen'),
            'pencarian' => $query,
            'pager' => $this->dokModel->pager,
            'currentPage' => $currentPage

        ];


        return view('dokumen/index', $data);
    }

    public function detail($id)
    {

        $data = [
            'title' => 'Detail Dokumen',
            'dokumen' => $this->dokModel->getDokumen($id),
            'riwayat' => $this->riwayatModel->getRiwayatAkhir($id)
        ];

        //jika id tidak ada di tabel

        if (empty($data['dokumen'])) {
            throw new \CodeIgniter\Exceptions\PageNotFoundException('id' . $id . 'Tidak Ditemukan');
        }

        return view('dokumen/detail', $data);
    }

    public function create()
    {

        $data = [
            'title' => 'Form Tambah Data',
            'validation' => \Config\Services::validation()
        ];

        return view('pages/create', $data);
    }

    public function save()
    {
        // Array untuk Validation
        $validationData = [
            'no_surat' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Nomor Surat Harus diisi.'
                ]
            ],
            'perihal' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Perihal Harus diisi.'
                ]
            ],
            'tanggal_pembuatan' => [
                'rules' => 'required|valid_date',
                'errors' => [
                    'required' => '{field} Tanggal Pembuatan Harus di isi.'
                ]
            ],
            'file_surat' => 'uploaded[file_surat]|max_size[file_surat,10240]|ext_in[file_surat,pdf]'
        ];


        // cek apabila berkas fisik ada maka validasi dibawah akan digunakan
        if ($this->request->getVar('berkas_fisik') == "ada") {
            if ($this->request->getVar('tempat_kabinet') == "option1") {
                $validationData["nomor_filling_kabinet"] = [
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} Nomor Filling Kabinet Harus diisi.'
                    ]
                ];
            }
            if ($this->request->getVar('tempat_folder') == "option2") {
                $validationData["nama_folder"] = [
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} Nama Folder Harus diisi.'
                    ]
                ];
            }
        }

        //validasi input
        if (!$this->validate($validationData)) {
            // $validation = \Config\Services::validation();
            // dd($validation);
            // return redirect()->to('/pages/input')->withInput()->with('validation', $validation);
            return redirect()->to('/pages/input')->withInput();
            //  $data['validation'] = $validation
            // return view('/pages/input', $data);
        }

        //ambil file
        $ambilFIle = $this->request->getFile('file_surat');
        //pindah file 
        $ambilFIle->move('file');
        // ambil file upload
        $namaFile = $ambilFIle->getName();

        $slug = url_title($this->request->getVar('perihal'), '-', true);
        // Array untuk save data
        $saveData = [
            'no_surat' => $this->request->getVar('no_surat'),
            'perihal' => $this->request->getVar('perihal'),
            'slug' => $slug,
            'tgl_pembuatan' => date($this->request->getVar('tanggal_pembuatan')),
            'file_surat' => $namaFile
        ];

        // cek apabila berkas fisik ada maka save data dibawah akan digunakan
        if ($this->request->getVar('berkas_fisik') == "ada") {
            if ($this->request->getVar('tempat_kabinet') == "option1") {
                $saveData["no_filling_kabinet"] = $this->request->getVar('nomor_filling_kabinet');
            }
            if ($this->request->getVar('tempat_folder') == "option2") {
                $saveData["nama_folder"] = $this->request->getVar('nama_folder');
            }
        }

        $this->dokModel->save($saveData);

        //cari id terbesar atau data terbaru dari database
        $file = $this->dokModel->lastId();

        $this->riwayatModel->saveRiwayat($file['id'], $file['no_surat'], $file['perihal'], "Ditambahkan");

        session()->setFLashData('pesan', 'Data Berhasil ditambahkan');

        return redirect()->to('/pages/input');
    }

    public function delete($id)
    {
        //cari berdasarkan id
        $file = $this->dokModel->find($id);

        //hapus file
        unlink('file/' . $file['file_surat']);


        $this->dokModel->delete($id);

        $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "Dihapus");


        session()->setFLashData('pesan', 'Data Berhasil dihapus');
        return redirect()->to('/dokumen');
    }

    public function edit($id)
    {
        $data = [
            'title' => 'Form ubah Data',
            'validation' => \Config\Services::validation(),
            'dokumen' => $this->dokModel->getDokumen($id)
        ];

        return view('pages/edit', $data);
    }
    public function update($id)
    {
        $validation = \Config\Services::validation();
        // Array untuk Validation
        $validationData = [
            'no_surat' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} harus di isi.'
                ]
            ],
            'perihal' => [
                'rules' => 'required',
                'errors' => [
                    'required' => '{field} Perihal Harus di isi.'
                ]
            ],
            'tanggal_pembuatan' => [
                'rules' => 'required|valid_date',
                'errors' => [
                    'required' => '{field} Tanggal Pembuatan Harus di isi.'
                ]
            ]
        ];

        //kelola ambil file untuk di update
        $gFile = $this->request->getFile('file_surat');

        // jika File tidak kosong maka pengaturan file dibawah akan digunakan
        if (!empty($gFile->getName())) {
            $validationData['file_surat'] = 'uploaded[file_surat]|max_size[file_surat,10240]|ext_in[file_surat,pdf]';
        }

        // cek apabila berkas fisik ada maka validasi dibawah akan digunakan
        if ($this->request->getVar('berkas_fisik') == "ada") {
            if ($this->request->getVar('tempat_kabinet') == "option1") {
                $validationData["nomor_filling_kabinet"] = [
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} Nomor Filling Kabinet Harus diisi.'
                    ]
                ];
            }
            if ($this->request->getVar('tempat_folder') == 'option2') {
                $validationData["nama_folder"] = [
                    'rules' => 'required',
                    'errors' => [
                        'required' => '{field} Nama Folder Harus diisi.'
                    ]
                ];
            }
        }

        if (!$this->validate($validationData)) {
            $validation = \Config\Services::validation();

            // return redirect()->to('/pages/edit' . $id)->withInput()->with('validation', $validation);
            return redirect()->to('/pages/edit' . $id)->withInput();
        }



        // inisialisasi Variabel
        $keterangan = "";
        $fileBaru = "";

        //cek yang di update apakah tidak ganti file
        if (empty($gFile->getName())) {
            $fileBaru = $this->request->getVar('fileLama');
        } else {
            if ($gFile->getError() == 4) {
                $fileBaru = $this->request->getVar('fileLama');
            } else {
                unlink('file/' . $this->request->getVar('fileLama'));
                $fileBaru = $gFile->getName();
                // upload file
                $gFile->move('file');

                //hapus file lama
            }
        }

        //cari berdasarkan id
        $file = $this->dokModel->find($id);
        $arrayList = ['no_surat', 'perihal', 'file_surat', 'no_filling_kabinet', 'nama_folder', 'tgl_pembuatan'];
        $keteranganList = ['No Surat', 'Perihal', 'File Surat', 'Nomor Filling Kabinet', 'Nama Folder', 'Tanggal Pembuatan'];
        $data = [
            'no_surat' => $this->request->getVar('no_surat'),
            'perihal' => $this->request->getVar('perihal'),
            'tgl_pembuatan' => $this->request->getVar('tanggal_pembuatan'),
            'no_filling_kabinet' => $this->request->getVar('nomor_filling_kabinet'),
            'nama_folder' => $this->request->getVar('nama_folder') ?? '',
            'file_surat' => $fileBaru
        ];
        for ($i = 0; $i < count($arrayList); $i++) {
            if (empty($keterangan)) {
                if ($file[$arrayList[$i]] !== $data[$arrayList[$i]]) {
                    $keterangan .= "Diubah (" . $keteranganList[$i];
                }
            } else {
                if ($file[$arrayList[$i]] !== $data[$arrayList[$i]]) {
                    $keterangan .= ", " . $keteranganList[$i];
                }
            }
        }
        if (!empty($keterangan)) {
            $keterangan .= ")";
            $this->riwayatModel->saveRiwayat($file['id'], $file['no_surat'], $file['perihal'], $keterangan);
        }
        var_dump($keterangan);

        $slug = url_title($this->request->getVar('perihal'), '-', true);
        // Array untuk edit data
        $saveData = [
            'id' => $id,
            'no_surat' => $this->request->getVar('no_surat'),
            'perihal' => $this->request->getVar('perihal'),
            'slug' => $slug,
            'tgl_pembuatan' => $this->request->getVar('tanggal_pembuatan'),
            'file_surat' => $fileBaru
        ];

        // cek apabila berkas fisik ada maka save data dibawah akan digunakan
        if ($this->request->getVar('berkas_fisik') == "ada") {
            if ($this->request->getVar('tempat_kabinet') == "option1") {
                $saveData["no_filling_kabinet"] = $this->request->getVar('nomor_filling_kabinet');
            }
            if ($this->request->getVar('tempat_folder') == "option2") {
                $saveData["nama_folder"] = $this->request->getVar('nama_folder');
            }
        }
        // var_dump($saveData);
        $this->dokModel->save($saveData);

        session()->setFLashData('pesan', 'Data Berhasil diubah');

        return redirect()->to('/dokumen');
    }

    // function untuk dokumen keluar
    public function keluar($id)
    {
        //cari berdasarkan id
        $file = $this->dokModel->find($id);

        if ($file["no_filling_kabinet"] || $file["nama_folder"]) {
            if (empty($this->request->getVar('keterangan'))) {
                session()->setFLashData('pesan', 'Keterangan tidak boleh kosong');
                session()->setFLashData('jenis', 'alert-danger');
                return redirect()->to('/dokumen/' . $id);
            }
            $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "Berkas Fisik Diambil (" . $this->request->getVar('keterangan') . ")");
            session()->setFLashData('pesan', 'Sukses');
            session()->setFLashData('jenis', 'alert-success');
            return redirect()->to('/dokumen/' . $id);
        } else {
            session()->setFLashData('pesan', 'Gagal');
            return redirect()->to('/dokumen/' . $id);
        }
    }

    // function untuk dokumen keluar
    public function kembalikan($id)
    {
        //cari berdasarkan id
        $file = $this->dokModel->find($id);
        if ($this->request->getVar('tempat') == "sama") {
            $keterangan = "";
            if ($file['no_filling_kabinet'] && $file['nama_folder']) {
                $keterangan = "Kabinet " . $file['no_filling_kabinet'] . "/Folder " . $file['nama_folder'];
            } else {
                if ($file['no_filling_kabinet']) {
                    $keterangan = "Kabinet " . $file['no_filling_kabinet'];
                }
                if ($file['nama_folder']) {
                    $keterangan = "Folder " . $file['nama_folder'];
                }
            }
            $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "Berkas Fisik Dikembalikan (" . $keterangan . ")");
            session()->setFLashData('pesan', 'Sukses');
            session()->setFLashData('jenis', 'alert-success');
            return redirect()->to('/dokumen/' . $id);
        } else {
            if ($this->request->getVar('tempat_kabinet') == "option1" || $this->request->getVar('tempat_folder') == "option2") {
                if ($this->request->getVar('tempat_kabinet') == "option1" && $this->request->getVar('tempat_folder') == "option2") {
                    if (empty($this->request->getVar('nomor_filling_kabinet')) && empty($this->request->getVar('nama_folder'))) {
                        session()->setFLashData('pesan', 'Nomor Filling Kabinet dan Nama Folder tidak boleh kosong');
                        session()->setFLashData('jenis', 'alert-danger');
                    }
                    $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "Berkas Fisik Dikembalikan (Kabinet " . $this->request->getVar('nomor_filling_kabinet') . "/Folder " . $this->request->getVar('nama_folder') . ")");
                    session()->setFLashData('pesan', 'Sukses');
                    session()->setFLashData('jenis', 'alert-success');
                } else {
                    if ($this->request->getVar('tempat_kabinet') == "option1") {
                        if (empty($this->request->getVar('nomor_filling_kabinet'))) {
                            session()->setFLashData('pesan', 'Nomor Filling Kabinet tidak boleh kosong');
                            session()->setFLashData('jenis', 'alert-danger');
                        }
                        $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "Berkas Fisik Dikembalikan (Kabinet " . $this->request->getVar('nomor_filling_kabinet') . ")");
                        session()->setFLashData('pesan', 'Sukses');
                        session()->setFLashData('jenis', 'alert-success');
                    }
                    if ($this->request->getVar('tempat_folder') == "option2") {
                        if (empty($this->request->getVar('nama_folder'))) {
                            session()->setFLashData('pesan', 'Nama Folder tidak boleh kosong');
                            session()->setFLashData('jenis', 'alert-danger');
                        }
                        $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "Berkas Fisik Dikembalikan (Folder " . $this->request->getVar('nama_folder') . ")");
                        session()->setFLashData('pesan', 'Sukses');
                        session()->setFLashData('jenis', 'alert-success');
                    }
                }
            } else {
                session()->setFLashData('pesan', 'Gagal');
                session()->setFLashData('jenis', 'alert-danger');
            }


            $saveData = [
                'id' => $id,
                'no_filling_kabinet' => $this->request->getVar('nomor_filling_kabinet') ?? "",
                'nama_folder' => $this->request->getVar('nama_folder') ?? ""
            ];
            $this->dokModel->save($saveData);
            return redirect()->to('/dokumen/' . $id);
        }
    }

    public function download($id)
    {
        //cari berdasarkan id
        $file = $this->dokModel->find($id);

        $this->riwayatModel->saveRiwayat($id, $file['no_surat'], $file['perihal'], "File keluar (Download)");

        return redirect()->to('/file/' . $file['file_surat']);
    }

    public function search($query)
    {
        // $dokumen = $this->dokModel->findAll();
        $data = [
            'title' => 'List Surat',
            'dokumen' => $this->dokModel->search($query),
            'pencarian' => $query
        ];

        return view('dokumen/index', $data);
    }
}
