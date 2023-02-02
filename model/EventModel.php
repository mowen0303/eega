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


    public function getEvents(array $id,array $option=[]){
        $bindParams = [];
        $selectFields = "";
        $whereCondition = "";
        $orderCondition = "";

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
        $sql = "SELECT * FROM event WHERE true {$whereCondition} ORDER BY {$orderCondition} event_id DESC";
        if(array_sum($id)!=0){
            return $this->sqltool->getListBySql($sql,$bindParams);
        }else{
            return $this->getListWithPage('event',$sql,$bindParams,$pageSize);
        }
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
        $sql = "SELECT participant.*,user_first_name,user_last_name,user_avatar FROM participant LEFT JOIN user ON participant_user_id = user_id WHERE participant_event_id = ?";
        $result = $this->sqltool->getListBySql($sql,[$eventId]);
        return $result;
    }

    public function addParticipant(){

        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = Helper::post('participant_user_id','missing user id');
        $index = Helper::post('participant_index','missing index');

        $sql = "SELECT * FROM participant WHERE participant_event_id = ? AND participant_index = ?";
        $row = $this->sqltool->getRowBySql($sql,[$eventId,$index]);
        $row and Helper::throwException('Place has been taken');

        $sql = "SELECT * FROM participant WHERE participant_event_id = ? AND participant_user_id = ?";
        $row = $this->sqltool->getRowBySql($sql,[$eventId,$userId]);
        $row and Helper::throwException('Can not register a user in the same event multiple times');

        $sql = "SELECT * FROM  event WHERE event_id = ?";
        $event = $this->sqltool->getRowBySql($sql,[$eventId]);
        $event or Helper::throwException('Event do not exist');

        $index < $event['event_max_participant'] or Helper::throwException('Index is incorrect');

        $arr = [];
        $arr['participant_user_id'] = $userId;
        $arr['participant_event_id'] = $eventId;
        $arr['participant_index'] = $index;
        $id = $this->addRow('participant',$arr);

        $sql = "SELECT participant.*,user_first_name,user_last_name FROM participant LEFT JOIN user ON participant_user_id = user_id WHERE participant_id = ?";
        $row = $this->sqltool->getRowBySql($sql,[$id]);
        return $row;
    }

    public function deleteParticipant(){

        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = Helper::post('participant_user_id','missing user id');

        $sql = "DELETE FROM participant WHERE participant_event_id = ? AND participant_user_id = ?";
        $this->sqltool->query($sql,[$eventId,$userId]);
        return $this->sqltool->affectedRows;
    }

    public function deleteEventByIds(){
        $eventIds = Helper::request('id',"Id can no be null");
        if(!is_array($eventIds)) $userIds = [$eventIds];
        $deletedRows = $this->deleteByIDsReally('event', $eventIds);
        return $deletedRows;
    }

    public function updateScore(){
        $id = Helper::post("participant_id");
        $score = Helper::post("participant_score",'Score is required');
        $t = Helper::post("participant_t",'Please select T type');
        $sql = "SELECT * FROM participant WHERE participant_id = ?";
        $participantRow = $this->sqltool->getRowBySql($sql,[$id]);
        $userId = $participantRow['participant_user_id'];

        $eventId = $participantRow['participant_event_id'];
        $sql = "SELECT * FROM event WHERE event_id = ?";
        $event = $this->sqltool->getRowBySql($sql,[$eventId]);
        $eventLocationId = $event['event_location_id'];


        global $place_arr;
        $place = $place_arr[$eventLocationId];

        $rating = $place->{$t}->rating;
        $slope = $place->{$t}->slope;
        $par = $place->{$t}->par;

        $handicapDifferential = round(($score - $rating) * 113 / $slope, 1);

        $participantInsert = [];
        $participantInsert['participant_score'] = $score;
        $participantInsert['participant_t'] = $t;
        $participantInsert['participant_date'] = $event['event_date'];
        $participantInsert['participant_handicap_differential'] = $handicapDifferential;

        //计算index
        $sql = "SELECT * FROM participant WHERE participant_user_id = ? AND participant_date < ? ORDER BY participant_handicap_differential ASC LIMIT 0,40";
        $participantArr = $this->sqltool->getListBySql($sql,[$userId,$event['event_date']]);
        $participantArrLength = count($participantArr);
        if($participantArrLength >= 4){
            $validateCount = floor($participantArrLength/2);
            $differential = 0;
            for($i = 0; $i < $validateCount; $i ++){
                $differential += $participantArr[$i]['participant_handicap_differential'];
            }
            $participantInsert['participant_handicap_index'] = round($differential / $validateCount * 0.96,1);
            $participantInsert['participant_net_score'] = round($score - ($participantInsert['participant_handicap_index'] * $slope / 113 + ($rating - $par)));
        }else{
            $participantInsert['participant_handicap_index'] = NULL;
            $participantInsert['participant_net_score'] = NULL;
        }

        $this->updateRowById('participant',$id,$participantInsert,false);

        $rankModel = new RankModel();
        $rankModel->updateRank($userId);

        $sql = "SELECT * FROM participant WHERE participant_id = ?";
        $result = $this->sqltool->getRowBySql($sql,[$id]);
        $result['rating'] = $rating;
        $result['slope'] = $slope;
        $result['par'] = $par;
        return $result;
    }


}


?>
