<?php
ob_start();
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";
try {
    $userModel = new \model\UserModel();
    if(!$userModel->isCurrentUserHasAuthority("SYSTEM_SETTING","ADMIN_LOGIN")){
        $userModel->logout();
        Helper::throwException(null,403);
    }
    $currentUserId = $userModel->getCurrentUserId();
} catch (Exception $e) {
    Helper::echoJson($e->getCode(), $e->getMessage(),null,null,null,'/admin/adminLogin.php');
    die();
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>WoodWorth WLINK System</title>
    <link href="/admin/resource/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin/resource/css/animate.css" rel="stylesheet">
    <link href="/admin/resource/css/style.css" rel="stylesheet">
    <link href="/admin/resource/css/colors/megna-dark.css" id="theme" rel="stylesheet">
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <script type="text/javascript" src="/admin/resource/js/jquery.priceformat.min.js"></script>
    <script type="text/javascript" src="/admin/resource/js/axios.min.js"></script>
    <script type="text/javascript" src="/admin/resource/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/admin/resource/js/jquery.slimscroll.js"></script>
    <script type="text/javascript" src="/admin/resource/js/run_prettify.js?autoload=true&lang=css" defer="defer"></script>
    <script type="text/javascript" src="/admin/resource/js/waves.js"></script>
    <script type="text/javascript" src="/admin/resource/js/custom.min.js"></script>
    <link href="/admin/resource/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
    <link href="/admin/resource/plugins/bower_components/multiselect/css/multi-select.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/multiselect/js/jquery.multi-select.js"></script>
    <link href="/admin/resource/plugins/bower_components/dropify/dist/css/dropify.css" rel="stylesheet">
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/dropify/dist/js/dropify.js"></script>
    <link href="/admin/resource/plugins/bower_components/custom-select/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/custom-select/dist/js/select2.full.min.js"></script>
    <link href="/admin/resource/plugins/bower_components/chartist-js/dist/chartist.min.css" rel="stylesheet">
    <link href="/admin/resource/plugins/bower_components/chartist-plugin-tooltip-master/dist/chartist-plugin-tooltip.css" rel="stylesheet">
    <link href="/admin/resource/plugins/bower_components/morrisjs/morris.css" rel="stylesheet">
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/raphael/raphael-min.js"></script>
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/morrisjs/morris.js"></script>
    <link href="/admin/resource/plugins/bower_components/fancybox/ekko-lightbox.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/fancybox/ekko-lightbox.min.js"></script>
    <script src="/admin/resource/plugins/bower_components/sweetalert/sweetalert.min.js"></script>
    <script src="/admin/resource/js/jquery.PrintArea.js" type="text/JavaScript"></script>
    <script type="text/javascript" src="/admin/resource/plugins/bower_components/x-editable/dist/bootstrap3-editable/js/bootstrap-editable.min.js"></script>
    <script src="/admin/resource/plugins/bower_components/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
    <link href="/admin/resource/plugins/bower_components/jquery-asColorPicker-master/dist/css/asColorPicker.css" rel="stylesheet">
    <script src="/admin/resource/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <link href="/admin/resource/plugins/bower_components/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="/admin/resource/js/erp-custom.js"></script>
    <link href="/admin/resource/css/erp-custom.css" rel="stylesheet">
</head>

<body class="fix-header">
<div id="adminAlert" class="myadmin-alert alert-success myadmin-alert-top alerttop"> <i id="alertIcon" class="mdi mdi-check-circle fa-fw"></i><span></span> <a href="#" class="closed">&times;</a> </div>
<!-- ============================================================== -->
<!-- Wrapper -->
<!-- ============================================================== -->
<div id="wrapper">
    <!-- ============================================================== -->
    <!-- Topbar header - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <nav class="navbar navbar-default navbar-static-top m-b-0">
        <div class="navbar-header">
            <div class="top-left-part">
                <!-- Logo -->
                <a class="logo" href="/admin/adminIndex.php">
                    <!-- Logo icon image, you can use font-icon also --><b>
                        <!--This is dark logo icon--><img src="/admin/resource/plugins/images/admin-logo.png" alt="home" class="dark-logo" /><!--This is light logo icon--><img src="/admin/resource/plugins/images/admin-logo-dark.png" alt="home" class="light-logo" />
                    </b>
                    <!-- Logo text image you can use text also --><span class="hidden-xs">
                        <!--This is dark logo text--><img src="/admin/resource/plugins/images/admin-text.png" alt="home" class="dark-logo" /><!--This is light logo text--><img src="/admin/resource/plugins/images/admin-text-dark.png" alt="home" class="light-logo" style="width: 150px" />
                     </span> </a>
            </div>
            <!-- /Logo -->
            <!-- Search input and Toggle icon -->
            <ul class="nav navbar-top-links navbar-left">
                <li><a href="javascript:void(0)" class="open-close waves-effect waves-light"><i class="ti-menu"></i></a></li>
            </ul>
            <ul class="nav navbar-top-links navbar-right pull-right active">
                <li class="dropdown">
                    <a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="false"> <span style="display: flex; align-items: center"><span style=" border:2px solid #d5d5d5;display: inline-block; width: 34px; height: 34px; background:url('<?=$userModel->getCurrentUserAvatar()?>') no-repeat center;background-size:100% auto; border-radius: 17px; margin-right: 10px""></span><b class="hidden-xs"><?=$userModel->getCurrentUserName()?></b><span class="caret"></span> </a>
                    <ul class="dropdown-menu dropdown-user animated flipInY">
                        <li>
                            <div class="dw-user-box">
                                <div class="u-img"><div class="avatar avatar-30" style="background-image: url('<?=$userModel->getCurrentUserAvatar()?>'); border-radius: 50%;margin-right: 10px"></div></div>
                                <div class="u-text">
                                    <h4><?=$userModel->getCurrentUserName()?></h4>
                                    <p class="text-muted"><?=$userModel->getCurrentUserCategoryTitle()?></p></div>
                            </div>
                        </li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/admin/user/index.php?s=user-list-form&uid=<?=$currentUserId?>"><i class="ti-user"></i> My Profile</a></li>
<!--                        <li><a href="#"><i class="ti-email"></i> Inbox</a></li>-->
                        <li role="separator" class="divider"></li>
                        <li><a href="/restAPI/userController.php?action=logout"><i class="fa fa-power-off"></i> Logout</a></li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </div>
        <!-- /.navbar-header -->
        <!-- /.navbar-top-links -->
        <!-- /.navbar-static-side -->
    </nav>
    <!-- End Top Navigation -->
    <!-- ============================================================== -->
    <!-- Left Sidebar - style you can find in sidebar.scss  -->
    <!-- ============================================================== -->
    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav slimscrollsidebar">
            <div class="sidebar-head">
                <h3><span class="fa-fw open-close"><i class="ti-close ti-menu"></i></span> <span class="hide-menu">Navigation</span></h3> </div>
                <ul class="nav" id="side-menu">
<!--                    <li><a href="/admin/adminIndex.php" class="waves-effect"><i class="mdi mdi-av-timer fa-fw"></i> <span class="hide-menu">Dashboard</span></a></li>-->


                    <li><a href="/admin/event/index.php?s=event-list" class="waves-effect"><i class="mdi mdi-airballoon fa-fw"></i> <span class="hide-menu">Event<span class="fa arrow"></span></span></a></li>
                    <li><a href="/admin/user/index.php?s=user-list" class="waves-effect"><i class="mdi mdi-account-circle  fa-fw"></i> <span class="hide-menu">User<span class="fa arrow"></span></span></a></li>

                    <?php if($userModel->isCurrentUserHasAnyOneOfAuthorities([
                            ["SYSTEM_SETTING","USER_CATEGORY"],
                            ["SYSTEM_SETTING","SUPER_BUTTON"],
                            ["SYSTEM_SETTING","PRODUCT_INVENTORY_THRESHOLD"],
                            ["AGENDA","GET_LIST"]
                    ])){?>
                    <li><a href="/admin/system/index.php" class="waves-effect"><i class="mdi mdi-laptop-chromebook fa-fw"></i> <span class="hide-menu">System<span class="fa arrow"></span></span></a>
                        <ul class="nav nav-second-level">
                            <?php if($userModel->isCurrentUserHasAuthority('SYSTEM_SETTING','USER_CATEGORY')){?>
                                <li><a href="/admin/system/index.php?s=system-user-category-list"><i class="mdi mdi-sitemap fa-fw"></i><span class="hide-menu">User Authority</span></a></li>
                            <?php }?>
                        </ul>
                    </li>
                    <?php } ?>
                    <li class="devider"></li>
                    <li><a href="/restAPI/userController.php?action=logout" class="waves-effect"><i class="mdi mdi-logout fa-fw"></i> <span class="hide-menu">Log out</span></a></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- ============================================================== -->
    <!-- End Left Sidebar -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- Page Content -->
    <!-- ============================================================== -->
    <div id="page-wrapper">
        <div class="container-fluid">
