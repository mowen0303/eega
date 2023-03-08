<?php
try {
    global $userModel;
    $userId = (int) $_GET['uid'];
    $currentUserId = $userModel->getCurrentUserId();
    if ($userId) {
        //修改
        $userModel->validateCurrentUserHasAuthorityToManageTargetUser($userId) or Helper::throwException(null,403);
        $row =  $userModel->getProfileOfUserById($userId);
        $isAdminManage = (int) $userModel->isCurrentUserHasAuthority("USER","UPDATE");
    }else{
        $isAdminManage = (int) $userModel->isCurrentUserHasAuthority("USER","ADD") or Helper::throwException(null,403);
    }
    $flag = $row?'Edit':'Add';
    $userCategoryArr = $userModel->getUserCategories(true);
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">User / <?=$flag?></h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn();?>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-info">
            <div class="panel-heading"><?=$flag?> User</div>
            <div class="panel-wrapper collapse in">
                <div class="panel-body">
                    <form class="form-horizontal" action="/restAPI/userController.php?action=modifyUser" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="user_id" value="<?=$row['user_id']?>">
                        <input type="hidden" name="isAdminManage" value="<?=$isAdminManage?>">
                        <input type="hidden" name='deleteUploadedImage' value="false">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">User name *</label>
                            <div class="col-sm-6">
                                <input type="text" name="user_name" value="<?php echo $row['user_name']?>" class="form-control" placeholder="user name for login">
                            </div>
                        </div>

                        <?php if($isAdminManage){ ?>
                            <?php if(!$userId){ ?>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">Password *</label>
                                    <div class="col-sm-6">
                                        <input type="password" name="user_pwd" value="" class="form-control" placeholder="Password">
                                        <span class="help-block"><small>At least 6 character</small></span>
                                    </div>
                                </div>
                            <?php } ?>
                            <?php if($userId != $currentUserId){ ?>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label">User Group *</label>
                                    <div class="col-sm-6">
                                        <select class="form-control" name="user_user_category_id" data-defvalue="<?php echo $row['user_user_category_id']?>">
                                            <?php
                                            foreach ($userCategoryArr as $userCategory) {
                                                echo "<option value='{$userCategory['user_category_id']}'>Level {$userCategory['user_category_level']} - {$userCategory['user_category_title']} </option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

                            <?php } ?>

                            <hr class="m-t-30 m-b-30">

                        <?php } ?>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Full Name *</label>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="user_first_name" value="<?php echo $row['user_first_name']?>">
                                <span class="help-block"><small>First Name</small></span>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" name="user_last_name" value="<?php echo $row['user_last_name']?>">
                                <span class="help-block"><small>Last Name</small></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Email</label>
                            <div class="col-sm-6">
                                <input type="text" name="user_email" value="<?php echo $row['user_email']?>" class="form-control" placeholder="Email">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Phone</label>
                            <div class="col-sm-6">
                                <input type="number" class="form-control" name="user_phone" value="<?php echo $row['user_phone']?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Avatar</label>
                            <div class="col-sm-10" style="width: 150px">
                                <input type="file" name="imgFile[]" class="dropify" data-height="106" data-default-file="<?php echo $row["user_avatar"] ?: $userModel->defaultAvatar?>"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-info waves-effect waves-light m-t-10">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
