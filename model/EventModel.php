<?php
namespace model;
use \Model as Model;
use \Helper as Helper;

class EventModel extends Model
{
    public function modifyEvent($id=0){

        $arr = [];
        $arr['event_title'] = Helper::post('event_title','Event title can not be null',0,255);
        $arr['event_description'] = Helper::post('event_description');
        $arr['event_date'] = Helper::post('event_date','Event date can not be null',0,30);
        $arr['event_type'] = Helper::post('event_type','Event type can not be null');
        $arr['event_location_id'] = Helper::post('event_location_id','Event location id can not be null');
        $arr['event_max_participant'] = Helper::post('event_max_participant','Number of participants can not be null');

        //validate
        if ($id) {
            //修改
            $this->updateRowById('event', $id, $arr,false);
        } else {
            //添加
            $id = $this->addRow('event', $arr);
        }
        return $id;
    }

    public function getEventJoinStatus($eventDate){
        $currentTime = strtotime(date("Y-m-d"));
        $time = strtotime($eventDate) - $currentTime;
        if($time == 0){
            return "今日比赛";
        }else if($time < 0){
            return "已结束";
        }else if($time <= 3600 * 24){
            return "报名已锁定";
        }else if($time <= 3600 * 24 * 14){
            return "开放报名";
        }else{
            return "未开放";
        }
    }

    public function getNextEvent(){
        $today = date("Y-m-d");
        $sql = "SELECT * FROM `event` WHERE event_date >= ? ORDER BY event_date LIMIT 0,1";
        return $this->sqltool->getRowBySql($sql,[$today]);
    }

    public function deleteEventReview($id){
        $arr = [];
        $arr['event_review_content'] = null;
        return $this->updateRowById('event', $id, $arr,false);
    }


    public function getEvents(array $id,array $option=[]){
        $bindParams = [];
        $selectFields = "";
        $whereCondition = "";
        $orderCondition = "";

        if($option['type']=="review"){
            $whereCondition .= " AND event_review_content IS NOT NULL ";
        }

        $orderBy    = $option['orderBy'];
        $sequence   = $option['sequence']?:'DESC';
        $pageSize   = $option['pageSize']?:40;

        if(array_sum($id)!=0){
            $id = Helper::convertIDArrayToString($id);
            $whereCondition .= " AND event_id IN ($id)";
        }

        if ($orderBy) {
            $orderCondition = "{$orderBy} {$sequence},";
        }
        $sql = "SELECT * FROM event WHERE true {$whereCondition} ORDER BY {$orderCondition} event_date DESC, event_id DESC";
        // if(array_sum($id)!=0){
        //     $result = $this->sqltool->getListBySql($sql,$bindParams);
        // }else{
        //     $result = $this->getListWithPage('event',$sql,$bindParams,$pageSize);
        // }

        $result = $this->sqltool->getListBySql($sql,$bindParams);

        if($result){
            global $place_arr;
            foreach($result as $k => $v){
                //整合报名状态
                $result[$k]['event_join_status'] = $this->getEventJoinStatus($v['event_date']);

                //整合球场信息
                $place = $place_arr[$v['event_location_id']];
                $result[$k]['courseName'] = $place->name;
                if($place->red){
                    $result[$k]['t_red'] = [
                        'rating'=>$place->red->rating,
                        'slope'=>$place->red->slope,
                        'par'=>$place->red->par
                    ];
                }
                if($place->green){
                    $result[$k]['t_green'] = [
                        'rating'=>$place->green->rating,
                        'slope'=>$place->green->slope,
                        'par'=>$place->green->par
                    ];
                }
                if($place->white){
                    $result[$k]['t_white'] = [
                        'rating'=>$place->white->rating,
                        'slope'=>$place->white->slope,
                        'par'=>$place->white->par
                    ];
                }
                if($place->blue){
                    $result[$k]['t_blue'] = [
                        'rating'=>$place->blue->rating,
                        'slope'=>$place->blue->slope,
                        'par'=>$place->blue->par
                    ];
                }
                if($place->black){
                    $result[$k]['t_black'] = [
                        'rating'=>$place->black->rating,
                        'slope'=>$place->black->slope,
                        'par'=>$place->black->par
                    ];
                }
            }
        }else{
            $result = [];
        }
        
        return $result;
    }

