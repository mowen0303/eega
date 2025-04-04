<?php
if($_SERVER['SERVER_NAME'] === "localhost"){
    require_once $_SERVER['DOCUMENT_ROOT']."/commonServices/localhostKey.php";
}else{
    require_once $_SERVER['DOCUMENT_ROOT']."/commonServices/serverKey.php";
}
session_start();
@header("Content-type:text/html; charset=utf-8");
@header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
@header('Access-Control-Allow-Credentials: true');
// header('Access-Control-Allow-Origin: *');
// header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
// header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
error_reporting(E_ALL^E_WARNING^E_NOTICE^E_STRICT);
date_default_timezone_set("America/Toronto");
$dbInfo = array('host'=>SERVER_KEY['db_host'],'user'=>SERVER_KEY['db_user'],'password'=>SERVER_KEY['db_password'],'database'=>SERVER_KEY['db_database']);
const HST = 0.13;
const HST_STR = (HST*100).'%';
const DEV_MODEL = true;
const USER_PK = 'pss';
const UPLOAD_FOLDER = "/upload";
const NO_IMG = "/admin/resource/img/noimg.png";
const SETTING_JSON = "/commonServices/manualSetting.json";
$place_json = file_get_contents($_SERVER['DOCUMENT_ROOT'] . "/resource/json/place.json");
$place_arr = json_decode($place_json);
require_once $_SERVER['DOCUMENT_ROOT']."/commonServices/SqlTool.php";
require_once $_SERVER['DOCUMENT_ROOT']."/commonServices/Helper.php";
require_once $_SERVER['DOCUMENT_ROOT']."/commonServices/Model.php";
require_once $_SERVER['DOCUMENT_ROOT']."/commonServices/authority.php";
spl_autoload_register(function($name){$name = str_replace("\\","/",$name);include_once $_SERVER['DOCUMENT_ROOT']."/{$name}.php";});
call_user_func(@$_GET['action']);

const WEBSITE_NAME = "EEGA";

?>