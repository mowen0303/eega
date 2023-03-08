<?php
namespace model;
use \Model as Model;
use \Helper as Helper;

class AnnounceModel extends Model
{

    public function getAnnounces(array $id,array $option=[]){

        if(array_sum($id)!=0){
            $id = Helper::convertIDArrayToString($id);
            $whereCondition .= " AND announce_id IN ($id)";
        }

        $sql = "SELECT * FROM announce WHERE true {$whereCondition}";
        return $arr = $this->sqltool->getListBySql($sql, null);
    }

    public function modifyAnnounce($id=0){
        $arr = [];
        $arr['announce_content'] = $_POST['announce_content'];
        $this->updateRowById('announce', $id, $arr,false);
        return $id;
    }
}


?>
