<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";

function getAnnounceList() {
    try {
        $announceModel = new \model\AnnounceModel();
        $result = $announceModel->getAnnounces([0]);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function modifyAnnounce() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority('ANNOUNCE', 'UPDATE') or Helper::throwException(null, 403);
        $announceModel = new \model\AnnounceModel();
        $announceId = Helper::post('announce_id',"announce id is required");
        $announceModel->modifyAnnounce($announceId);
        Helper::echoJson(200, "Success", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

?>
