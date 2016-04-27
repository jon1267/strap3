<?php 
//
// регистрация как на https:///school-php.com/ урок 20 1:35...
// 
// (обработка регистрации)
if(isset($_POST['login'],$_POST['password'],$_POST['email'])) {
	$errors = array();
	if(empty($_POST['login'])) {
		$errors['login'] = 'Не заполнен логин.';
	} elseif(mb_strlen($_POST['login']) < 3 ) {
		$errors['login'] = 'Логин слишком короткий. От 3 до 16 символов.';
	} elseif(mb_strlen($_POST['login']) > 16 ) {
		$errors['login'] = 'Логин слишком длинный. От 3 до 16 символов.';
	}
	if(empty($_POST['password'])) {
		$errors['password'] = 'Не заполнен пароль.';
	} elseif(mb_strlen($_POST['password']) < 5) {
		$errors['password'] = 'Пароль должен быть длиннее 4 символов.';
	}
	if( empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL) ) {
		$errors['email'] = 'Пустой или неверный email.';
	}
	// проверка на уникальность логина и емэйла
	if(!count($errors)) {
		$res = q("
			SELECT `id` FROM `users`
			WHERE `login` = '".es($_POST['login'])."'
			LIMIT 1
		");
		if( $res->num_rows ) {
			$errors['login'] = 'Такой логин уже занят.';
		}
		$res = q("
			SELECT `id` FROM `users`
			WHERE `email` = '".es($_POST['email'])."'
			LIMIT 1
		");
		if( $res->num_rows ) {
			$errors['email'] = 'Такой email уже занят.';
		}
	}

	if(!count($errors)) {
		// для отладки, чтоб база не распухала поставил обновление 1-ой (17-ой) записи...
		// в конечном варианте поставить INSERT INTO, убрать WHERE шоб они добавлялись...
		// UPDATE `users` SET      WHERE `id` = ".(int)'17'."
		q("
			INSERT INTO `users` SET
			`login`    = '".es($_POST['login'])."',
			`password` = '".myHash($_POST['password'])."',
			`email`    = '".es($_POST['email'])."',
			`hash`     = '".myHash($_POST['login'].$_POST['email'])."'
		");
		// `age`      = ".(int)$_POST['age'].",
		// в $id будет id токо што вставленой записи...
		//$id = mysqli_insert_id($link);
		$id = DB::_()->insert_id;

		$_SESSION['regok'] = "OK";
		//$_SESSION['access'] = 1; // думаю оно тут ненадо.
		
		Mail::$to = $_POST['email'];
		Mail::$subject = 'Регистрация на сайте';
		Mail::$text = 'Для завершения процедуры регистрации, пройдите по ссылке для активации Вашего аккаунта: '
						.Core::$DOMAIN.'cab/activate?id='.$id.'&hash='.myHash($_POST['login'].$_POST['email']).'';
		Mail::send();
//		//header("Location: /index.php?modules=static&page=registration");
		header("Location: /cab/registration");
		exit();
	}
}
