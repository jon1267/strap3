<?php
// обработка авторизации(вход). Регистрация - это када мы (точнее юзер) в первый раз заводим
// наши данные, юзер сохраняется в табл `users` получает письмо активации, активируется...
// Все последующие входы, делается авторизация(вход), это  ввод токо логина и пароля...мб псица запомнить меня (автоавторизация)
if(isset($_POST['login'],$_POST['pass'])) {
	// ищем, есть ли в БД `users` хотя-бы 1 пользователь 
	// с введенным при авторизации логином и пассом
	session_start(); // твою мать...заработала вставка меню админа
	$salt  = 'ABCD';
	$salt2 = 'DCBA';
	$link = mysqli_connect('localhost','test','test','main');
	mysqli_set_charset($link,'utf8');
	$res = mysqli_query($link,"
		SELECT * FROM `users`
		WHERE `login`    = '".mysqli_real_escape_string($link,$_POST['login'])."'
		  AND `password` = '".crypt(md5($_POST['pass'].$salt),$salt2)."'
		  AND `active` = 1
		LIMIT 1
	") or die(mysqli_error($link));
	// если $res непустой, то авторизацию считаем успешной...
	// создаем массив $_SESSION['user']= array(ID,LOGIN,PASSWORD,EMAIL,age,active,hash,access)
	if(mysqli_num_rows($res)) {
		$_SESSION['user'] = mysqli_fetch_assoc($res);
		$status = 'OK';
		header("Location: /static/main");
		exit();
// Закоментировал я потом это проверить, это хорошая штука
//		if(isset($_POST['autoauth'])) {
//			// если поставлена псица авто-авторизации то: заносим в таблицу `users` hash, ?IP и ?HTTP_USER_AGENT
//			// и создаем куки (autoauthid, autoauthhash, ???IP ???HTTP_USER_AGENT)
//			$autoauthhash = myHash($_SESSION['user']['id'].$_SESSION['user']['login'].$_SESSION['user']['email']);
//			setcookie('autoauthid',$_SESSION['user']['id'],time()+3600*24*30,'/');
//			setcookie('autoauthhash',$autoauthhash,time()+3600*24*30,'/');
//			$_COOKIE['autoauthid'] = $_SESSION['user']['id'];
//			$_COOKIE['autoauthhash'] = $autoauthhash;
//			// вроде куку с ИП делать ненадо - токо в базу ???
//			//setcookie('autoauthip',$_SERVER['REMOTE_ADDR'],time()+3600*24*30,'/');
//			//$_COOKIE['autoauthip'] = $_SERVER['REMOTE_ADDR'];
//			q("
//			  UPDATE `users` SET
//			  `hash` = '".es($autoauthhash)."'
//			  WHERE `id` = ".(int)$_SESSION['user']['id']."
//			");
//			//   /static/temp покажет состояние сессии и куки
//		}

	} else {
		$error = 'Нет пользователя с таким логином или паролем...';
		// доработать. Нада сообщение что нету такова логина-пароля
		header("Location: /static/main");
		exit();
	}
}