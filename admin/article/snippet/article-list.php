<?php
try {
    global $userModel;
    $articleModel = new \model\ArticleModel();
    $articles = $articleModel->getArticles([0]);
} catch (Exception $e) {
    Helper::echoJson($e->getCode(),$e->getMessage());
    die();
}
?>
<!--header start-->
<div class="row bg-title">
    <div class="col-sm-4">
        <h4 class="page-title">PHOTO</h4>
    </div>
    <label class="col-sm-8 control-label">
        <?php Helper::echoBackBtn(1);?>
        <a href="/admin/article/index.php?s=article-list-form" class="btn btn-danger pull-right"><i class="fas fa-plus-circle"></i>  Add</a>
    </label>
</div>

<!--header end-->

<div class="row">
    <div class="col-sm-12">
        <div class="white-box">
            <div class="row m-b-20">
                <div class="col-sm-12">
                    <h3 class="box-title m-b-0">Photo List</h3>
                </div>
            </div>
            <form action="/restAPI/articleController.php?action=deleteArticleByIds" method="post">
                <div class="table-responsive">
                    <table class="table orderTable color-table dark-table table-hover">
                        <thead>
                        <tr>
                            <th width="21px"><input id="cBoxAll" type="checkbox"></th>
                            <th>Title</th>
                            <th>Date</th>
                            <th width="140"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        foreach ($articles as $row) {
                        ?>
                            <tr>
                                <td>
                                    <input type="checkbox" class="cBox" name="id[]" value="<?=$row['article_id']?>">
                                </td>
                                <td><?=$row['article_title']?></td>
                                <td><?=$row['article_date']?></td>
                                <td>
                                    <a href="/admin/article/index.php?s=article-list-form&articleId=<?=$row['article_id']?>" class="text-inverse p-r-10" data-toggle="tooltip" title="" data-original-title="Edit"><i class="ti-marker-alt"></i></a>
                                </td>
                            </tr>
                            <?php
                        }
                        ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-sm-8"><?=$userModel->echoPageList()?></div>
                    <div class="col-sm-4 text-right">
                        <button id="deleteBtn" style="display: none" type="submit" class="btn btn-info waves-effect waves-light m-t-10" onclick="return confirm('Are you sure to delete?')">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>