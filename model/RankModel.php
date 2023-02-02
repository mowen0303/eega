<?php
namespace model;
use \Model as Model;
use \Helper as Helper;

class RankModel extends Model
{
    public function updateRank($userId){
        //第4场：出现差点指数，但是不能用于第五场的球场差点计算
        //第5场：用前四场的差点指数，计算出球场差点，之后，再更新差点指数
        $sql = "SELECT t.* FROM (SELECT * FROM participant WHERE participant_user_id = ? AND participant_handicap_differential IS NOT NULL ORDER BY participant_date DESC LIMIT 0,20) AS t ORDER BY t.participant_handicap_differential ASC";
        $participantArr = $this->sqltool->getListBySql($sql,[$userId]);
        $participantArrLength = count($participantArr);

        $sql = "DELETE FROM rank_history WHERE rank_history_user_id = ?";
        $this->sqltool->query($sql,[$userId]);

        $sql = "DELETE FROM rank WHERE rank_user_id = ?";
        $this->sqltool->query($sql,[$userId]);

        if($participantArrLength >= 4){
            $validateCount = floor($participantArrLength/2);

            $sql = "";
            $differential = 0;
            for($i = 0; $i < $participantArrLength; $i++){
                $participantId = $participantArr[$i]['participant_id'];
                if($i < $validateCount){
                    $differential += $participantArr[$i]['participant_handicap_differential'];
                    $sql .= "INSERT INTO rank_history (rank_history_user_id, rank_history_participant_id,rank_history_is_used_for_calculate) VALUES ($userId,$participantId,1);";
                }else{
                    $sql .= "INSERT INTO rank_history (rank_history_user_id, rank_history_participant_id,rank_history_is_used_for_calculate) VALUES ($userId,$participantId,0);";
                }
            }
            $this->sqltool->mysqli->multi_query($sql);
            while ($this->sqltool->mysqli->next_result()) {;}

            $arr = [];
            $arr['rank_handicap_index'] = round($differential / $validateCount * 0.96,1);
            $arr['rank_history_count'] = $validateCount;


            $sql = "SELECT * FROM rank WHERE rank_user_id = ?";
            $rank = $this->sqltool->getRowBySql($sql,[$userId]);
            if($rank){
                $this->updateRowById('rank',$userId,$arr,false,'rank_user_id');
            }else{
                $arr['rank_user_id'] = $userId;
                $this->addRow('rank',$arr);
            }
        }
    }

    public function getRank(array $option=[]){
        $bindParams = [];
        $selectFields = "";
        $whereCondition = "";
        $orderCondition = "";

        $orderBy    = $option['orderBy'];
        $sequence   = $option['sequence']?:'DESC';
        $pageSize   = $option['pageSize']?:40;

        if ($orderBy) {
            $orderCondition = "{$orderBy} {$sequence},";
        }
        $sql = "SELECT *,user_avatar,user_last_name,user_first_name FROM rank LEFT JOIN user ON rank_user_id = user_id WHERE true {$whereCondition} ORDER BY {$orderCondition} rank_handicap_index DESC";
        return $this->sqltool->getListBySql($sql,$bindParams);
    }

    public function getRankHistory($userId){
        $sql = "SELECT *,user_avatar,user_last_name,user_first_name FROM rank_history LEFT JOIN participant ON rank_history_participant_id = participant_id LEFT JOIN user ON rank_history_user_id = user_id LEFT JOIN event ON participant_event_id = event_id WHERE rank_history_user_id = ?  ORDER BY participant_date DESC";
        return $this->sqltool->getListBySql($sql,[$userId]);
    }

}


?>
