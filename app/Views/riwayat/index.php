<?= $this->extend('layout/template'); ?>

<?= $this->section('content'); ?>


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
        <!-- /.col-lg-12 -->
    </div>
    <!-- ============================================================== -->
    <!-- End Bread crumb and right sidebar toggle -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Container fluid  -->
    <!-- ============================================================== -->
    <div class="container-fluid">
            <div class="row col-md-12 mb-2">
                <form role="search" class="row col-md-6" action="../riwayat/">
                        <!-- <div class="input-group col-md-6 mb-3 px-0"> -->
                            <input class="form-control py-2 col-md-6" type="search" placeholder="Search..." name="pencarian" value="<?= $pencarian ?? ''; ?>">
                            <div class="col-md-5 d-inline-block p-0">
                                <select class="form-control" id="keterangan" name="keterangan">
                                    <option value="" <?= $keterangan == "" ? "selected" : ""; ?>>Semua</option>
                                    <option value="Berkas Fisik Diambil" <?= $keterangan == "Berkas Fisik Diambil" ? "selected" : ""; ?>>Berkas Fisik Diambil</option>
                                    <option value="Ditambahkan" <?= $keterangan == "Ditambahkan" ? "selected" : ""; ?>>Ditambahkan</option>
                                    <option value="Dihapus" <?= $keterangan == "Dihapus" ? "selected" : ""; ?>>Dihapus</option>
                                    <option value="Diubah" <?= $keterangan == "Diubah" ? "selected" : ""; ?>>Diubah</option>
                                </select>
                            </div>
                            <div class="col-md-1">
                                <span class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                        <!-- </div> -->
                </form>
            <!-- </div> -->
            <!-- select box download sesuai keterangan -->
            <!-- <div class="form-group col-sm-6 d-inline-block  mb-0 row"> -->
                <form action="/riwayat/print" class="col-md-6 mb-0 text-right" method="post">
                    <?= csrf_field(); ?>
                    <input type="hidden" name="pencarian" value="<?= $pencarian ?? ""; ?>">
                    <input type="hidden" name="keterangan" value="<?= $keterangan ?? ""; ?>">
                    <button type="submit" class="btn btn-primary">Print</button>
                </form>
            </div>
        

        

        <table class="table">
            <?php if (session()->getFlashData('pesan')) : ?>
                <div class="alert alert-success" role="alert">
                    <?= session()->getFlashdata('pesan'); ?>
                </div>
            <?php endif; ?>
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nomor Surat</th>
                    <th scope="col">Perihal Surat</th>
                    <th scope="col">Keterangan</th>
                    <th scope="col">Pengguna</th>
                    <th scope="col">Waktu</th>
                </tr>
            </thead>
            <tbody>
                <?php $i = 1; ?>
                <?php foreach ($riwayat as $d) : ?>
                    <tr class="clickable-row" data-url="../dokumen/<?= $d['id_dokumen'] ?>">
                        <th scope="row"><?= $i++; ?></th>
                        <td><?= $d['no_surat']; ?></td>
                        <td><?= $d['perihal']; ?></td>
                        <td><?= $d['keterangan']; ?></td>
                        <td><?= $d['username']; ?></td>
                        <td><?= $d['waktu']; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
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