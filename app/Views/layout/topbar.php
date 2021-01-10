<!-- ============================================================== -->
<!-- Topbar header - style you can find in pages.scss -->
<!-- ============================================================== -->
<header class="topbar" data-navbarbg="skin5">
   <nav class="navbar top-navbar navbar-expand-md navbar-dark">
      <div class="navbar-header" data-logobg="skin6">
         <!-- ============================================================== -->
         <!-- Logo -->
         <!-- ============================================================== -->
         <a class="navbar-brand" href="/pages/home.php">
            <!-- Logo icon -->
            <b class="logo-icon">
               <!-- Dark Logo icon -->
               <img src="/img/pos.jpg" alt="homepage" height="50" width="200" />
            </b>
            <!--End Logo icon -->
            <!-- Logo text -->
            <!-- <span class="logo-text"> -->
            <!-- dark Logo text -->
            <!-- <img src="/plugins/images/logo-text.png" alt="homepage" />
            </span> -->
         </a>
         <!-- ============================================================== -->
         <!-- End Logo -->
         <!-- ============================================================== -->
         <!-- ============================================================== -->
         <!-- toggle and nav items -->
         <!-- ============================================================== -->
         <a class="nav-toggler waves-effect waves-light text-dark d-block d-md-none" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
      </div>
      <!-- ============================================================== -->
      <!-- End Logo -->
      <!-- ============================================================== -->
      <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">
         <ul class="navbar-nav d-none d-md-block d-lg-none">
            <li class="nav-item">
               <a class="nav-toggler nav-link waves-effect waves-light text-white" href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
            </li>
         </ul>
         <!-- ============================================================== -->
         <!-- Right side toggle and nav items -->
         <!-- ============================================================== -->
         <ul class="navbar-nav ml-auto d-flex align-items-center">
            <!-- ============================================================== -->
            <!-- User profile -->
            <!-- ============================================================== -->
            <li>
               <a class="profile-pic" href="#">
                  <img src="/plugins/images/users/varun.jpg" alt="user-img" width="36" class="img-circle"><span class="text-white font-medium"><?= $_SESSION["username"]; ?></span></a>
            </li>
            <!-- ============================================================== -->
            <!-- User profile -->
            <!-- ============================================================== -->
         </ul>
      </div>
   </nav>
</header>
<!-- ============================================================== -->
<!-- End Topbar header -->
<!-- ============================================================== -->