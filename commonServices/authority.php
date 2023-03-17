<?php
//用户权限配置
$_AUT = [
    'SYSTEM_SETTING' =>
    [
        'ADMIN_LOGIN' => getAuthorityNum(1),
        'USER_CATEGORY' => getAuthorityNum(2)
    ],
    'USER' =>
    [
        'GET' => getAuthorityNum(1),
        'ADD' => getAuthorityNum(2),
        'UPDATE' => getAuthorityNum(3),
        'DELETE' => getAuthorityNum(4),
    ],
    'EVENT' =>
    [
        'GET' => getAuthorityNum(1),
        'ENROLL' => getAuthorityNum(2),
        'ADD' => getAuthorityNum(3),
        'UPDATE' => getAuthorityNum(4),
        'DELETE' => getAuthorityNum(5),
    ],
    'PHOTO' =>
    [
        'GET' => getAuthorityNum(1),
        'ADD' => getAuthorityNum(2),
        'UPDATE' => getAuthorityNum(3),
        'DELETE' => getAuthorityNum(4),
    ],
    'SPONSOR' =>
    [
        'UPDATE' => getAuthorityNum(1),
    ],
    'RANK' =>
    [
        'GET' => getAuthorityNum(1),
    ],
    'ANNOUNCE' =>
    [
        'UPDATE' => getAuthorityNum(1),
    ]
];
function getAuthorityNum($int)
{
    return pow(2, $int);
}
