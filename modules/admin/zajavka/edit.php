<?php

if(isset($_POST['ok'],$_POST['otkuda'],$_POST['kuda'],$_POST['transp'],$_POST['datap'],$_POST['gruz'],
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
	if(!empty($_POST['ves']) AND  !filter_var($_POST['ves'],FILTER_VALIDATE_INT) ) {
		$errors['ves'] = 'Вес кг, число 1 - 99999';
	}
	if(!empty($_POST['vol']) AND  !filter_var($_POST['vol'],FILTER_VALIDATE_INT) ) {
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
		  UPDATE `zajavka` SET
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
		  WHERE `id` = " . (int)$_GET['id'] . "
		");
		$_SESSION['info'] = 'Заявка была изменена';
		header('Location: /admin/zajavka/main');
		exit();
	}
}

$zajavki = q("
	SELECT * FROM `zajavka`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if( !$zajavki->num_rows ) {
	$_SESSION['info']='Данной заявки не существует';
	header("Location: /admin/zajavka/main");
	exit();
}
$row = $zajavki->fetch_assoc();
if(!empty($row['datap'])) {
	// тут дата дб в виде Y-mm-dd конвертим в dd.mm.Y для отбр в форме
	$row['datap'] = datru($row['datap']);
}

// это если при корректировке, в поле набрали что-то, и вылезла ошибка,
// тогда этот код сохранит набранное, а не возьмет значение из базы...
if(isset($_POST['ok'],$_POST['otkuda'],$_POST['kuda'],$_POST['transp'],$_POST['datap'],$_POST['gruz'],
	$_POST['ves'],$_POST['vol'],$_POST['fio'],$_POST['tel'],$_POST['email'],$_POST['notes'])) {
	foreach($_POST as $k => $v) {
		$row[$k] = $_POST[$k];
	}
	if(!empty($row['datap'])) {
		// тут дата дб в виде Y-mm-dd конвертим в dd.mm.Y для отбр в форме
		$row['datap'] = datru($row['datap']);
	}
}
