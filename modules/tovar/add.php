<?php
//wtf($_POST,1);
if(isset($_POST['add'],$_POST['name'],$_POST['kategory'],$_POST['kropis'],$_POST['opis'],$_POST['cena'],$_POST['kol'])){
	// удаление лидирующих и замыкающих пробелов
	foreach($_POST as $k=>$v) {
		$_POST[$k] = trim($v);
	}
	q("
	  INSERT INTO `tovar` SET
	  `name`     = '".mysqli_real_escape_string($link,$_POST['name'])."',
	  `kategory` = '".mysqli_real_escape_string($link,$_POST['kategory'])."',
	  `kropis`   = '".mysqli_real_escape_string($link,$_POST['kropis'])."',
	  `opis`     = '".mysqli_real_escape_string($link,$_POST['opis'])."',
	  `cena`     = ".(int)$_POST['cena'].",
	  `kol`      = ".(int)$_POST['kol']."
	");
	$_SESSION['info']='Товар добавлен';
	header('Location: /tovar/main');
	exit();
//	echo "форма отправлена...";
//	exit();
}