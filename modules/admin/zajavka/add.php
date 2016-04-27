<?php
//wtf($_POST,1);
if(isset($_POST['add'],$_POST['otkuda'],$_POST['kuda'],$_POST['transp'],$_POST['datap'],$_POST['gruz'],
		 $_POST['ves'],$_POST['vol'],$_POST['fio'],$_POST['tel'],$_POST['email'],$_POST['notes'])){
	// удаление лидирующих и замыкающих пробелов
	foreach($_POST as $k=>$v) {
		$_POST[$k] = trim($v);
	}

	$errors = array();
	if( empty($_POST['otkuda']) ) {
		$errors['otkuda'] = 'Не заполнено поле откуда';
	}
	if( empty($_POST['kuda']) ) {
		$errors['kuda'] = 'Не заполнено поле куда';
	}
	//if( empty($_POST['transp']) ) {
	//	$errors['transp'] = 'Укажите транспорт';
	//}
	if( empty($_POST['gruz']) ) {
		$errors['gruz'] = 'Укажите характер груза';
	}
	if( empty($_POST['fio']) ) {
		$errors['fio'] = 'Не указано контактное лицо';
	}
	// пробую отсечь пустое поле tel и пробую регулярку по № тел.
	if( empty($_POST['tel']) ) {
		$errors['tel'] = 'Нет телефона';
	} elseif (!preg_match('#^[\d-\s\+\(\)]+\d$#ui', $_POST['tel'])) {
		// регулярочка никакая, потом усилить...
		$errors['tel'] = 'Плохой номер';
	}
	if(!empty($_POST['ves']) AND  !filter_var($_POST['ves'],FILTER_VALIDATE_FLOAT) ) {
		$errors['ves'] = 'Вес кг, число 1 - 99999';
	}
	if(!empty($_POST['vol']) AND  !filter_var($_POST['vol'],FILTER_VALIDATE_FLOAT) ) {
		$errors['vol'] = 'Объем м3, от 1 - 999';
	}
	// if( empty($_POST['email']) || !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL) )
	if(!empty($_POST['email']) AND  !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL) ) {
		$errors['email'] = 'Неверный e-mail';
	}
	// работаем с датой data. Строка ниже - Функция MySQL
	// SELECT DATE_FORMAT("2008-11-19",'%d.%m.%Y');
	// преобразование даты из русской даты dd.mm.Y в MySQL дату Y-mm-dd
	if(!empty($_POST['datap'])){
		$_POST['datap'] = datsql($_POST['datap']);
	}

	if (!count($errors)) {
			q("
		  INSERT INTO `zajavka` SET
		  `otkuda`   = '" . es($_POST['otkuda']) . "',
		  `kuda`     = '" . es($_POST['kuda']) . "',
		  `transp`   = '" . es($_POST['transp']) . "',
		  `datap`    = '" . $_POST['datap'] . "',
		  `gruz`     = '" . es($_POST['gruz']) . "',
		  `ves`      = " . (float)$_POST['ves'] . ",
		  `vol`      = " . (float)$_POST['vol'] . ",
		  `fio`      = '" . es($_POST['fio']) . "',
		  `tel`      = '" . es($_POST['tel']) . "',
		  `email`    = '" . es($_POST['email']) . "',
		  `notes`    = '" . es($_POST['notes']) . "'
		");
		$_SESSION['info'] = 'Заявка добавлена';
		header('Location: /admin/zajavka/main');
		exit();
	}
//	echo "форма отправлена...";
//	exit();
}