    public function modifyEventReview($id=0){
        $arr = [];
        //$arr['event_review_title'] = Helper::post('event_review_title','Event review title can not be null',0,255);
        $arr['event_review_content'] = $_POST['event_review_content'];
        $event = $this->getEvents([$id])[0];
        if($event){
            $this->updateRowById('event', $id, $arr,false);
        }else{
            Helper::throwException("event does not exist",404);
        }
        return $id;
    }

    public function getParticipants($eventId){

        $bindParams = [];
        $selectFields = "";
        $whereCondition = "";
        $orderCondition = "";

        $orderBy    = $_GET['orderBy'];
        $sequence   = $_GET['sort']?:'DESC';

        if ($orderBy) {
            $orderCondition = "{$orderBy} {$sequence},";
        }

        if($orderBy == "participant_score"){
            // $orderCondition .= "participant_net_score desc, participant_handicap_index ASC, participant_handicap_differential ASC, ";
            $orderCondition = "participant_score IS NULL, participant_score ASC, participant_handicap_index IS NULL, participant_handicap_index DESC, participant_net_score asc, ";
        }else if($orderBy == "participant_net_score"){
            // $orderCondition = "(case when participant_net_score is null then 1 else 0 end) asc, participant_net_score {$sequence},";
            $orderCondition = "participant_net_score IS NULL, participant_net_score ASC, participant_handicap_index IS NULL, participant_handicap_index ASC, participant_net_score asc, ";
        }

        $sql = "SELECT participant.*,event.event_location_id,event.event_title,event.event_date,user_first_name,user_last_name,user_avatar FROM participant LEFT JOIN event ON participant_event_id = event_id LEFT JOIN user ON participant_user_id = user_id WHERE participant_event_id IN ($eventId) ORDER BY {$orderCondition} participant_id DESC";
        $result = $this->sqltool->getListBySql($sql,null);
        if($result){
            global $place_arr;
            foreach($result as $k => $v){
                $place = $place_arr[$v['event_location_id']];
                $result[$k]['courseName'] = $place->name;
                $result[$k]['tr'] = $place->{$v['participant_t']}->rating;
                $result[$k]['ts'] = $place->{$v['participant_t']}->slope;
                $result[$k]['tp'] = $place->{$v['participant_t']}->par;
            }
        }else{
            $result = [];
        }
        return $result;
    }

    public function addParticipant($eventId,$userId,$index,$restrictDate = false, $pin = null){

        $sql = "SELECT * FROM  event WHERE event_id = ?";
        $event = $this->sqltool->getRowBySql($sql,[$eventId]);
        $event or Helper::throwException('Event do not exist');

        if($index < 0 || $index >$event['event_max_participant']){
            Helper::throwException('Index is incorrect');
        }

        if($pin){
            $sql = "SELECT * FROM user WHERE user_pin = ?";
            $user = $this->sqltool->getRowBySql($sql,[$pin]);
            $user or Helper::throwException("PIN无效");
            $userId = $user['user_id'];
        }

        if($restrictDate){
            //限制报名时间
            $eventStatus = $this->getEventJoinStatus($event['event_date']);
            if($eventStatus == "今日比赛" || $eventStatus == "报名已锁定"){
                Helper::throwException("报名失败，比赛名单已锁定，请联系活动管理员。");
            }else if($eventStatus == "已结束"){
                Helper::throwException("报名失败，活动已结束。");
            }else if($eventStatus == "未开放"){
                Helper::throwException("报名失败，活动还未开放报名。");
            }
        }
        
        $sql = "SELECT * FROM participant WHERE participant_event_id = ? AND participant_index = ?";
        $row = $this->sqltool->getRowBySql($sql,[$eventId,$index]);
        $row and Helper::throwException('Place has been taken');

        $sql = "SELECT * FROM participant WHERE participant_event_id = ? AND participant_user_id = ?";
        $row = $this->sqltool->getRowBySql($sql,[$eventId,$userId]);
        $row and Helper::throwException('报名失败，您已再活动中了');

        $arr = [];
        $arr['participant_user_id'] = $userId;
        $arr['participant_event_id'] = $eventId;
        $arr['participant_index'] = $index;
        $id = $this->addRow('participant',$arr);

        $sql = "SELECT participant.*,user_first_name,user_last_name FROM participant LEFT JOIN user ON participant_user_id = user_id WHERE participant_id = ?";
        $row = $this->sqltool->getRowBySql($sql,[$id]);
        return $row;
    }

