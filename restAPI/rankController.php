<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";


function getRank() {
    try {
        $userModel = new \model\UserModel();
        $rankModel = new \model\RankModel();
        $userModel->isCurrentUserHasAuthority('RANK', 'GET') or Helper::throwException(null, 403);
        $option['type'] = $eventId = Helper::get('type');
        $rankArr = $rankModel->getRank($option);
        Helper::echoJson(200, "Success", $rankArr);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getRankHistory() {
    try {
        $userModel = new \model\UserModel();
        $rankModel = new \model\RankModel();
        $userId = Helper::get('userId','user id is required');
        $userModel->isCurrentUserHasAuthority('RANK', 'GET') or Helper::throwException(null, 403);
        $rankHistoryArr = $rankModel->getRankHistory($userId);
        Helper::echoJson(200, "Success", $rankHistoryArr);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

?>
