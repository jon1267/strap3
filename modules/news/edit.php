<?php 

if(isset($_POST['ok'],$_POST['title'],$_POST['cat'],$_POST['description'],$_POST['text'])) {
	q("
	  UPDATE `news` SET
	  `title`       = '".es(trimAll($_POST['title']))."',
	  `cat`         = '".es(trimAll($_POST['cat']))."',
	  `description` = '".es(trimAll($_POST['description']))."',
	  `text`        = '".es(trimAll($_POST['text']))."',
	  `date`        = NOW()
	 WHERE `id` = ".(int)$_GET['id']."
	");
	$_SESSION['info'] = 'Запись была изменена';
	header('Location: /news');
	exit();
}
// делаем выборку одной записи к-рую будем редактировать...
$news = q("
	SELECT * FROM `news`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
// если прошлая выборка вернула 0 записей, возврат в блок новостей
if(!mysqli_num_rows($news)) {
	$_SESSION['info'] = 'Данной новости не существует';
	header('Location: /news');
	exit();		
}
// а если в выборке есть 1 запись, то создаем массив вида $row['id'] $row['title'] $row['cat'] и тп
$row = mysqli_fetch_assoc($news);

// если в $_POST['title'] есть что-то, типа, начали вводить, незаполнили все поля нажали сохранить, 
// после возврата к редактир...нада чтоб в поле было не значение из БД, а осталось то, что ввел пользователь...
if(isset($_POST['title'])) {$row['title'] = $_POST['title'];}
//if(isset($_POST['title'],$_POST['cat'],$_POST['description'],$_POST['text'])) {
//	$row['title']       = $_POST['title'];
//	$row['cat']         = $_POST['cat'];
//	$row['description'] = $_POST['description'];
//	$row['text']        = $_POST['text'];
//}
