<?php 
if(isset($_POST['ok'],$_POST['title'],$_POST['date'],$_POST['description'],$_POST['text'])) {

	foreach ($_POST as $k => $v) {
		$_POST[$k] = trim($v);
	}

	$errors = array();
	if (empty($_POST['title'])) {
		$errors['title'] = 'Нет заголовока новости';
	}
	if (empty($_POST['description'])) {
		$errors['description'] = 'Нет описания новости';
	}
	if (empty($_POST['text'])) {
		$errors['text'] = 'Нет текста новости';
	}
//
// Итого по факту после долгих боданий...Если дата выбрана дэйтепикером (т.е.$_POST['date']='dd.mm.Y') то работает код
// `date` = STR_TO_DATE('". $_POST['date'] ."', '%d.%m.%Y'),  - это в SQL запросе - это фактич sql код...
// Если есть желание записать текущ дату - то срабатывает, `date` = 'NOW()', или `date` = 'CURDATE()',
// ну а моя функция для ненагруж пректов...
	if (!empty($_POST['date'])) {
		$_POST['date'] = datsql($_POST['date']);
	}
	if (!count($errors)) {
		q("
		  UPDATE `news` SET
		  `title`       = '" . es(trimAll($_POST['title'])) . "',
		  `date`        = '" . es(trimAll($_POST['date'])) . "',
		  `description` = '" . es(trimAll($_POST['description'])) . "',
		  `text`        = '" . es(trimAll($_POST['text'])) . "'
		 WHERE `id` = " . (int)$_GET['id'] . "
		");
		$_SESSION['info'] = 'Запись была изменена';
		header('Location: /admin/news');
		exit();
	}
}
// делаем выборку одной записи к-рую будем редактировать...
$news = q("
	SELECT * FROM `news`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
// если прошлая выборка вернула 0 записей, возврат в блок новостей
if(!$news->num_rows) {
	$_SESSION['info'] = 'Данной новости не существует';
	header('Location: /admin/news/main');
	exit();		
}
// а если в выборке есть 1 запись, то создаем массив вида $row['id'] $row['title'] $row['description'] и тп
$row = $news->fetch_assoc();
if(!empty($row['date'])) {
	// тут дата дб в виде Y-mm-dd конвертим в dd.mm.Y для отбр в форме
	$row['date'] = datru($row['date']);
}
// если в $_POST['title'] есть что-то, типа, начали вводить, незаполнили все поля нажали сохранить, 
// после возврата к редактир...нада чтоб в поле было не значение из БД, а осталось то, что ввел пользователь...
if(isset($_POST['ok'],$_POST['title'],$_POST['date'],$_POST['description'],$_POST['text'])) {
	foreach($_POST as $k => $v) {
		$row[$k] = $_POST[$v];
	}
	// if(!empty($row['date'])) $row['date'] = datru($row['date']);
}
//if(isset($_POST['title'],$_POST['cat'],$_POST['description'],$_POST['text'])) {
//	$row['title']       = $_POST['title'];
//	$row['cat']         = $_POST['cat'];
//	$row['description'] = $_POST['description'];
//	$row['text']        = $_POST['text'];
//}
