<?php

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <title>e-Puskes - Puskesmas Tanjung - <?= $pageTitle ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <!-- App favicon -->
    <link rel="shortcut icon" href="<?= base_url('assets/images/fav.ico') ?>">

    <!-- plugins -->
    <link href="<?= base_url() ?>assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />

    <!-- App css -->
    <link href="<?= base_url() ?>assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>assets/css/app.min.css" rel="stylesheet" type="text/css" />

    <link href="<?= base_url() ?>assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" />
    <link href="<?= base_url() ?>assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.css" rel="stylesheet" type="text/css" />
    <link href="<?= base_url() ?>assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />


</head>

<body data-layout="topnav">
    <!-- Begin page -->
    <div class="wrapper">

        <!-- ============================================================== -->
        <!-- Start Page Content here -->
        <!-- ============================================================== -->

        <!-- Topbar Start -->
        <div class="navbar navbar-expand flex-column flex-md-row navbar-custom">
            <div class="container-fluid">
                <!-- LOGO -->
                <a href="index.html" class="navbar-brand mr-0 mr-md-2 logo">
                    <span class="logo-lg">
                        <img src="<?= base_url() ?>assets/images/logotabalong.png" alt="" height="24" />
                        <span class="d-inline h5 ml-1 text-logo">e-Puskes Tanjung</span>
                    </span>
                    <span class="logo-sm">
                        <img src="<?= base_url() ?>assets/images/logotabalong.png" alt="" height="24">
                    </span>
                </a>

                <ul class="navbar-nav bd-navbar-nav flex-row list-unstyled menu-left mb-0">
                    <li class="">
                        <button class="button-menu-mobile open-left disable-btn">
                            <i data-feather="menu" class="menu-icon"></i>
                            <i data-feather="x" class="close-icon"></i>
                        </button>
                    </li>
                </ul>

                <ul class="navbar-nav flex-row ml-auto d-flex list-unstyled topnav-menu float-right mb-0">

                    <?php if (!empty($this->session->userdata('idUser'))) : ?>
                        <li class="dropdown notification-list align-self-center profile-dropdown">
                            <a class="nav-link dropdown-toggle nav-user mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                                <div class="media user-profile ">
                                    <img src="<?= base_url() ?>assets/images/users/avatar-7.jpg" alt="user-image" class="rounded-circle align-self-center" />
                                    <div class="media-body text-left">
                                        <h6 class="pro-user-name ml-2 my-0">
                                            <span><?= $this->session->userdata('namaLengkap') ?></span>
                                            <span class="pro-user-desc text-muted d-block mt-1">NIK <?= $this->session->userdata('nik') ?> </span>
                                        </h6>
                                    </div>
                                    <span data-feather="chevron-down" class="ml-2 align-self-center"></span>
                                </div>
                            </a>
                            <div class="dropdown-menu profile-dropdown-items dropdown-menu-right">
                                <a href="pages-profile.html" class="dropdown-item notify-item">
                                    <i data-feather="user" class="icon-dual icon-xs mr-2"></i>
                                    <span>My Account</span>
                                </a>

                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i data-feather="settings" class="icon-dual icon-xs mr-2"></i>
                                    <span>Settings</span>
                                </a>

                                <a href="javascript:void(0);" class="dropdown-item notify-item">
                                    <i data-feather="help-circle" class="icon-dual icon-xs mr-2"></i>
                                    <span>Support</span>
                                </a>

                                <a href="pages-lock-screen.html" class="dropdown-item notify-item">
                                    <i data-feather="lock" class="icon-dual icon-xs mr-2"></i>
                                    <span>Lock Screen</span>
                                </a>

                                <div class="dropdown-divider"></div>

                                <a href="<?= base_url('Auth/Logout') ?>" class="dropdown-item notify-item">
                                    <i data-feather="log-out" class="icon-dual icon-xs mr-2"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </li>
                    <?php
                    else :
                    endif;
                    ?>
                </ul>
            </div>
        </div>
        <!-- end Topbar -->

        <div class="topnav shadow-sm">
            <div class="container-fluid">
                <nav class="navbar navbar-light navbar-expand-lg topbar-nav">
                    <div class="collapse navbar-collapse" id="topnav-menu-content">
                        <ul class="metismenu" id="menu-bar">
                            <li class="menu-title">Navigation</li>

                            <li>
                                <a href="<?= base_url() ?>">
                                    <i data-feather="home"></i>
                                    <span class="badge badge-success float-right">1</span>
                                    <span> Beranda </span>
                                </a>
                            </li>
                            <li class="menu-title">Apps</li>
                            <?php if (!empty($this->session->userdata('idUser'))) : ?>
                                <li>
                                    <a href="javascript: void(0);">
                                        <i data-feather="book-open"></i>
                                        <span> Pendaftaran</span>
                                        <span class="menu-arrow"></span>
                                    </a>

                                    <ul class="nav-second-level" aria-expanded="false">
                                        <li>
                                            <a href="<?= base_url('Kesmas/Gigi/Daftar') ?>">Poli Gigi</a>
                                        </li>
                                        <li>
                                            <a href="<?= base_url('Kesmas/Umum/Daftar') ?>">Poli Umum</a>
                                        </li>
                                        <li>
                                            <a href="<?= base_url('Kesmas/Covid/Daftar') ?>">Lapor Covid-19</a>
                                        </li>
                                        <li>
                                            <a href="<?= base_url('Kesmas/Sks/Daftar') ?>">Surat Keterangan Sehat</a>
                                        </li>
                                    </ul>
                                </li>
                            <?php
                            else :
                            endif;
                            ?>
                            <!-- <li>
                                <a href="javascript: void(0);">
                                    <i data-feather="book-open"></i>
                                    <span> Info</span>
                                    <span class="menu-arrow"></span>
                                </a>

                                <ul class="nav-second-level" aria-expanded="false">
                                    <li>
                                        <a href="project-list.html">Kesehatan</a>
                                    </li>
                                    <li>
                                        <a href="project-detail.html">Penyuluhan</a>
                                    </li>
                                </ul>
                            </li> -->

                            <!-- <li>
                                <a href="<?= base_url('home/dashboard') ?>">
                                    <i data-feather="edit-2"></i>
                                    <span> Tentang </span>
                                </a>
                            </li> -->
                            <?php if (empty($this->session->userdata('idUser'))) : ?>
                                <li>
                                    <a href="<?= base_url('Auth/Login') ?>">
                                        <i data-feather="key"></i>
                                        <span> Login </span>
                                    </a>
                                </li>
                                <li>
                                    <a href="<?= base_url('Kesmas/Pasien/Registrasi') ?>">
                                        <i data-feather="user-plus"></i>
                                        <span> Register </span>
                                    </a>
                                </li>
                            <?php
                            else :
                            endif;
                            ?>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>


        <div class="content-page">
            <div class="content">
                <!-- Start Content-->
                <div class="container-fluid">
                    <!-- <div class="row page-title">
                        <div class="col-sm-4 col-xl-6">
                            <h4 class="mb-1 mt-0"><?= $pageTitle ?></h4>
                        </div>
                    </div> -->

                    <?= $contents ?>

                </div>
            </div>


            <!-- Footer Start -->
            <footer class="footer">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            2021 &copy; e-Puskes Tanjung. All Rights Reserved. Crafted with <i class='uil uil-heart text-danger font-size-12'></i> <a href="javascript: void(0);""></a>
                            <!-- Dilarang Menggunakan Aplikasi ini untuk Hibah Dikti dan/atau Hibah Internal Kampus Manapun. -->
                        </div>
                    </div>
                </div>
            </footer>
            <!-- end Footer -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page content -->
        <!-- ============================================================== -->
    </div>
  
    <div class=" rightbar-overlay"></div>
                        <script src="<?= base_url() ?>assets/js/vendor.min.js"></script>
                        <script src="<?= base_url() ?>assets/libs/moment/moment.min.js"></script>
                        <!-- <script src="<?= base_url() ?>assets/libs/apexcharts/apexcharts.min.js"></script> -->
                        <script src="<?= base_url() ?>assets/libs/flatpickr/flatpickr.min.js"></script>

                        <!-- page js -->
                        <!-- <script src="<?= base_url() ?>assets/js/pages/dashboard.init.js"></script> -->

                        <!-- App js -->
                        <script src="<?= base_url() ?>assets/js/app.min.js"></script>
                        <script src="<?= base_url() ?>assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
                        <script src="<?= base_url() ?>assets/libs/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
                        <script src="<?= base_url() ?>assets/libs/select2/select2.min.js"></script>
                        <script src="<?= base_url() ?>assets/libs/multiselect/jquery.multi-select.js"></script>
                        <script src="<?= base_url() ?>assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
                        <script src="<?= base_url() ?>assets/js/pages/form-advanced.init.js"></script>
                        <script src="<?= base_url() ?>assets/mask/vendor/igorescobar/jquery-mask-plugin/dist/jquery.mask.min.js"></script>

                        <script>
                            $(document).ready(function() {
                                $('.uang').mask('000.000.000', {
                                    reverse: true
                                });

                                $('.wa').mask('0000-0000-00000');
                                $('.nip').mask('00000000000000000000');
                                $('.tb').mask('000');
                                $('.bb').mask('000');
                            })
                        </script>
</body>

</html>