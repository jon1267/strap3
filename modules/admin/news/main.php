<?php
// Удаление группы новостей, отмеч. чекбоксом...
if(isset($_POST['delete'])) {
	
	$_POST['ids'] = intAll($_POST['ids']); // в массиве $_POST['ids'][0],$_POST['ids'][1] только целые
	$ids = implode(',',$_POST['ids']);     // $ids - что то, вида '9,4,2,1' где внутри '' целые
	q("
	  DELETE FROM `news`
	  WHERE `id` IN (".$ids.")
	");
	$_SESSION['info'] = 'Группа новостей была удалена';
	header('Location: /admin/news');
	exit();	
}
// удаление одной новости по ссылке по /news?action=delete&id=<echo $row['id']>
if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	q("
	  DELETE FROM `news`
	  WHERE `id` = ".(int)$_GET['id']."
	");
	$_SESSION['info'] = 'Новость была удалена';
	header('Location: /admin/news');
	exit();
}
// получаем выборкой все новости  
$news = q("
  SELECT * FROM `news`
  ORDER BY `id` DESC
");
// если существует  $_SESSION['info'] то сохраним ее в $info...
// это передача переменной между страницами add.php и main.tpl тк они не сохраняются...
if(isset($_SESSION['info'])) {
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}