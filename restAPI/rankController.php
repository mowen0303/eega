<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";


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

function addParticipantByAdmin() {
    try {
        $userModel = new \model\UserModel();
        $eventModel = new \model\EventModel();
        $userModel->isCurrentUserHasAuthority('EVENT', 'UPDATE') or Helper::throwException(null, 403);
        $result = $eventModel->addParticipant();
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
        $result = $eventModel->deleteParticipant();
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



?>
