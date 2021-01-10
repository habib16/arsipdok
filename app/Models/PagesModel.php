<?php

namespace App\Models;

use CodeIgniter\Model;

class PagesModel extends Model
{

    public function getDataMasuk()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('riwayat');
        $builder->select('*');
        $builder->like('keterangan', 'Ditambahkan');
        $query = $builder->countAllResults();
        return $query;
    }

    public function getDataKeluar()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('riwayat');
        $builder->select('*');
        $builder->like('keterangan', 'Berkas Fisik Diambil');
        $builder->orLike('keterangan', 'File keluar (Download)');
        $query = $builder->countAllResults();
        return $query;
    }

    public function getDataTotal()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('dokumen');
        // $builder->select('*');
        $query = $builder->countAllResults();
        return $query;
    }
}
