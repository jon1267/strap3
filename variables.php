<?php
if(isset($_GET['route'])) {
	$temp = explode('/',$_GET['route']);
	// если админка - настраиваем каталоги на контроллер и скины админки
	if($temp[0] == 'admin') {
		Core::$CONT = Core::$CONT.'/admin';
		Core::$SKIN = 'admin';
		unset($temp[0]);
	}
	// для простых юзеров. перебираем командную строку вида http://less26.loc/static/main/bla/bla/bla
	$i = 0;
	foreach($temp as $k=>$v) {
		if($i == 0) {
			if(!empty($v)) {
				$_GET['module'] = $v;
			}
		} elseif($i == 1) {
			if(!empty($v)) {
				$_GET['page'] = $v;
			}
		} else {
			$_GET['key'.($k-1)] = $v;
		}
		++$i;
	}
	unset($_GET['route']);
}

$allowed = array('static','contacts','aboutus','zajavka','program1','cab','errors','news','tovar');
if(!isset($_GET['module'])) {
	$_GET['module'] = 'static';
} elseif(!in_array($_GET['module'],$allowed) && Core::$SKIN != 'admin') {
	header("Location: /errors/404");
	exit();
}

if(!isset($_GET['page'])) {
	$_GET['page'] = 'main';
}

// запрещаем из командной строки любые символы кроме a-z0-9-_
if(!preg_match('#^[a-z0-9-_]#iu',$_GET['page'])) {
	header("Location: /errors/404");
	exit();
}

// Проверить работу в форме и поубирать в q("...es(trimAll) ");
if(isset($_POST)) {
	$_POST = trimAll($_POST);
}