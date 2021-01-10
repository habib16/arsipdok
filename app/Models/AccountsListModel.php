<?php

namespace App\Models;

use CodeIgniter\Model;

class AccountsListModel extends Model
{
    protected $table = 'users';
    protected $useTimestamps = true;
    protected $allowedFields = ['id', 'email', 'username'];

    public function getAccount($id = false)
    {
        if ($id == false) {
            return $this->findAll();
        }

        return $this->where(['id' => $id])->first();
    }

    public function getDataMasuk()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('riwayat');
        $builder->select('*');
        $builder->like('keterangan', 'Ditambahkan');
        $query = $builder->countAllResults();
        return $query;
    }
}
