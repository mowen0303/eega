<?php
try {
    global $userModel;
    $sponsorModel = new \model\SponsorModel();
    $id = (int) $_GET['id'];
    $row =  $sponsorModel->modifySponsorById(1);
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">Sponsor</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(1);?>
        <a href="/admin/sponsor/index.php?s=sponsor-page-form&id=1" class="btn btn-danger pull-right">Edit</a>
    </label>
</div>

<!--header end-->

<div class="row">
    <div class="col-sm-12">
        <div class="white-box articleWrap">
            <?=$row['sponsor_content']?>
        </div>
    </div>
</div>