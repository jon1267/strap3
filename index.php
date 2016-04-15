<?php
error_reporting(-1);
ini_set('display_errors',1);
header('Content-Type: text/html; charset=utf-8');
session_start();

// Конфиг сайта и вспом. функц.
include_once './config.php';
include_once './libs/default.php';

// открытие базы...поставили перед variables.пхп тк будет переделка 
// variables.php под доставание статич. страниц из БД 
$link = mysqli_connect(Core::$DB_LOCAL,Core::$DB_LOGIN,Core::$DB_PASS,Core::$DB_NAME);
mysqli_set_charset($link,'utf8');

include_once './variables.php';

//Роутер
ob_start();
	
	// allpages.php // код проверок выполняющийся перед загрузкой каждой php страницы...
	// ...['module'].'/'...['page'].'.php'; - это загрузка какой-то стр. из какого-то модуля. По МВС вней токо обработка...вывода нет...
	// ...['module'].'/'...['page'].'.tpl'; - это загрузка каког-то tpl из какого-л модуля. В нем вывод php подключенного строкой выше...
	//include './modules/allpages.php';
	//include './modules/'.$_GET['module'].'/'.$_GET['page'].'.php';
	
	// отсекаем не существующ. файлы *.php и *.tpl 
	if(!file_exists('./'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php') || !file_exists('./skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl') ) {
		header('Location: /errors/404');
		exit();
	}
	include './'.Core::$CONT.'/allpages.php';
	include './'.Core::$CONT.'/'.$_GET['module'].'/'.$_GET['page'].'.php';
	include './skins/'.Core::$SKIN.'/'.$_GET['module'].'/'.$_GET['page'].'.tpl';
	$content = ob_get_contents();
ob_end_clean();

include './skins/'.Core::$SKIN.'/index.tpl';
