<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";
try {
    $userModel = new \model\UserModel();
    $userModel->getCurrentUserId() or Helper::throwException("未登录",403);
    if(!$userModel->isCurrentUserHasAuthority("SYSTEM_SETTING","ADMIN_LOGIN")){
        $userModel->logout();
        Helper::jumpTo('/admin/adminLogin.php');
        die();
    }
    Helper::jumpTo('admin/user/index.php?s=user-list');
    die();
} catch (Exception $e) {

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
    <title><?=WEBSITE_NAME?> Admin System</title>
    <!-- Bootstrap Core CSS -->
    <link href="/admin/resource/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="/admin/resource/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/admin/resource/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="/admin/resource/css/colors/default.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .login-register {
            background: url(../resource/img/bg.jpg) no-repeat center center / cover !important;
            height: 100%;
            position: fixed;
        }
    </style>
</head>
<body>
<div class="preloader">
    <div class="cssload-speeding-wheel"></div>
</div>
<section id="wrapper" class="new-login-register">
    <div class="lg-info-panel">
        <div class="inner-panel">
            <div class="lg-content"></div>
        </div>
    </div>
    <div class="new-login-box">
        <div class="white-box">
            <h3 class="box-title m-b-0">Sign In to Admin</h3>
            <small>Enter your details below</small>
            <form class="form-horizontal new-lg-form" id="loginform" action="/restAPI/userController.php?action=login" method="post">

                <div class="form-group  m-t-20">
                    <div class="col-xs-12">
                        <label>User name</label>
                        <input class="form-control" name="user_name" type="text" required="" placeholder="Email">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-12">
                        <label>Password</label>
                        <input class="form-control" name="user_pwd" type="password" required="" placeholder="Password">
                    </div>
                </div>
                <div class="form-group text-center m-t-20">
                    <div class="col-xs-12">
                        <button class="btn btn-info btn-lg btn-block btn-rounded text-uppercase waves-effect waves-light" type="submit">Log In</button>
                    </div>
                </div>
            </form>
        </div>
    </div>


</section>
<!-- jQuery -->
<script src="/admin/resource/plugins/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="/admin/resource/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Menu Plugin JavaScript -->
<script src="/admin/resource/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
<!--slimscroll JavaScript -->
<script src="/admin/resource/js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="/admin/resource/js/waves.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/admin/resource/js/custom.min.js"></script>
<!--Style Switcher -->
<script src="/admin/resource/plugins/bower_components/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>
