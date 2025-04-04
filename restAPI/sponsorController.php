<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";

function getSponsor() {
    try {
        $userModel = new \model\UserModel();
        $sponsorModel = new \model\SponsorModel();
        $row =  $sponsorModel->modifySponsorById(1);
        Helper::echoJson(200, "Success", $row);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function modifySponsor() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority('SPONSOR', 'UPDATE') or Helper::throwException(null, 403);
        $sponsorModel = new \model\SponsorModel();
        $sponsorId = Helper::post('sponsor_id');
        $sponsorModel->modifySponsor($sponsorId);
        Helper::echoJson(200, "Success", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

?>
