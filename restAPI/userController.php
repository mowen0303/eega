<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/commonServices/config.php";

/**
 * 登录
 */
function login(){
    try {
        $userModel = new \model\UserModel();
        $result = $userModel->login();
//        Helper::jumpTo('/admin/adminIndex.php');
        if(Helper::post('marketing') == true){
            Helper::echoJson(200, "success", $result);
        }else{
            Helper::jumpTo('/admin/user/index.php?s=user-list');
        }
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function isLogin(){
    try {
        $userModel = new \model\UserModel();
        $result = $userModel->isLogin();
        Helper::echoJson(200, "success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

/**
 * 登出
 */
function logout() {
    try {
        $userModel = new \model\UserModel();
        $userModel->logout();
        if (Helper::isRequestFromCMS()) {
            Helper::jumpTo('/admin/adminLogin.php');
        } else {
            Helper::echoJson(200, 'OK');
        }
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function modifyUser() {
    try {
        $userModel = new \model\UserModel();
        $userId = (int) Helper::post('user_id');
        if($userId){
            //修改
            $userModel->isCurrentUserHasAuthority('USER', 'UPDATE', $userId) or Helper::throwException(null, 403);
            $userModel->modifyUser($userId,true);
        }else{
            //添加
            $userModel->isCurrentUserHasAuthority('USER', 'ADD') or Helper::throwException(null, 403);
            $userModel->modifyUser();
        }
        Helper::echoJson(200, "Success! {$userModel->imgError}", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), "Failed : {$e->getMessage()} {$userModel->imgError}");
    }
}

function updateMyProfile() {
    try {
        $userModel = new \model\UserModel();
        $userId = (int) $_COOKIE['cc_id'] or Helper::throwException("No auth", 403);
        $id = $userModel->modifyUser($userId);
        $option['customSelectFields'] = ['user_pin','user_id','user_name','user_first_name','user_last_name','user_email','user_phone','user_avatar'];
        $result = $userModel->getUsers([$userId],$option)[0] or Helper::throwException(null,404);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), "Failed : {$e->getMessage()} {$userModel->imgError}");
    }
}

function updateMyPwd() {
    try {
        $userModel = new \model\UserModel();
        $userId = $userModel->getCurrentuserId();
        $userModel->updatePassword($userId);
        Helper::echoJson(200, "Success");
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), "Failed : {$e->getMessage()} {$userModel->imgError}");
    }
}

function updatePassword() {
    try {
        $userModel = new \model\UserModel();
        $targetUserId = Helper::post('user_id','User Id can not be null');
        $userModel->validateCurrentUserHasAuthorityToManageTargetUser($targetUserId);
        $userModel->updatePassword($targetUserId);
        Helper::echoJson(200, 'Success! You have changed the user password!', null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function deleteUserByIds() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority("USER","DELETE") or Helper::throwException(null,403);
        $effectRows = $userModel->deleteUserByIds();
        Helper::echoJson(200, "{$effectRows} user(s) has been deleted", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getMembers(){
    try {
        $userModel = new \model\UserModel();
        $option['customSelectFields'] = ['user_id','user_name','user_first_name','user_last_name','user_email','user_phone','user_avatar','user_category_title','user_category_id'];
        $option['showAll'] = true;
        $option['orderBy'] = Helper::get('orderBy');
        $option['sort'] = Helper::get('sort');
        $userId = $userModel->getCurrentUserId();
        $result = $userModel->getUsers([0],$option) or Helper::throwException(null,404);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getUser(){
    try {
        $userModel = new \model\UserModel();
        $userId = Helper::get('user_id','user id is required');
        $option['customSelectFields'] = ['user_id','user_name','user_first_name','user_last_name','user_email','user_phone','user_avatar'];
        $result = $userModel->getUsers([$userId],$option)[0] or Helper::throwException(null,404);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function getMyProfile(){
    try {
        $userModel = new \model\UserModel();
        $userId = $userModel->getCurrentUserId();
        $option['customSelectFields'] = ['user_pin','user_id','user_name','user_first_name','user_last_name','user_email','user_phone','user_avatar'];
        $result = $userModel->getUsers([$userId],$option)[0] or Helper::throwException(null,404);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}

function updateMyPin(){
    try {
        $userModel = new \model\UserModel();
        $userId = $userModel->getCurrentUserId();
        $userModel->generatePIN($userId);
        $option['customSelectFields'] = ['user_pin','user_id','user_name','user_first_name','user_last_name','user_email','user_phone','user_avatar'];
        $result = $userModel->getUsers([$userId],$option)[0] or Helper::throwException(null,404);
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage());
    }
}



/**
 * ============================================
 * ============== User Category ===============
 * ============================================
 */

/**
 * 添加、更新用户分类
 */
function modifyUserCategory() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority('SYSTEM_SETTING', 'USER_CATEGORY') or Helper::throwException(null, 403);
        $userModel->modifyUserCategory();
        Helper::echoJson(200, "Success", null, null, null, Helper::echoBackBtn(0,true));
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), $e->getMessage(), null, null, null);
    }
}

/**
 * `删除`用户分类（只有GOD可以操作）
 */
function deleteUserCategoryByIds() {
    try {
        $userModel = new \model\UserModel();
        $userModel->isCurrentUserHasAuthority('SYSTEM_SETTING', 'USER_CATEGORY') or Helper::throwException(null, 403);
        $effectRows = $userModel->deleteUserCategoryByIds();
        Helper::echoJson(200, "Success : {$effectRows} rows data has been deleted", null, null, null, $_SESSION['back_url_1']);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), "Failed : {$e->getMessage()}");
    }
}

function generatePINOfCurrentUser() {
    try {
        $userModel = new \model\UserModel();
        $result = $userModel->generatePIN($userModel->getCurrentUserId());
        Helper::echoJson(200, "Success", $result, null, null, $_SESSION['back_url_1']);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), "Failed : {$e->getMessage()}");
    }
}

function getAmountOfUser() {
    try {
        $userModel = new \model\UserModel();
        $result = $userModel->getAmountOfUser();
        Helper::echoJson(200, "Success", $result);
    } catch (Exception $e) {
        Helper::echoJson($e->getCode(), "Failed : {$e->getMessage()}");
    }
}


?>
