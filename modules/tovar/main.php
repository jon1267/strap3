<?php
if(isset($_POST['delete'])) {
	foreach($_POST['ids'] as $k=>$v) {
		$_POST['ids'][$k] = (int)$v;
	}
	$ids = implode(',',$_POST['ids']);
	q("
		DELETE FROM `tovar`
		WHERE `id` IN (".$ids.")
	");
	$_SESSION['info'] = 'Товары были удалены';
	header("Location: /tovar");
	exit();	
}
if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	q("
	DELETE FROM `tovar`
	WHERE `id` = ".(int)$_GET['id']."
	");
	//$_SESSION['info'] = 'Товар с id = '.$_GET['id'].' был удален';
	$_SESSION['info'] = 'Товар был удален';
	header("Location: /tovar");
	exit();
}
$tovars = q("
  SELECT * 
  FROM `tovar` 
  ORDER BY `id` ASC
");

if(isset($_SESSION['info'])) {
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}