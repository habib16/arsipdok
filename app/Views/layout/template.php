<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 4 admin, bootstrap 4, css3 dashboard, bootstrap 4 dashboard, Ample lite admin bootstrap 4 dashboard, frontend, responsive bootstrap 4 admin template, Ample admin lite dashboard bootstrap 4 dashboard template">
    <meta name="description" content="Ample Admin Lite is powerful and clean admin dashboard template, inpired from Bootstrap Framework">
    <meta name="robots" content="noindex,nofollow">
    <title>Aplikasi Manajemen Arsip Dokumen</title>
    <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="/img/pos.jpg">
    <!-- Custom CSS -->
    <link href="/plugins/bower_components/chartist/dist/chartist.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.css">
    <!-- Custom CSS -->
    <link href="/css/style.min.css" rel="stylesheet">
    <style>
        .clickable-row {
            cursor: pointer;
        }

        .clickable-row:hover {
            background-color: #e4e4e4;
        }
    </style>
</head>

<body>
    <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full" data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
        <?= view('layout/topbar'); ?>
        <?= view('layout/sidebar'); ?>
        <?= $this->renderSection('content'); ?>
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->

    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="/plugins/bower_components/popper.js/dist/umd/popper.min.js"></script>
    <script src="/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/js/app-style-switcher.js"></script>
    <script src="/plugins/bower_components/jquery-sparkline/jquery.sparkline.min.js"></script>
    <!--Wave Effects -->
    <script src="/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="/js/sidebarmenu.js"></script>
    <!--Custom JavaScript -->
    <script src="/js/custom.js"></script>
    <!--This page JavaScript -->
    <!--chartis chart-->
    <script src="/plugins/bower_components/chartist/dist/chartist.min.js"></script>
    <script src="/plugins/bower_components/chartist-plugin-tooltips/dist/chartist-plugin-tooltip.min.js"></script>
    <script src="/js/pages/dashboards/dashboard1.js"></script>

    <script>
        $(document).ready(function() {

            //auto start fungsi (detail)
            radioTempat('input[name="tempat"]:checked');

            //auto start fungsi (create, edit)
            radioBerkasFisik('input[name="berkas_fisik"]:checked');

            //auto start fungsi (create, edit)
            check('input[name="tempat_kabinet"]', 'input[name="nomor_filling_kabinet"]');
            check('input[name="tempat_folder"]', 'input[name="nama_folder"]');

            // Fungsi untuk event click radio berkas_fisik (create, edit)
            $('input[name="berkas_fisik"]').click(function() {
                radioBerkasFisik(this);
                if ($(this).attr("value") == "ada") {
                    $('input[type="checkbox"]').prop("checked", true).change();
                }
            });

            // Fungsi untuk event click radio berkas_fisik (create, edit)
            $('input[name="tempat"]').click(function() {
                radioTempat(this);
            });

            // Fungsi untuk Show dan Hide jika radio button di tekan (create, edit)
            function radioBerkasFisik(selector) {
                if ($(selector).attr("value") == "ada") {
                    $(".tempat").show(300);
                    $(".filling_kabinet").show(300);
                    $(".nama_folder").show(300);
                } else if ($(selector).attr("value") == "tidak_ada") {
                    $(".tempat").hide(300);
                    $(".filling_kabinet").hide(300);
                    $(".nama_folder").hide(300);
                    $('input[type="checkbox"]').prop("checked", false).change();
                }
            }

            // Fungsi untuk Show dan Hide jika radio button di tekan (tempat)
            function radioTempat(selector) {
                if ($(selector).attr("value") == "sama") {
                    $(".tempat").hide(300);
                    $(".filling_kabinet").hide(300);
                    $(".nama_folder").hide(300);
                    $('input[type="checkbox"]').prop("checked", false).change();
                } else if ($(selector).attr("value") == "tidak_sama") {
                    $(".tempat").show(300);
                    $(".filling_kabinet").show(300);
                    $(".nama_folder").show(300);
                    $('input[type="checkbox"]').prop("checked", true).change();
                }
            }

            // Fungsi on change untuk input checkbox tempat_kabinet (create, edit, detail)
            $('input[name="tempat_kabinet"]').on("change", function() {
                check('input[name="tempat_kabinet"]', 'input[name="nomor_filling_kabinet"]');
            });

            // Fungsi on change untuk input checkbox tempat_folder (create, edit, detail)
            $('input[name="tempat_folder"]').on("change", function() {
                check('input[name="tempat_folder"]', 'input[name="nama_folder"]');
            });

            // Fungsi untuk disable inputan yang pada selector (create, edit, detail)
            function check(selector, target) {
                if ($(selector).prop("checked")) {
                    $(target).removeAttr("disabled");
                } else {
                    reset(target);
                    $(target).attr("disabled", "disabled");
                }
            }

            // Fungsi untuk reset nilai inputan yang dituju oleh selector (create, edit, detail)
            function reset(selector) {
                $(selector).val("");
            }

            // Fungsi klik row untuk ke link
            $('.clickable-row').click(function() {
                // alert($(this).data("url"));
                window.location = $(this).data("url");
            });
        });

        // Fungsi Preview nama file (create, edit)
        function previewName() {

            const fileLabel = document.querySelector('.custom-file-label');

            fileLabel.textContent = file_surat.files[0].name;
        }
    </script>
</body>

</html>