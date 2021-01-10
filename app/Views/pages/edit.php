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
        <div class="content">
            <h1>Ubah data!</h1>
            <?php if (session()->getFlashData('pesan')) : ?>
                <div class="alert alert-success" role="alert">
                    <?= session()->getFlashdata('pesan'); ?>
                </div>
            <?php endif; ?>
            <form action="/dokumen/update/<?= $dokumen['id']; ?>" method="post" enctype="multipart/form-data">
                <?= csrf_field(); ?>
                <div class="form-group row">
                    <label for="no_surat" class="col-sm-2 col-form-label">Nomor Surat</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control <?= (\Config\Services::validation()->hasError('no_surat')) ? 'is-invalid' : ''; ?>" id="no_surat" name="no_surat" value="<?= $dokumen['no_surat']; ?>" autofocus>
                        <div class="invalid-feedback">
                            Harus di isi
                        </div>
                    </div>
                </div>
                <input type="hidden" name="slug" value="<?= $dokumen['slug']; ?>">
                <input type="hidden" name="fileLama" value="<?= $dokumen['file_surat']; ?>">
                <div class="form-group row">
                    <label for="perihal" class="col-sm-2 col-form-label">Perihal Surat</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control<?= (\Config\Services::validation()->hasError('perihal')) ? 'is-invalid' : ''; ?>" id="perihal" name="perihal" value="<?= $dokumen['perihal']; ?>">
                        <div class="invalid-feedback">
                            Perihal Surat Harus di isi.
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                <label for="tanggal_pembuatan" class="col-sm-2 col-form-label">Tanggal Pembuatan</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control <?= (\Config\Services::validation()->hasError('tanggal_pembuatan')) ? 'is-invalid' : ''; ?>" id="tanggal_pembuatan" name="tanggal_pembuatan" value="<?= $dokumen['tgl_pembuatan']; ?>">
                    <div class="invalid-feedback">
                        Tanggal Pembuatan harus diisi
                    </div>
                </div>
            </div>
                <div class="form-group row">
                    <label for="file_surat" class="col-sm-2 col-form-label">Upload File</label>
                    <div class="col-sm-10">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input <?= (\Config\Services::validation()->hasError('file_surat')) ? 'is-invalid' : ''; ?>" id="file_surat" name="file_surat" onchange="previewName()">
                            <div class="invalid-feedback">
                                File Tidak Sesuai.
                            </div>
                            <label class="custom-file-label" for="file_surat"><?= $dokumen['file_surat']; ?></label>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Berkas Fisik</label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="inlineRadio1" name="berkas_fisik" value="ada" <?= $dokumen['no_filling_kabinet'] || $dokumen['nama_folder']  ? 'checked' : ((\Config\Services::validation()->hasError('nomor_filling_kabinet')) || (\Config\Services::validation()->hasError('nama_folder')) ? 'checked' : ''); ?> >
                            <label class="form-check-label" for="inlineRadio1">Ada</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="inlineRadio2" name="berkas_fisik" value="tidak_ada" <?= $dokumen['no_filling_kabinet'] == '' && $dokumen['nama_folder'] == ''  ? ((\Config\Services::validation()->hasError('nomor_filling_kabinet')) == false && (\Config\Services::validation()->hasError('nama_folder')) == false ? 'checked' : '') : ''; ?>>
                            <label class="form-check-label" for="inlineRadio2">Tidak Ada</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row tempat">
                    <label class="col-sm-2 col-form-label"></label>
                    <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" name="tempat_kabinet" value="option1" <?=  $dokumen['no_filling_kabinet'] ? 'checked' : ((\Config\Services::validation()->hasError('nomor_filling_kabinet')) ? 'checked' : '') ; ?>>
                            <label class="form-check-label" for="inlineCheckbox1">Nomor Filling Kabinet</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="checkbox" id="inlineCheckbox2"  name="tempat_folder" value="option2" <?=  $dokumen['nama_folder'] ? 'checked' : ((\Config\Services::validation()->hasError('nama_folder')) ? 'checked' : '') ; ?> >
                            <label class="form-check-label" for="inlineCheckbox2">Nama Folder</label>
                        </div>
                    </div>
                </div>
                <div class="form-group row filling_kabinet">
                    <label for="nomor_filling_kabinet" class="col-sm-2 col-form-label">Nomor Filling Kabinet</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control <?= (\Config\Services::validation()->hasError('nomor_filling_kabinet')) ? 'is-invalid' : ''; ?>" id="nomor_filling_kabinet" name="nomor_filling_kabinet" value="<?= $dokumen['no_filling_kabinet'] ?>">
                        <div class="invalid-feedback">
                            Nomor Filling Kabinet Harus diisi.
                        </div>
                    </div>
                </div>
                <div class="form-group row nama_folder">
                    <label for="nama_folder" class="col-sm-2 col-form-label">Nama Folder</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control <?= (\Config\Services::validation()->hasError('nama_folder')) ? 'is-invalid' : ''; ?>" id="nama_folder" name="nama_folder"  value="<?= $dokumen['nama_folder'] ?>">
                        <div class="invalid-feedback">
                            Nama Folder Harus diisi.
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Ubah Data</button>
                    </div>
                </div>
            </form>
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