    public function deleteParticipant($eventId,$userId,$restrictDate = false){

        $sql = "SELECT * FROM  event WHERE event_id = ?";
        $event = $this->sqltool->getRowBySql($sql,[$eventId]);
        $event or Helper::throwException('Event do not exist');

        if($restrictDate){
            //限制报名时间
            $eventStatus = $this->getEventJoinStatus($event['event_date']);
            if($eventStatus == "今日比赛" || $eventStatus == "报名已锁定"){
                Helper::throwException("退出失败，比赛名单已锁定，请联系活动管理员。");
            }else if($eventStatus == "已结束"){
                Helper::throwException("退出失败，活动已结束。");
            }else if($eventStatus == "未开放"){
                Helper::throwException("退出失败，活动暂未开放，最早报名时间为活动开始前10日。");
            }
        }

        $sql = "DELETE FROM participant WHERE participant_event_id = ? AND participant_user_id = ?";
        $this->sqltool->query($sql,[$eventId,$userId]);
        $result = $this->sqltool->affectedRows;
        if($result){
            $this->updateScoreIndex($userId,$event['event_date']);
            $rankModel = new RankModel();
            $rankModel->updateRank($userId);
        }
        return $result;
    }

    public function deleteEventByIds(){
        $eventIds = Helper::request('id',"Id can no be null");
        if(!is_array($eventIds)) $userIds = [$eventIds];
        $deletedRows = $this->deleteByIDsReally('event', $eventIds);
        return $deletedRows;
    }

    // public function updateScore(){
    //     $id = Helper::post("participant_id");
    //     $score = Helper::post("participant_score",'Score is required');
    //     $t = Helper::post("participant_t",'Please select T type');
    //     $sql = "SELECT * FROM participant WHERE participant_id = ?";
    //     $participantRow = $this->sqltool->getRowBySql($sql,[$id]);
    //     $userId = $participantRow['participant_user_id'];

    //     $eventId = $participantRow['participant_event_id'];
    //     $sql = "SELECT * FROM event WHERE event_id = ?";
    //     $event = $this->sqltool->getRowBySql($sql,[$eventId]);
    //     $eventLocationId = $event['event_location_id'];


    //     global $place_arr;
    //     $place = $place_arr[$eventLocationId];

    //     $rating = $place->{$t}->rating;
    //     $slope = $place->{$t}->slope;
    //     $par = $place->{$t}->par;

    //     $handicapDifferential = round(($score - $rating) * 113 / $slope, 1);

    //     $participantInsert = [];
    //     $participantInsert['participant_score'] = $score;
    //     $participantInsert['participant_t'] = $t;
    //     $participantInsert['participant_date'] = $event['event_date'];
    //     $participantInsert['participant_handicap_differential'] = $handicapDifferential;

    //     //计算index
    //     $sql = "SELECT t.* FROM (SELECT * FROM participant WHERE participant_user_id = ? AND participant_handicap_differential IS NOT NULL AND participant_date < ? ORDER BY participant_date DESC LIMIT 0,20) AS t ORDER BY t.participant_handicap_differential ASC";
    //     $participantArr = $this->sqltool->getListBySql($sql,[$userId,$event['event_date']]);
    //     $participantArrLength = count($participantArr);

    //     $sql = "DELETE FROM participant_history WHERE participant_history_calculate_for_participant_id = ?";
    //     $this->sqltool->query($sql,[$id]);

    //     if($participantArrLength >= 4){
    //         $validateCount = floor($participantArrLength/2);

