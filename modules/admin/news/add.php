<?php
// Админ. Добавление 1ой новости с бутсрапом3
if(isset($_POST['add'],$_POST['title'],$_POST['date'],$_POST['description'],$_POST['text'])) {
	// удаление лидирующих и замыкающих пробелов
	foreach($_POST as $k=>$v) {
		$_POST[$k] = trim($v);
	}

	$errors = array();
	if( empty($_POST['title']) ) {
		$errors['title'] = 'Нет заголовока новости';
	}
	if( empty($_POST['description']) ) {
		$errors['description'] = 'Нет описания новости';
	}
	if( empty($_POST['text']) ) {
		$errors['text'] = 'Нет текста новости';
	}
//
// Итого по факту после долгих боданий...Если дата выбрана дэйтепикером (т.е.$_POST['date']='dd.mm.Y') то работает код
// `date` = STR_TO_DATE('". $_POST['date'] ."', '%d.%m.%Y'),  - это в SQL запросе - это фактич sql код...
// Если есть желание записать текущ дату - то срабатывает, `date` = 'NOW()', или `date` = 'CURDATE()',
// ну а моя функция для ненагруж пректов...
	if(!empty($_POST['date'])){
		$_POST['date'] = datsql($_POST['date']);
	}

	if (!count($errors)) {
// Ура кажись нашел...дата в $_POST['date'] дд.мм.гггг запишется в базу как Y-mm-dd те в родном MySQL формате
// `date`        = STR_TO_DATE('". $_POST['date'] ."', '%d.%m.%Y'),
		q("
	  INSERT INTO `news` SET
	  `title`       = '" . es(trimAll($_POST['title'])) . "',
	  `date`        = '" . es(trimAll($_POST['date'])) . "',
	  `description` = '" . es(trimAll($_POST['description'])) . "',
	  `text`        = '" . es(trimAll($_POST['text'])) . "'
	");
	//  = STR_TO_DATE('". $_POST['date'] ."', '%d.%m.%Y'),
	// `date`        = '" . $_POST['date'] . "',
		$_SESSION['info'] = 'Новость была добавлена';
		header('Location: /admin/news');
		exit();
	}
}