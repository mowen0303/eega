<?php
try {
    global $userModel;
    $accounceModel = new \model\AnnounceModel();
    $announceId = (int) $_GET['announceId'];
    if ($announceId) {
        //修改
        $userModel->isCurrentUserHasAuthority('ANNOUNCE', 'UPDATE') or Helper::throwException(null, 403);
        $row =  $accounceModel->getAnnounces([$announceId])[0];
        if(!$row){
            Helper::throwException("Can not find the event",404);
        }
    }
    $flag = $row?'Edit':'Add';
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">EVENT / REVIEW / <?=$flag?></h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn();?>
    </label>
</div>
<!--header end-->
<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <h3 class="box-title m-b-0"><?php echo $row['announce_title']?></h3>
            <p class="text-muted m-b-30 font-13"><?=$flag?> Event Announce </p>
            <div class="row">
                <form class="form-horizontal" action="/restAPI/announceController.php?action=modifyAnnounce" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="announce_id" value="<?=$row['announce_id']?>">
                    <div class="col-sm-12 col-xs-12">
                        <script id='container' name='announce_content' type='text/plain'><?php echo $row['announce_content'] ?></script>
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


