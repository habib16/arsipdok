<?php

namespace App\Controllers;

use TCPDF;

class Riwayat extends BaseController
{
    protected $riwayatModel;
    public function __construct()
    {
        $this->riwayatModel = new \App\Models\RiwayatModel();
    }
    public function index()
    {
        // $dokumen = $this->riwayatModel->findAll();
        $pencarian = $this->request->getVar("pencarian");
        $keterangan = $this->request->getVar("keterangan");

        $data = [
            'title' => 'Riwayat Surat',
            'riwayat' => $this->request->getVar("pencarian") || $this->request->getVar("keterangan") ? $this->riwayatModel->search($pencarian, $keterangan) : $this->riwayatModel->getRiwayat()->getResultArray(),
            'pencarian' => $pencarian,
            'keterangan' => $keterangan
        ];

        return view('riwayat/index', $data);
    }

    // function untuk print
    public function print(){
        $keterangan = empty($this->request->getVar('keterangan')) ? "Keseluruhan" : $this->request->getVar('keterangan');
        $data = [
            'title' => $keterangan,
            'riwayat' => $this->riwayatModel->getRiwayat($this->request->getVar('keterangan') ?? false)->getResultArray()
        ];
        $html = view('riwayat/print',$data);

        $pdf = new TCPDF('P', PDF_UNIT, 'A4', true, 'UTF-8', false);

		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor('Admin');
		$pdf->SetTitle('Laporan');
		$pdf->SetSubject('Laporan');

		$pdf->setPrintHeader(false);
		$pdf->setPrintFooter(false);

		$pdf->addPage();

		// output the HTML content
		$pdf->writeHTML($html, true, false, true, false, '');
		//line ini penting
		$this->response->setContentType('application/pdf');
		//Close and output PDF document
		$pdf->Output('laporan.pdf', 'I');
    }
}
