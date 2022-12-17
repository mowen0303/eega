<!--.row-->
<div class="row">
    <div class="col-md-12">
        <div class="panel">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-8"><i class="mdi mdi-account fa-fw"></i> <?=$profileTitle?></div>
                    <div class="col-md-4 text-right">
                        <a href="/admin/user/index.php?s=user-list-form&uid=<?=$user['user_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Edit"><i class="ti-marker-alt"></i></a>
                        <a href="/admin/user/index.php?s=user-list-pwd-form&uid=<?=$user['user_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Change Password"><i class="ti-key"></i></a>
                    </div>
                </div>
            </div>
            <hr class="m-t-0 m-b-0">
            <div class="panel-wrapper collapse in" aria-expanded="true">
                <div class="panel-body">
                    <div class="form-horizontal" role="form">
                        <div class="form-body">
                            <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-md-3">User name:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_name']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">User PIN:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_pin']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">User Group:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><span class="label label-rouded label-info"><?=$user['user_category_title']?></span></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">Name:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_last_name']?> <?=$user['user_first_name']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">Email:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_email']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">Phone:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_phone']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">Register Time:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_register_time']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">Last Login Time:</label>
                                    <div class="col-md-7">
                                        <p class="form-control-static"><?=$user['user_last_login_time']?></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3">Avatar:</label>
                                    <div class="col-md-7">
                                        <div class="avatar avatar-80" style="background-image: url('<?=$user['user_avatar']?>')"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--./row-->