<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";


function getArticleList() {
    try {
        $articleModel = new \model\ArticleModel();
        $option['field'] = "article_id,article_date,article_title,article_img,article_description";
        $result = $articleModel->getArticles([0],$option);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getArticle() {
    try {
        $articleModel = new \model\ArticleModel();
        $id = Helper::get('id');
        $result = $articleModel->getArticles([$id])[0];
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function modifyArticle() {
    try {
        $userModel = new \model\UserModel();
        $articleModel = new \model\ArticleModel();
        $articleId = Helper::post('article_id');
        if($articleId){
            $userModel->isCurrentUserHasAuthority('PHOTO', 'UPDATE') or Helper::throwException(null, 403);
        }else{
            $userModel->isCurrentUserHasAuthority('PHOTO', 'ADD') or Helper::throwException(null, 403);
        }
        $articleModel->modifyArticle($articleId);
        Helper::echoJson(200, "Success", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


function deleteArticleCategoryByIds() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("PHOTO","DELETE") or Helper::throwException(null,403);
        $articleModel = new \model\ArticleModel();
        $effectRows = $articleModel->deleteArticleCategoryByIds();
        Helper::echoJson(200, "{$effectRows} event(s) has been deleted", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function deleteArticleByIds() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("PHOTO","DELETE") or Helper::throwException(null,403);
        $articleModel = new \model\ArticleModel();
        $effectRows = $articleModel->deleteArticleByIds();
        Helper::echoJson(200, "{$effectRows} event(s) has been deleted", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


?>
