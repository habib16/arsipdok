<?php

namespace App\Models;

use CodeIgniter\Model;

class RiwayatModel extends Model
{
    
    protected $table = 'riwayat';
    protected $useTimestamps = true;
    protected $allowedFields = ['id','id_user', 'id_dokumen', 'no_surat','judul','keterangan','waktu'];

    public function getRiwayat($keterangan = false)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('riwayat');
        $builder->select('*');
        // join dengan tabel users
        $builder->join('users', 'users.id = riwayat.id_user');
        $builder->orderBy('riwayat.id', 'desc');
        $query;

        if ($keterangan !== false) {
            
            $query = $builder->like('keterangan', $keterangan, 'after');
        }
        $query = $builder->get();
        return $query;
    }

    // function untuk get riwayat terakhir
    public function getRiwayatAkhir($id){
        return $this->where(['id_dokumen' => $id])->orderBy('id', 'desc')->first();
    }

    // function untuk menyimpan Riwayat
    public function saveRiwayat($id, $no_surat, $perihal, $keterangan)
    {
        date_default_timezone_set('Asia/Jakarta');
        $db      = \Config\Database::connect();
        $builder = $db->table('riwayat');
        $data = [
            'no_surat' => $no_surat,
            'id_dokumen' => $id,
            'perihal' => $perihal,
            'id_user' => $_SESSION['logged_in'],
            'keterangan' => $keterangan,
            'waktu' => date("Y-m-d H:i:s")
        ];

        return $builder->insert($data);
    }

    function fuzzy_match($query, $target) {
        ##  set max substitution steps if set to 0
        $distance = 0;
        if ($distance == 0) {
            $length = strlen($query);
            if ($length > 10) {
                $distance = 4;
            }
            elseif ($length > 6) {
                $distance = 3;
            }
            elseif ($length == 5) {
                $distance = 5;
            }
            elseif($length >= 3) {
                $distance = 6;
            }
            else{
                $distance = 30;
            }
        }
        $lev = levenshtein(strtolower($query), strtolower($target));
        if ($lev <= $distance) {
           return array('match' => 1, 'distance' => $lev, 'max_distance' => $distance);
        }
        else {
           return array('match' => 0, 'distance' => $lev, 'max_distance' => $distance);
        }
        // return array($lev, $distance, $length);
    }

    function search($pencarian, $keterangan){
        ## check against database
        $match = array();
        $query = $this->getRiwayat($keterangan ?? false)->getResultArray();
        foreach($query as $row){
            $cek = $row['perihal'];

            $result = $this->fuzzy_match($pencarian, $cek);
            if ($result['match'] == 1) {
                array_push($match, $row);
                // break;
                
            }
        }
        return $match;
    }
}