    //         $sql = "";
    //         $differential = 0;
    //         for($i = 0; $i < $participantArrLength; $i ++){
    //             $participantId = $participantArr[$i]['participant_id'];
    //             if($i < $validateCount){
    //                 $differential += $participantArr[$i]['participant_handicap_differential'];
    //                 $sql .= "INSERT INTO participant_history (participant_history_calculate_for_participant_id, participant_history_user_id, participant_history_participant_id,participant_history_is_used_for_calculate) VALUES ($id,$userId,$participantId,1);";
    //             }else{
    //                 $sql .= "INSERT INTO participant_history (participant_history_calculate_for_participant_id, participant_history_user_id, participant_history_participant_id,participant_history_is_used_for_calculate) VALUES ($id,$userId,$participantId,0);";
    //             }
    //         }
    //         $this->sqltool->mysqli->multi_query($sql);
    //         while ($this->sqltool->mysqli->next_result()) {;}

    //         $participantInsert['participant_handicap_index'] = round($differential / $validateCount * 0.96,1);
    //         $participantInsert['participant_net_score'] = round($score - ($participantInsert['participant_handicap_index'] * $slope / 113 + ($rating - $par)));
    //     }else{
    //         $participantInsert['participant_handicap_index'] = NULL;
    //         $participantInsert['participant_net_score'] = NULL;
    //     }

    //     $this->updateRowById('participant',$id,$participantInsert,false);

    //     $rankModel = new RankModel();
    //     $rankModel->updateRank($userId);

    //     $sql = "SELECT * FROM participant WHERE participant_id = ?";
    //     $result = $this->sqltool->getRowBySql($sql,[$id]);
    //     $result['rating'] = $rating;
    //     $result['slope'] = $slope;
    //     $result['par'] = $par;
    //     return $result;
    // }

    public function updateScore(){
        
        $id = Helper::post("participant_id");
        $score = Helper::post("participant_score",'Score is required');
        $t = Helper::post("participant_t",'Please select T type');
        $arr["participant_id"] = $id;
        $arr["participant_score"] = $score;
        $arr["participant_t"] = $t;
        
        $this->updateRowById('participant',$id,$arr,false);

        $sql = "SELECT * FROM participant LEFT JOIN event ON participant_event_id = event_id WHERE participant_id = ?";
        $participantRow = $this->sqltool->getRowBySql($sql,[$id]);
        $userId = $participantRow['participant_user_id'];
        $eventDate = $participantRow['event_date'];
        
        $this->updateScoreIndex($userId,$eventDate);
        $rankModel = new RankModel();
        $rankModel->updateRank($userId);

        $sql = "SELECT * FROM participant LEFT JOIN event ON participant_event_id = event_id WHERE participant_id = ?";
        $result = $this->sqltool->getRowBySql($sql,[$id]);

        $eventLocationId = $result['event_location_id'];
        global $place_arr;
        $place = $place_arr[$eventLocationId];

        $rating = $place->{$t}->rating;
        $slope = $place->{$t}->slope;
        $par = $place->{$t}->par;

        $result['rating'] = $rating;
        $result['slope'] = $slope;
        $result['par'] = $par;
        return $result;
    }

