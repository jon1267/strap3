<?php
// lesson25 2:10:13
// выход из сессии, удаление куки авто-авторизации
session_unset();
session_destroy();
setcookie('autoauthid',  '',time()-3600,'/');
setcookie('autoauthhash','',time()-3600,'/');

header('Location: /static/main');
exit();