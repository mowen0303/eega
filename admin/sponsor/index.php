<?php
    require_once $_SERVER['DOCUMENT_ROOT'] . "/admin/_template/header.php";
    Helper::loadSnippet($_GET[s],'User','event-list');
    require_once $_SERVER['DOCUMENT_ROOT'] . "/admin/_template/footer.php";
?>