    public function updateScoreIndex($userId,$eventDate){
        
        $sql = "SELECT * FROM participant LEFT JOIN event ON participant_event_id = event_id WHERE participant_user_id = $userId AND event_date >= $eventDate";

        $participantList = $this->sqltool->getListBySql($sql);

        if($participantList){
            foreach($participantList as $k => $participant){
                // $sql = "SELECT * FROM participant WHERE participant_event_id = $eventId AND participant_user_id = $userId";
                //$participant = $this->sqltool->getRowBySql($sql);
                $eventId = $participant['event_id'];
                $id = $participant['participant_id'];
                $score = $participant['participant_score'];
                $t = $participant['participant_t'];
                $eventLocationId = $participant['event_location_id'];


                global $place_arr;
                $place = $place_arr[$eventLocationId];
                $rating = $place->{$t}->rating;
                $slope = $place->{$t}->slope;
                $par = $place->{$t}->par;

                $handicapDifferential = round(($score - $rating) * 113 / $slope, 1);

                $participantInsert = [];
                $participantInsert['participant_score'] = $score;
                $participantInsert['participant_t'] = $t;
                $participantInsert['participant_date'] = $participant['event_date'];
                $participantInsert['participant_handicap_differential'] = $handicapDifferential;

                //计算index
                $sql = "SELECT t.* FROM (SELECT * FROM participant LEFT JOIN event ON participant_event_id = event_id WHERE participant_user_id = ? AND participant_score IS NOT NULL AND event_date < ? ORDER BY event_date DESC LIMIT 0,20) AS t ORDER BY t.participant_handicap_differential ASC";
                $participantArr = $this->sqltool->getListBySql($sql,[$userId,$participant['event_date']]);
                $participantArrLength = count($participantArr);

                // print_r($participantArr);

                $sql = "DELETE FROM participant_history WHERE participant_history_calculate_for_participant_id = ?";
                $this->sqltool->query($sql,[$id]);

                if($participantArrLength >= 4){
                    $validateCount = floor($participantArrLength/2);

                    $sql = "";
                    $differential = 0;
                    for($i = 0; $i < $participantArrLength; $i ++){
                        $participantId = $participantArr[$i]['participant_id'];
                        if($i < $validateCount){
                            $differential += $participantArr[$i]['participant_handicap_differential'];
                            $sql .= "INSERT INTO participant_history (participant_history_calculate_for_participant_id, participant_history_user_id, participant_history_participant_id,participant_history_is_used_for_calculate) VALUES ($id,$userId,$participantId,1);";
                        }else{
                            $sql .= "INSERT INTO participant_history (participant_history_calculate_for_participant_id, participant_history_user_id, participant_history_participant_id,participant_history_is_used_for_calculate) VALUES ($id,$userId,$participantId,0);";
                        }
                    }
                    $this->sqltool->mysqli->multi_query($sql);
                    while ($this->sqltool->mysqli->next_result()) {;}

                    $participantInsert['participant_handicap_index'] = round($differential / $validateCount * 0.96,1);
                    $participantInsert['participant_net_score'] = round($score - ($participantInsert['participant_handicap_index'] * $slope / 113 + ($rating - $par)));
                }else{
                    $participantInsert['participant_handicap_index'] = NULL;
                    $participantInsert['participant_net_score'] = NULL;
                }

                $this->updateRowById('participant',$id,$participantInsert,false);
            }
        }


        

    }

    public function getParticipantHistory($participantId){
        //event.event_title,event.event_date,event.event_location_id
        $sql = "SELECT *,user_avatar,user_last_name,user_first_name FROM participant_history LEFT JOIN participant ON participant_history_participant_id = participant_id LEFT JOIN user ON participant_history_user_id = user_id LEFT JOIN event ON participant_event_id = event_id WHERE participant_history_calculate_for_participant_id = ?  ORDER BY event_date DESC";
        $result = $this->sqltool->getListBySql($sql,[$participantId]);
        global $place_arr;
        foreach($result as $k => $v){
            $place = $place_arr[$v['event_location_id']];
            $result[$k]['courseName'] = $place->name;
            $result[$k]['tr'] = $place->{$v['participant_t']}->rating;
            $result[$k]['ts'] = $place->{$v['participant_t']}->slope;
            $result[$k]['tp'] = $place->{$v['participant_t']}->par;
        }
        return $result;
    }

    public function getAllParticipants($userId){
        $sql = "SELECT *,user_avatar,user_last_name,user_first_name FROM participant LEFT JOIN user ON participant_user_id = user_id LEFT JOIN event ON participant_event_id = event_id WHERE participant_user_id = ? AND participant_score IS NOT NULL ORDER BY participant_date DESC";
        return $this->sqltool->getListBySql($sql,[$userId]);
    }

    function getScoreListOrderUrl($eventId,$orderBy){
        $sort = $_GET['sort'];
        $urlOrderBy = $_GET['orderBy'];
        if($urlOrderBy == $orderBy){
            $sort = $sort=="asc"?"desc":"asc";
        }else{
            $sort = "desc";
        }
        return " href='/admin/event/index.php?s=event-list-score&eventId={$eventId}&orderBy={$orderBy}&sort={$sort}' data-hl-orderby='{$orderBy}' ";
    }

    function getEventListWithScore(){
        $sql = "SELECT participant_event_id FROM `participant` GROUP BY participant_event_id HAVING sum(participant_score) > 0";
        $selectedEvents = $this->sqltool->getListBySql($sql);
        if($selectedEvents){
            $eventIds = [];
            foreach($selectedEvents as $v){
                $eventIds[] = $v['participant_event_id'];
            }
            return $this->getEvents($eventIds);
        }else{
            return [];
        }
    }


}


?>
