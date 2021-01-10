<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>

<?php
$arr = explode(" (", $riwayat['keterangan'], 2);
// $arr1 = explode(")",$arr[1],2); 
// echo $arr[0];
?>
<!-- Modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Keterangan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="<?= $arr[0] == "Berkas Fisik Diambil" ? "/dokumen/kembalikan/" : "/dokumen/keluar/"; ?><?= $dokumen['id']; ?>" method="post" class="d-block">
                    <?= csrf_field(); ?>
                    <?php if ($arr[0] == "Berkas Fisik Diambil") : ?>
                        <div class="row">
                            <div class="col-md-12">
                                <?php
                                if ($dokumen['no_filling_kabinet'] || $dokumen['nama_folder']) {
                                    echo "Tempat Sebelumnya : ";
                                    if ($dokumen['no_filling_kabinet'] && $dokumen['nama_folder']) {
                                        echo "Kabinet " . $dokumen['no_filling_kabinet'] . "/Folder " . $dokumen['nama_folder'];
                                    } else {
                                        if ($dokumen['no_filling_kabinet']) {
                                            echo "Kabinet " . $dokumen['no_filling_kabinet'];
                                        }
                                        if ($dokumen['nama_folder']) {
                                            echo "Folder " . $dokumen['nama_folder'];
                                        }
                                    }
                                }
                                ?>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Tempat</label>
                            <div class="col-sm-10 py-2">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="inlineRadio1" name="tempat" value="sama" checked>
                                    <label class="form-check-label" for="inlineRadio1">Sama Seperti Sebelumnya</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="inlineRadio2" name="tempat" value="tidak_sama">
                                    <label class="form-check-label" for="inlineRadio2">Tidak Sama</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row tempat">
                            <label class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="tempat_kabinet" value="option1">
                                    <label class="form-check-label" for="inlineCheckbox1">Nomor Filling Kabinet</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox2" name="tempat_folder" value="option2">
                                    <label class="form-check-label" for="inlineCheckbox2">Nama Folder</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row filling_kabinet">
                            <label for="nomor_filling_kabinet" class="col-sm-2 col-form-label">Nomor Filling Kabinet</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control " id="nomor_filling_kabinet" name="nomor_filling_kabinet">
                                <div class="invalid-feedback">
                                    Nomor Filling Kabinet Harus diisi.
                                </div>
                            </div>
                        </div>
                        <div class="form-group row nama_folder">
                            <label for="nama_folder" class="col-sm-2 col-form-label">Nama Folder</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="nama_folder" name="nama_folder">
                                <div class="invalid-feedback">
                                    Nama Folder Harus diisi.
                                </div>
                            </div>
                        </div>
                    <?php else : ?>
                        <input type="text" class="form-control" id="keterangan" name="keterangan">
                    <?php endif; ?>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Simpan</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- ============================================================== -->
