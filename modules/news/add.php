<?php 
if(isset($_POST['add'],$_POST['title'],$_POST['cat'],$_POST['description'],$_POST['text'])) {
	q("
	  INSERT INTO `news` SET
	  `title`       = '".es(trimAll($_POST['title']))."',
	  `cat`         = '".es(trimAll($_POST['cat']))."',
	  `description` = '".es(trimAll($_POST['description']))."',
	  `text`        = '".es(trimAll($_POST['text']))."',
	  `date`        = NOW()
	");
	$_SESSION['info'] = 'Запись была добавлена';
	header('Location: /news');
	exit();
}