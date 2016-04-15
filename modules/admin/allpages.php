<?php
// allpages админки !!! 
if (!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5) {
	if($_GET['module'] != 'static' || $_GET['page'] != 'main') {
		header('Location: /admin/static/main');
		exit();
	}
}
// lesson 25, 2:17:15
// allpages.php - для проверки прав доступа к страницам сайта на лету, 
// по полям `active` и `access`
/*
if(isset($_SESSION['user'])) {
	$res = q("
		SELECT * FROM `users`
		WHERE `id` = ".$_SESSION['user']['id']."
		LIMIT 1
	");
	$_SESSION['user'] = mysqli_fetch_assoc($res);
	if($_SESSION['user']['active'] != 1) {
		header("Location: /cab/exit");
		exit();
	}
} 
// это мой код (: ЧЕТО СЮДА НЕ ПОПАДАЕТ ВАЩЕ !!!! тут проверяем возможна-ли авто-авторизация....
elseif(isset($_COOKIE['autoauthhash'],$_COOKIE['autoauthid'])) {
	
	// проверяем возможность на авто авторизацию: myHash(ID+LOGIN+EMAIL)
	// $_SESSION['user'] = mysqli_fetch_assoc($res);
	// и в БД и в куках хранить IP HTTP_USER_AGENT
	$res = q("
	   SELECT * FROM `users`
	   WHERE `id` = ".(int)$_COOKIE['autoauthid']."
	   AND `hash` = '".es($_COOKIE['autoauthhash'])."'
	   AND `active` = 1 
	   LIMIT 1
	");
	echo 'Авто овторизация - '.'<br>';
	print_r($res);
	if(mysqli_num_rows($res)) {
		$_SESSION['user'] = mysqli_fetch_assoc($res);
		$status = 'OK';
	} else {
		header("Location: /cab/exit");
		exit();
	}
}
*/