<!-- Page wrapper  -->
<!-- ============================================================== -->
<div class="page-wrapper">
    <!-- ============================================================== -->
    <!-- Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <div class="page-breadcrumb bg-white">
        <div class="row align-items-center">
            <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                <h4 class="page-title text-uppercase font-medium font-14"><?= $title ?></h4>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
        <?php if (session()->getFlashData('pesan')) : ?>
            <div class="alert <?= session()->getFlashdata('jenis'); ?>" role="alert">
                <?= session()->getFlashdata('pesan'); ?>
            </div>
        <?php endif; ?>
        <div class="row">
            <div class="col-md-9 mx-auto">
                <h2 class="mt-3 text-center">Detail Dokumen</h2>
                <div class="card">
                    <div class="card-body">
                        <!-- <h5 class="card-title"><?= $dokumen['perihal']; ?></h5> -->
                        <div class="row mb-2">
                            <div class="col-md-6">
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        Nomor Surat
                                    </div>
                                    <div class="col-md-1">
                                        :
                                    </div>
                                    <div class="col-md-6">
                                        <?= $dokumen['no_surat']; ?>
                                    </div>
                                </div>
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        Perihal Surat
                                    </div>
                                    <div class="col-md-1">
                                        :
                                    </div>
                                    <div class="col-md-6">
                                        <?= $dokumen['perihal']; ?>
                                    </div>
                                </div>
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        Tanggal Pembuatan
                                    </div>
                                    <div class="col-md-1">
                                        :
                                    </div>
                                    <div class="col-md-6">
                                        <?= $dokumen['tgl_pembuatan']; ?>
                                    </div>
                                </div>
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        Tanggal Masuk
                                    </div>
                                    <div class="col-md-1">
                                        :
                                    </div>
                                    <div class="col-md-6">
                                        <?= $dokumen['created_at']; ?>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        Tempat
                                    </div>
                                    <div class="col-md-1">
                                        :
                                    </div>
                                    <div class="col-md-6">
                                        <?php
                                        if ($arr[0] == "Berkas Fisik Diambil") {
                                            echo $riwayat['keterangan'];
                                        } else {
                                            if ($dokumen['no_filling_kabinet'] || $dokumen['nama_folder']) {
                                                // echo "ada";
                                                if ($dokumen['no_filling_kabinet'] && $dokumen['nama_folder']) {
                                                    echo "Kabinet " . $dokumen['no_filling_kabinet'] . "/Folder " . $dokumen['nama_folder'];
                                                } else {
                                                    if ($dokumen['no_filling_kabinet']) {
                                                        echo "Kabinet " . $dokumen['no_filling_kabinet'];
                                                    }
                                                    if ($dokumen['nama_folder']) {
                                                        echo "Folder " . $dokumen['nama_folder'];
                                                    }
                                                }
                                            } else {
                                                echo "-";
                                            }
                                        }

                                        ?>
                                    </div>
                                </div>
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        Berkas Fisik
                                    </div>
                                    <div class="col-md-1">
                                        :
                                    </div>
                                    <div class="col-md-6">
                                        <?= $arr[0] == "Berkas Fisik Diambil" ? "Tidak Ada" : ($dokumen['no_filling_kabinet'] || $dokumen['nama_folder'] ? "Ada" : "Tidak Ada"); ?>
                                    </div>
                                </div>
                                <div class="row py-1">
                                    <div class="<?= $arr[0] == "Berkas Fisik Diambil" ? "col-md-6" : "col-md-4" ?>">
                                        <!-- Tombol Berkas Keluar -->
                                        <!-- <form action="/dokumen/keluar/<?= $dokumen['id']; ?>" method="post" class="d-block">
                                            <?= csrf_field(); ?>
                                            <button type="submit" class="py-0 btn btn-sm btn-danger rounded w-100" <?= $dokumen['no_filling_kabinet'] ? "" : "disabled"; ?>>Berkas Keluar</button>
                                        </form> -->

                                        <!-- Button trigger modal -->
                                        <button type="button" class="py-0 btn btn-sm rounded w-100 text-white <?= $arr[0] == "Berkas Fisik Diambil" ? "btn-success" : ($dokumen['no_filling_kabinet'] == "" && $dokumen['nama_folder'] == "" ? "btn-dark" : "btn-danger"); ?>" <?= $dokumen['no_filling_kabinet'] == "" && $dokumen['nama_folder'] == "" ? "disabled" : ""; ?> data-toggle="modal" data-target="#modal">
                                            <?= $arr[0] == "Berkas Fisik Diambil" ? "Kembalikan Berkas" : "Berkas Keluar"; ?>
                                        </button>
                                    </div>
                                </div>
                                <div class="row py-1">
                                    <div class="col-md-4">
                                        <!-- Tombol Download -->
                                        <a href="/download/<?= $dokumen['id']; ?>" class="py-0 btn btn-sm btn-success rounded text-white d-block">Download</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <embed type="application/pdf" src="/file/<?= $dokumen['file_surat'] ?>" width="600" height="600"></embed>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Container fluid  -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- footer -->
    <!-- ============================================================== -->
    <footer class="footer text-center"> 2020 © Aplikasi Manajemen Arsip Dokumen
    </footer>
    <!-- ============================================================== -->
    <!-- End footer -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Page wrapper  -->
<!-- ============================================================== -->
<?= $this->endSection(); ?>