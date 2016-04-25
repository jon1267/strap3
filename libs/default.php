<?php
/*
Alias:
q()
es()

Работа с объектом выборка:
$res = q(); //запрос с возвратом результата. $res - объекто
$res->num_rows; //кол-во возвращенных строк, аналог mysqli_num_rows();
$res->fetch_assoc(); //достаем запись, аналог mysqli_fetch_assoc();
$res->close(); // очистка результата выборки, (очистка объекта $res)

Работа с подключеной MYSQL
DB::_()->affected_rows; // Кол-во измененных записей
DB::_()->insert_id; // последний ID вставки
DB::_()->query(); // аналог функции q();
DB::_()->multi_query(); // множественные запросы
DB::_()->real_escape_string(); // аналог функции es();

DB::close(); // Закрываем соединение с БД
*/

class DB {
	static public $mysqli  = array();
	static public $connect = array();
	
	static public function _($key=0) {
		
		if(!isset(self::$mysqli[$key])) {
			if(!isset(self::$connect['server']))
				self::$connect['server'] = Core::$DB_LOCAL;
			if(!isset(self::$connect['user']))
				self::$connect['user'] = Core::$DB_LOGIN;
			if(!isset(self::$connect['pass']))
				self::$connect['pass'] = Core::$DB_PASS;
			if(!isset(self::$connect['db']))
				self::$connect['db'] = Core::$DB_NAME;
			
			self::$mysqli[$key] = @new mysqli( self::$connect['server'], self::$connect['user'], self::$connect['pass'],	self::$connect['db'] );
			if(mysqli_connect_errno()) {
				echo 'Не удалось подключиться к Базе Данных.';
				exit;
			}
			if(!self::$mysqli[$key]->set_charset("utf8")) {
				echo 'Ошибка при загрузке набора символов utf8: '.self::$mysqli[$key]->error;
				exit;
			}
		}
		return self::$mysqli[$key];
	}
	
	static public function close($key = 0) {
		self::$mysqli[$key]->close();
		unset(self::$mysqli[$key]);
	}
}

// mysqli_query с обработчиком ошибок...
function q($query,$key = 0) {
	//в $res будет результат SQL запроса, или false при ошибке...
	$res = DB::_($key)->query($query);
	if($res === false) {
		$info = debug_backtrace();
		$error = "Zapros: ".$query."<br>\n".DB::_($key)->error."<br>\n".
				 "File :  ".$info[0]['file']."<br>\n".
				 "Line :  ".$info[0]['line']."<br>\n".
				 "Date:   ".date("d-m-Y H:i:s")."<br>\n".
				 "======================================";

		file_put_contents('./logs/mysql.log',strip_tags($error)."\n\n",FILE_APPEND);
		echo $error;
		exit();
	}
		return $res;
}

function es($el,$key = 0){
	return DB::_($key)->real_escape_string($el);
}
//
//
//
function wtf($array, $stop = false) {
	echo '<pre>'.print_r($array,1).'</pre>';
	if(!$stop) {
		exit();
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
//function  es($el) {
//	if(!is_array($el)) {
		//$link это ссылка на открытую в index.php DB
//		global $link;
//		$el = mysqli_real_escape_string($link,$el);
//	} else {
//		$el = array_map('es',$el);
//	}
//	return $el;
//}

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
	$datel = substr($datel,0,10); //отсекаем дату из даты-времени
	$tmp = explode('.',$datel);
	$datel = $tmp[2]."-".$tmp[1]."-".$tmp[0];
	if( $datel == '0000-00-00' ) $datel = ''; // это нифига не работает, в базу идут нули...
	return $datel;
}

// конвертиров даты (и даты-времени) формата MySQL 2016-05-28 в формат 28.05.2016
// вход строка в Y-mm-dd разделенная тире
function datru($datel) {
	//$tmp[]=('2015','05','28')
	if(empty($datel)) return ;
	$datel = substr($datel,0,10); //отсекаем дату из даты-времени
	$tmp = explode('-',$datel);
	$datel = $tmp[2].'.'.$tmp[1].'.'.$tmp[0];
	if( $datel == '00.00.0000' ) $datel = ''; // это нифига не работает, в базу идут нули...
	return $datel;
}
