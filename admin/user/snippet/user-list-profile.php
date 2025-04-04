<?php
try {
    global $userModel;
    $userId = (int) Helper::get('userId',"User Id can not be null");
    $user = $userModel->getProfileOfUserById($userId);
    $company = $user;
    $companyLocation = $user;
    $profileTitle = "User Profile";
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">User / Profile</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(2);?>
    </label>
</div>
<!--header end-->
<?php require_once $_SERVER['DOCUMENT_ROOT'] . "/admin/user/snippet/user-info.php" ?>
