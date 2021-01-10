<?php

namespace App\Controllers;

use Ifsnop\Mysqldump as IMysqldump;

class Backup extends BaseController
{
    public function __construct()
    {
        $this->riwayatModel = new \App\Models\RiwayatModel();
    }
    public function index()
    {
        date_default_timezone_set("Asia/Jakarta");
        $waktu = date("Ymd-His");
        $files = glob('db/*');
        foreach($files as $file){
            unlink($file);
        }
        try {
            $dump = new IMysqldump\Mysqldump('mysql:host=localhost;dbname=db_arsip', 'root', '');
            $dump->start('db/'.$waktu.'-backup-db_arsip.sql');
            return redirect()->to('db/'.$waktu.'-backup-db_arsip.sql');
        } catch (\Exception $e) {
            echo 'mysqldump-php error: ' . $e->getMessage();
        }
    }
}
