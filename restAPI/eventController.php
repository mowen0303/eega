<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";

function getEvent() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'ENROLL') or Helper::throwException(null, 403);
        $eventId = Helper::get("eventId","event id is required");
        $result = $eventModel->getEvents([$eventId])[0];
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function deleteEventReview() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $eventId = Helper::get("eventId","event id is required");
        $result = $eventModel->deleteEventReview($eventId);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getEventReview() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $eventId = Helper::get("eventId","event id is required");
        $result = $eventModel->getEvents([$eventId])[0];
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getNextEvent() {
    try {
        $eventModel = new \model\EventModel();
        $result = $eventModel->getNextEvent();
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getEventList() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $result = $eventModel->getEvents([0]);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getEventReviewList() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $option['type'] = "review";
        $result = $eventModel->getEvents([0],$option);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


function modifyEvent() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $eventId = Helper::post('event_id');
        if($eventId){
            $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        }else{
            $userModel->isCurrentUserHasAuthority('EVENT', 'ADD') or Helper::throwException(null, 403);
        }
        $eventModel->modifyEvent($eventId);
        Helper::echoJson(200, "Success", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function modifyEventReview() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $eventId = Helper::post('event_id');
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $eventModel->modifyEventReview($eventId);
        Helper::echoJson(200, "Success", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


function getParticipants() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $eventId = Helper::get('event_id');
        $result = $eventModel->getParticipants($eventId);
        Helper::echoJson(200, "Success", $result, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


function addParticipant(){
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'ENROLL') or Helper::throwException(null, 403);
        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = $userModel->getCurrentUserId();
        $index = Helper::post('participant_index','missing index');
        $result = $eventModel->addParticipant($eventId,$userId,$index,true);
        Helper::echoJson(200, "Success", $result, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function addParticipantByPIN(){
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'ENROLL') or Helper::throwException(null, 403);
        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = $userModel->getCurrentUserId();
        $pin = Helper::post("pin","PIN is required");
        $index = Helper::post('participant_index','missing index');
        $result = $eventModel->addParticipant($eventId,$userId,$index,true,$pin);
        Helper::echoJson(200, "Success", $result, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function addParticipantByAdmin() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = Helper::post('participant_user_id','missing user id');
        $index = Helper::post('participant_index','missing index');
        $result = $eventModel->addParticipant($eventId,$userId,$index);
        Helper::echoJson(200, "Success", $result, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function deleteParticipant() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'ENROLL') or Helper::throwException(null, 403);
        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = $userModel->getCurrentUserId();
        $result = $eventModel->deleteParticipant($eventId,$userId,true);
        Helper::echoJson(200, "Success", $result, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function deleteParticipantByAdmin() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $eventId = Helper::post('participant_event_id','missing event id');
        $userId = Helper::post('participant_user_id','missing user id');
        $result = $eventModel->deleteParticipant($eventId,$userId);
        Helper::echoJson(200, "Success", $result, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function deleteEventByIds() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("EVENT","DELETE") or Helper::throwException(null,403);
        $eventModel = new \model\EventModel();
        $effectRows = $eventModel->deleteEventByIds();
        Helper::echoJson(200, "{$effectRows} event(s) has been deleted", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function updateScore() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("EVENT","UPDATE") or Helper::throwException(null,403);
        $eventModel = new \model\EventModel();
        $effectRows = $eventModel->updateScore();
        Helper::echoJson(200, "Score update successfully", $effectRows, null, null, Helper::echoBackBtn(1,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


function getEventScore() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("EVENT","GET") or Helper::throwException(null,403);
        $eventModel = new \model\EventModel();
        $eventId = Helper::get('eventId','event id is required');
        $effectRows = $eventModel->getParticipants($eventId);
        Helper::echoJson(200, "Score update successfully", $effectRows, null, null, Helper::echoBackBtn(1,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getIndexScoreHistory() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("EVENT","GET") or Helper::throwException(null,403);
        $eventModel = new \model\EventModel();
        $participantId = Helper::get('participantId','participant id is required');
        $rankHistoryArr = $eventModel->getParticipantHistory($participantId);
        Helper::echoJson(200, "success", $rankHistoryArr, null, null, Helper::echoBackBtn(1,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}


?>
