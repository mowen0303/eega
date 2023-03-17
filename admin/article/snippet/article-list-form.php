<?php
try {
    global $userModel;
    $articleModel = new \model\ArticleModel();
    $articleId = (int) $_GET['articleId'];
    if ($articleId) {
        //修改
        $userModel->isCurrentUserHasAuthority('PHOTO', 'UPDATE') or Helper::throwException(null, 403);
        $row =  $articleModel->getArticles([$articleId])[0];
        if (!$row) {
            Helper::throwException("Can not find the event", 404);
        }
    }
    $flag = $row ? 'Edit' : 'Add';
} catch (Exception $e) {
    Helper::echoJson(0, $e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">PHOTO / <?= $flag ?></h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(); ?>
    </label>
</div>
<!--header end-->


<div class="row">
    <div class="col-sm-12">
        <div class="panel panel-info">
            <div class="panel-heading"><?= $flag ?> Photo</div>
            <div class="panel-wrapper collapse in">
                <div class="panel-body">
                    <form class="form-horizontal" action="/restAPI/articleController.php?action=modifyArticle" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="article_id" value="<?= $row['article_id'] ?>">
                        <input type="hidden" name="article_category_id" value="1">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Title *</label>
                            <div class="col-sm-10">
                                <input type="text" name="article_title" placeholder="Title" value="<?php echo $row['article_title'] ?>" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Description</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" name="article_description"><?php echo $row['article_description'] ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Date *</label>
                            <div class="col-sm-3">
                                <input type="date" name="article_date" placeholder="Date" value="<?php echo $row['article_date'] ?>" class="form-control">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Cover</label>
                            <div class="col-sm-3" style="width: 300px">
                                <input type="file" name="imgFile[]" class="dropify" data-height="106" data-default-file="<?php echo $row["article_img"] ?>" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Date *</label>
                            <div class="col-sm-10">
                                <script id='container' name='article_content' type='text/plain'><?php echo $row['article_content'] ?></script>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-info waves-effect waves-light m-t-10">Submit</button>
                            </div>
                        </div>
                    </form>
                </div>
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