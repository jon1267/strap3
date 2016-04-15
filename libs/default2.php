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
			
			self::$mysqli[$key] = @new mysqli(
								self::$connect['server'],
								self::$connect['user'],
								self::$connect['pass'],
								self::$connect['db']
							);
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

	// mysqli_query с обработчиком ошибок...
	function q($query,$key = 0) {
		//в $res будет результат SQL запроса, или false при ошибке...
		$res = DB::_($key)->qwery($query);
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

}

//
//
//
//