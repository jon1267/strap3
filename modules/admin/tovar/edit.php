<?php

if(isset($_POST['ok'],$_POST['name'],$_POST['kategory'],$_POST['kropis'],$_POST['opis'],$_POST['cena'],$_POST['kol'])){
	// удаление лидирующих и замыкающих пробелов
	foreach($_POST as $k=>$v) {
		$_POST[$k] = trim($v);
	}
	q("
	  UPDATE `tovar` SET
	  `name`     = '".es($_POST['name'])."',
	  `kategory` = '".es($_POST['kategory'])."',
	  `kropis`   = '".es($_POST['kropis'])."',
	  `opis`     = '".es($_POST['opis'])."',
	  `cena`     = ".(int)$_POST['cena'].",
	  `kol`      = ".(int)$_POST['kol']."
	  WHERE `id` = ".(int)$_GET['id']."
	");
	$_SESSION['info']='Запись была изменена';
	header('Location: /admin/tovar');
	exit();
}

$tovars = q("
	SELECT * FROM `tovar`
	WHERE `id` = ".(int)$_GET['id']."
	LIMIT 1
");
if(!mysqli_num_rows($tovars)) {
	$_SESSION['info']='Данной записи не существует';
	header("Location: /admin/tovar");
	exit();
}
$row = mysqli_fetch_assoc($tovars);

// это если при корректировке, в поле набрали что-то, и вылезла ошибка,
// тогда этот код сохранит набранное, а не возьмет значение из базы...
//if(isset($_POST['name'])) {
//	$row['name'] = $_POST['name'];
//}
