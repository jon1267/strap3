<?php
// $CONT имя папки где лежим контроллер
// $SKIN имя папки со скином по умолчанию
class Core {
	static $CREATED  =  2013;
	static $CONT     = 'modules';
	static $SKIN     = 'default';
	//static $SKIN     = 'admin';// все плохо, все ломается все не работает...
	static $DB_NAME  = 'main';
	static $DB_LOGIN = 'test';
	static $DB_PASS  = 'test';
	static $DB_LOCAL = 'localhost';
	static $DOMAIN   = 'http://strap3.loc/';
	static $JS       = array();
	// чето так стили не подключаются, а чего ??? убирал эти 3 стр все одно...
	static $CSS      = array(
			'<link href="/css/bootstrap.css" rel="stylesheet">',
			'<link href="/css/font-awesome.css" rel="stylesheet">',
			'<link href="/css/style.css" rel="stylesheet">'
	);
	static $META     = array(
			'title'=>'Quick Truck транспортная компания',
			'description'=>'d',
			'keywords'=>'k'
		);
}
