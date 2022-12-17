<?php
//用户权限配置
$_AUT = [
    'SYSTEM_SETTING'=>
        [
            'ADMIN_LOGIN'=>getAuthorityNum(1),
            'USER_CATEGORY'=>getAuthorityNum(2)
        ],
    'USER'=>
        [
            'GET'=>getAuthorityNum(1),
            'ADD'=>getAuthorityNum(3),
            'UPDATE'=>getAuthorityNum(4),
            'DELETE'=>getAuthorityNum(5),
        ]
];
function getAuthorityNum($int){return pow(2,$int);}
?>
