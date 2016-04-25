<?php

function wtf($array, $stop = false) {
	echo '<pre>'.print_r($array,1).'</pre>';
	if(!$stop) {
		exit();
	}
}

// mysqli_query с обработчиком ошибок...
function q($query){
	//$link это ссылка на открытую в index.php DB
	global $link;
	//в $res будет результат SQL запроса, или false при ошибке...
	$res = mysqli_query($link,$query);
	if($res === false) {
		$info = debug_backtrace();
		$error = "Zapros: - ".strip_tags($query)."<br>\n";
		$error.= "Error: - ".mysqli_error($link)."<br>\n";
		$error.= "File : - ".$info[0]['file']."<br>\n";
		$error.= "Line : - ".$info[0]['line']."   Date: ".date("d-m-Y H:i:s")."<br>\n\n";
		file_put_contents('./logs/mysql.log',$error,FILE_APPEND);
		echo $error;
		exit();
	} else {
		return $res;
	}
}

// Удаление пробелов (также табуляций, новой строки, возвр.каретки, NULL и тп символов)
// вначале и вконце строчн.элементов...Работает также если элемент окажется массивом (рекурсия)
function trimAll($el) {
	if(!is_array($el)){
		$el = trim($el);
	} else {
		$el = array_map('trimAll',$el);
	}
	return $el;
}

// приведение содержимого массива к целому типу...
// Работает также если элемент окажется массивом (рекурсия)
function intAll($el) {
	if(!is_array($el)) {
		$el = (int)$el;
	} else {
		$el = array_map('intAll',$el);
	}
	return $el;
}

// приведение содержимого массива к вещественному типу...
// Работает также если элемент окажется массивом (рекурсия)
function floatAll($el) {
	if(!is_array($el)) {
		$el = (float)$el;
	} else {
		$el = array_map('floatAll',$el);
	}
	return $el;
}

// mysqli_real_escape_string и htmlspecialchars по аналогии с trimAll($el)
// mysqli_real_escape_stringAll($el) myresAll($el) es($el)
function  es($el) {
	if(!is_array($el)) {
		//$link это ссылка на открытую в index.php DB
		global $link;
		$el = mysqli_real_escape_string($link,$el);
	} else {
		$el = array_map('es',$el);
	}
	return $el;
}
// htmlspecialchars по аналогии с trimAll($el)
function hc($el) {
	if(!is_array($el)) {
		$el = htmlspecialchars($el);
	} else {
		$el = array_map('hc',$el);
	}
	return $el;
}

// функция автоподгрузки класса из ./libs/
function __autoload($class) {
	include './libs/class_'.$class.'.php';
}

// функция хэширования, с солью, путанная, все по взрослому...:)
function myHash($var) {
	$salt  = 'ABCD';
	$salt2 = 'DCBA';
	$var   = crypt(md5($var.$salt),$salt2); 
	return $var;
}

// конвертиров даты формата 28.05.2016 в формат MySQL 2016-05-28
// вход строка в dd.mm.Y разделенная точками
function datsql($datel) {
	//$tmp[]=('28','05','2016')
	if(empty($datel)) return ;
	$tmp = explode('.',$datel);
	$datel = $tmp[2]."-".$tmp[1]."-".$tmp[0];
	if( $datel == '0000-00-00' ) $datel = '';
	return $datel;
}

// конвертиров даты формата MySQL 2016-05-28 в формат 28.05.2016
// вход строка в Y-mm-dd разделенная тире
function datru($datel) {
	//$tmp[]=('2015','05','28')
	if(empty($datel)) return ;
	$tmp = explode('-',$datel);
	$datel = $tmp[2].'.'.$tmp[1].'.'.$tmp[0];
	if( $datel == '00.00.0000' ) $datel = '';
	return $datel;
}