<?php
namespace model;
use \Model as Model;
use \Helper as Helper;

class SponsorModel extends Model
{
    public function modifySponsor($id=0){

        $sql = "SELECT * FROM  sponsor";
        $sponsorList = $this->sqltool->getListBySql($sql);
        if($sponsorList){
            $id = 1;
        }else{
            $id = false;
        }

        $arr = [];
        $arr['sponsor_content'] = $_POST['sponsor_content'];

        //validate
        if ($id) {
            //修改
            $this->updateRowById('sponsor', $id, $arr,false);
        } else {
            //添加
            $id = $this->addRow('sponsor', $arr);
        }
        return $id;
    }

    public function modifySponsorById($id){
        $sql = "SELECT * FROM sponsor WHERE sponsor_id = ?";
        return $this->sqltool->getRowBySql($sql,[$id]);
    }
}


?>
