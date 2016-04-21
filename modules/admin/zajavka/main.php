<?php
if(isset($_POST['delete']) && (!empty($_POST['ids'])) ) {
	foreach($_POST['ids'] as $k=>$v) {
		$_POST['ids'][$k] = (int)$v;
	}
	$ids = implode(',',$_POST['ids']);
	q("
		DELETE FROM `zajavka`
		WHERE `id` IN (".$ids.")
	");
	$_SESSION['info'] = 'Заявки были удалены';
	header("Location: /admin/zajavka");
	exit();	
}
if(isset($_GET['action']) && $_GET['action'] == 'delete') {
	q("
	DELETE FROM `zajavka`
	WHERE `id` = ".(int)$_GET['id']."
	");
	//$_SESSION['info'] = 'Товар с id = '.$_GET['id'].' был удален';
	$_SESSION['info'] = 'Заявка была удалена';
	header("Location: /admin/zajavka");
	exit();
}
$zajavki = q("
  SELECT * 
  FROM `zajavka`
  ORDER BY `id` ASC
");

if(isset($_SESSION['info'])) {
	$info = $_SESSION['info'];
	unset($_SESSION['info']);
}