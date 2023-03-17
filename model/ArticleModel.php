<?php
namespace model;
use \Model as Model;
use \Helper as Helper;

class ArticleModel extends Model
{
    /*
     * ======================================
     * ======================================
     * ========== article category ==========
     * ======================================
     * ======================================
     */
    public function getArticleCategories(array $id,array $option=[]){
        $bindParams = [];
        $selectFields = "";
        $whereCondition = "";
        $orderCondition = "";

        $orderBy    = $option['orderBy'];
        $sequence   = $option['sequence']?:'DESC';
        $pageSize   = $option['pageSize']?:40;

        if(array_sum($id)!=0){
            $id = Helper::convertIDArrayToString($id);
            $whereCondition .= " AND article_category_id IN ($id)";
        }

        if ($orderBy) {
            $orderCondition = "{$orderBy} {$sequence},";
        }
        $sql = "SELECT * FROM article_category WHERE true {$whereCondition} ORDER BY {$orderCondition} article_category_id DESC";
        $result = $this->sqltool->getListBySql($sql,$bindParams);
        return $result;
    }

    public function modifyArticleCategory($id=0){

        $arr = [];
        $arr['article_category_title'] = Helper::post('article_category_title','article_category_title can not be null');

        if ($id) {
            //修改
            $this->updateRowById('article_category', $id, $arr,false);
        } else {
            //添加
            $id = $this->addRow('article_category', $arr);
        }
        return $id;
    }

    public function deleteArticleCategoryByIds(){
        $ids = Helper::request('id',"Id can no be null");
        if(!is_array($ids)) $ids = [$ids];
        $deletedRows = $this->deleteByIDsReally('article_category', $ids);
        return $deletedRows;
    }


    /*
     * ======================================
     * ======================================
     * ============== article ===============
     * ======================================
     * ======================================
     */
    

    public function getArticles(array $id,array $option=[]){
        $bindParams = [];
        $selectFields = "";
        $whereCondition = "";
        $orderCondition = "";

        if(!$option['field']){
            $option['field'] = "*";
        }

        $orderBy    = $option['orderBy'];
        $sequence   = $option['sequence']?:'DESC';
        $pageSize   = $option['pageSize']?:40;

        if(array_sum($id)!=0){
            $id = Helper::convertIDArrayToString($id);
            $whereCondition .= " AND article_id IN ($id)";
        }

        if ($orderBy) {
            $orderCondition = "{$orderBy} {$sequence},";
        }
        $sql = "SELECT $option[field] FROM article WHERE true {$whereCondition} ORDER BY {$orderCondition} article_date DESC, article_id DESC";
        $result = $this->sqltool->getListBySql($sql,$bindParams);
        return $result;
    }

    public function modifyArticle($id=0){

        $arr = [];
        $arr['article_category_id'] = Helper::post('article_category_id','article_category_id can not be null');
        $arr['article_title'] = Helper::post('article_title',"article_title can not be null");
        $arr['article_date'] = Helper::post('article_date');
        $arr['article_description'] = Helper::post('article_description');
        $arr['article_content'] = $_POST['article_content'];

        //validate
        if ($id) {
            //修改
            $this->updateRowById('article', $id, $arr,false);
        } else {
            //添加
            $id = $this->addRow('article', $arr);
        }

        //上传图片
        try{
            $sql = "SELECT article_img FROM article WHERE article_id IN ($id)";
            $article = $this->sqltool->getRowBySql($sql);
            $imageArr = [];
            $fileModel = new FileModel();
            $imageArr['article_img'] = $fileModel->uploadFile('imgFile',false,['image'],false,null,null,300*1000,700,700)[0]['url'];
            $this->updateRowById('article',$id,$imageArr);
            $fileModel->deleteFileByPath($article['article_img']);
        }catch (\Exception $e){
            //var_dump($imageArr['article_img']);
            $fileModel->deleteFileByPath($imageArr['article_img']);
            if($e->getMessage()){
                $this->imgError = " (Image status: {$e->getMessage()})";
            }
        }

        return $id;
    }

    public function deleteArticleByIds(){
        $ids = Helper::request('id',"Id can no be null");
        if(!is_array($ids)) $ids = [$ids];
        $deletedRows = $this->deleteByIDsReally('article', $ids);
        return $deletedRows;
    }

}


?>
