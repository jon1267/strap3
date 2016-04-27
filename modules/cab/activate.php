<?php
// lesson 35 time 37:55
// так подключают файл с ява скриптами. Он будет доступен токо для этого php файла.  js?15 - трюк
// Core::$JS[] = '<script type="text/javascript" src="/skins/default/js/scripts_v1.js?15"></script>';
//
// обработка активации... если удачна регистрация, юзеру отправлено письмо
// со ссылкой для активации его аккаунта. Юзер кликнул по ссылке и сюда 
// пришло $_GET['id'] и $_GET['hash'] 
if(isset($_GET['hash'],$_GET['id'])) {
	q("
		UPDATE `users` SET
		`active` = 1
		WHERE `id` = ".(int)$_GET['id']."
		AND `hash` = '".es($_GET['hash'])."'
	");
	$info = 'Ваш аккаунт успешно активирован.';
} else {
	$info = 'Вы прошли по неверной ссылке.';
}
