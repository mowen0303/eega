<?php
try {
    global $userModel;
    $isAdminManage = (int) $userModel->isCurrentUserHasAuthority("USER","UPDATE");
    $userCategoryArr = $userModel->getUserCategories(true);
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">User / Group Change</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn();?>
    </label>
</div>
<!--header end-->

<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-info">
            <div class="panel-heading">Move a group of user to new a group</div>
            <div class="panel-wrapper collapse in">
                <div class="panel-body">
                    <form class="form-horizontal" action="/restAPI/userController.php?action=updateUserGroupToNewGroup" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="user_id" value="<?=$targetUserId?>">
                        <input type="hidden" name="isAdminManage" value="<?=$isAdminManage?>">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Current Group *</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="old_user_user_category_id" data-defvalue="0">
                                    <option value="0"></option>
                                    <?php
                                    foreach ($userCategoryArr as $userCategory) {
                                        echo "<option value='{$userCategory['user_category_id']}'>Level {$userCategory['user_category_level']} - {$userCategory['user_category_title']} </option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Update to New Group *</label>
                            <div class="col-sm-6">
                                <select class="form-control" name="new_user_user_category_id" data-defvalue="<?php echo $row['user_user_category_id']?>">
                                    <option value="0"></option>
                                    <?php
                                    foreach ($userCategoryArr as $userCategory) {
                                        echo "<option value='{$userCategory['user_category_id']}'>Level {$userCategory['user_category_level']} - {$userCategory['user_category_title']} </option>";
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"></label>
                            <div class="col-sm-9">
                                <button type="submit" class="btn btn-info waves-effect waves-light m-t-10">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>