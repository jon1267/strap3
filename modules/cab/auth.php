<?php
// обработка авторизации(входа). Регистрация - это када мы (точнее юзер) в первый раз заводим
// наши данные, юзер сохраняется в табл `users` получает письмо активации, активируется...
// Все последующие входы, делается авторизация(вход), ввод токо логина и пароля...мб псица запомнить меня (автоавторизация)
// ЭТО - обработка входа через модальное окно. Сложнее отдельной html стр. *.tpl ненужен, вывод делать нельзя.
if(isset($_POST['login'],$_POST['pass'])) {
	// ищем, есть ли в БД `users` хотя-бы 1 пользователь 
	// с введенным при авторизации логином и пассом

	//----???--- вот тут !!! уже повторный коннект к БД. Просто ухожу от fatal error Нада делать класс,
	// проверять есть ли коннект, если уже есть return указатель на коннект, если нет то тада коннектить к бд.
	session_start(); // твою мать... токо так заработала вставка меню админа.
	include_once '../../config.php';
	include_once '../../libs/default.php';

	$link = mysqli_connect(Core::$DB_LOCAL,Core::$DB_LOGIN,Core::$DB_PASS,Core::$DB_NAME);
	mysqli_set_charset($link,'utf8');
	//----???---

	$res = q("
		SELECT * FROM `users`
		WHERE `login` = '".es($_POST['login'])."'
		  AND `password` = '".myHash($_POST['pass'])."'
		  AND `active` = 1
		LIMIT 1
	");
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
		$_SESSION['error'] = 'NO';
		$error = 'Нет пользователя с таким логином или паролем...';
		// доработать. Нада сообщение что нету такова логина-пароля
		// include_once '../../skins/default/cab/auth.tpl'; кстати это работает но ничего не решает...
		// sleep(3); пауза в 3 секунды
		header("Location: /static/main");
		exit();
	}
}