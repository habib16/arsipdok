<?php

namespace App\Models;

use CodeIgniter\Model;

class DokumenModel extends Model
{
    protected $table = 'dokumen';
    protected $useTimestamps = true;
    protected $allowedFields = ['id', 'no_surat', 'perihal', 'slug', 'file_surat', 'no_filling_kabinet', 'nama_folder', 'tgl_pembuatan'];

    public function getDokumen($id = false)
    {
        if ($id == false) {
            return $this->findAll();
        }

        return $this->where(['id' => $id])->first();
    }

    // Get data dengan ID terbesar
    public function lastId()
    {
        return $this->orderBy('id', 'desc')->first();
    }

    function fuzzy_match($query, $target)
    {
        ##  set max substitution steps if set to 0
        $distance = 0;
        if ($distance == 0) {
            $length = strlen($query);
            if ($length > 15) {
                $distance = 5;
            } elseif ($length > 6) {
                $distance = 3;
            } elseif ($length == 5) {
                $distance = 5;
            } elseif ($length >= 3) {
                $distance = 6;
            } else {
                $distance = 20;
            }
        }
        $lev = levenshtein(strtolower($query), strtolower($target));
        if ($lev <= $distance) {
            return array('match' => 1, 'distance' => $lev, 'max_distance' => $distance);
        } else {
            return array('match' => 0, 'distance' => $lev, 'max_distance' => $distance);
        }
        // return array($lev, $distance, $length);
    }

    function search($data)
    {
        ## check against database
        $match = array();
        $query = $this->findAll();
        foreach ($query as $row) {
            $cek = $row['perihal'];

            $result = $this->fuzzy_match($data, $cek);
            if ($result['match'] == 1) {
                array_push($match, $row);
                // break;

            }
        }
        return $match;
    }
}
