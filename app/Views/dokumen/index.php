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
        <!-- ============================================================== -->
        <!-- Search -->
        <!-- ============================================================== -->
        <form role="search" action="../dokumen/">
            <div class="input-group col-md-4 mb-3 px-0">
                <input class="form-control py-2" type="search" placeholder="Search..." name="pencarian" value="<?= $pencarian ?? ''; ?>">
                <span class="input-group-append">
                    <button class="btn btn-outline-secondary" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </span>
            </div>
        </form>
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
                    <th scope="col">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php $i = 1 + (100 * ($currentPage - 1)); ?>
                <?php foreach ($dokumen as $d) : ?>
                    <tr>
                        <th scope="row"><?= $i++; ?></th>
                        <td><?= $d['no_surat']; ?></td>
                        <td><?= $d['perihal']; ?></td>
                        <td>
                            <a href="/dokumen/<?= $d['id']; ?>" class="btn btn-success text-white">Rincian</a>
                            <a href="/pages/edit<?= $d['id']; ?>" class="btn btn-warning">Edit</a>

                            <form action="/dokumen/<?= $d['id']; ?>" method="post" class="d-inline">
                                <?= csrf_field(); ?>
                                <input type="hidden" name="_method" value="DELETE">
                                <button type="submit" class="btn btn-danger" onclick="return confirm('Apakah Anda Yakin ?')">Delete</button>
                            </form>

                            <!-- Tombol Berkas Keluar -->
                            <!-- <form action="/dokumen/keluar/<?= $d['id']; ?>" method="post" class="d-inline">
                                <?= csrf_field(); ?>
                                <button type="submit" class="btn btn-danger" >Berkas Keluar</button>
                            </form> -->

                            <!-- Tombol Download -->
                            <a href="/download/<?= $d['id']; ?>" class="btn btn-success text-white">Download</a>
                        </td>
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