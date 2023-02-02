<?php
try {
    global $userModel;
    $sponsorModel = new \model\SponsorModel();
    $id = (int) $_GET['id'];
    if ($id) {
        //修改
        $userModel->isCurrentUserHasAuthority('SPONSOR', 'UPDATE') or Helper::throwException(null, 403);
        $row =  $sponsorModel->modifySponsorById($id);
        if(!$row){
            $id = 0;
        }
    }
    $flag = $id?'Edit':'Add';
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">SPONSOR / EDIT</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn();?>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <h3 class="box-title m-b-0">Sponsor page</h3>
            <p class="text-muted m-b-30 font-13"><?=$flag?> sponsor page</p>
            <div class="row">
                <form class="form-horizontal" action="/restAPI/sponsorController.php?action=modifySponsor" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="sponsor_id" value="<?=$id?>">
                    <div class="col-sm-12 col-xs-12">
                        <script id='container' name='sponsor_content' type='text/plain'><?php echo $row['sponsor_content'] ?></script>
                    </div>
                    <div class="col-sm-12 col-xs-12">
                        <button type="submit" class="btn btn-info waves-effect waves-light m-t-10">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 配置文件 -->
<script type="text/javascript" src="/admin/resource/tools/ueditor/ueditor.config.js"></script>
<script type="text/javascript" src="/admin/resource/tools/ueditor/ueditor.all.js"></script>
<!-- 实例化编辑器 -->
<script type="text/javascript">
    var ue = UE.getEditor('container');
</script>


