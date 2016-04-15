<?php
// Файлменеджер
// function sd($scaneddir='./') 

// эту строку мона убить. НО! Заголовок стр. реально меняется !!! 
// При переходе на др. страницу этот заг. меняется на 
// тот, что был до того, ну т.е работает как нада...
Core::$META['title'] = 'Файлменеджер';

if(isset($_GET['link'])) {
    // а вот это работает !!! но при первом входе имеет link = / и в винде
	// идет в корень C:\ и там бродит по диску С...этого давать юзеру низзя
	//$updir = dirname($_GET['link']).'/'; 
	if($_GET['link'] == '/') {
		$_GET['link'] = './'; // вот это и есть борьба с виндовой C:\ и пошел по диску С:
	}
	sd($_GET['link']);
} else {
	sd('./');
}

// директорию обязательно завершать обратной косой/
// тк иначе ф-ция is_dir('./img') неточно определяет файл или каталог.
// она сцуко возвращает все содержимой каталога как файлы...
// а вот так - вроде срабатывает правильно: is_dir($dir.$v) !!!
// где $dir надо завершить'/' чтоб было: sd('./img/');

function sd($scaneddir) {
	$dir   = $scaneddir;
	$dirs  = array();
	$files = array();
	$content = scandir($dir);
	foreach($content as $v) {
		// пропускаем каталоги . и ..
		if($v == '.' || $v == '..') continue;
		// заполняем $dirs[]-папки $files[]-файлы
		if( is_dir($dir.$v) ) {
			//$dirs[] = $v; // вариант 0
			//$dirs[] = '<a href='.$v.'>'.$v.'</a>'; //вариант 1
			$dirs[] = '<a href='.'/static/program1/?link='.$dir.$v.'/'.'>'.$v.'</a>';
		} else {
			$files[] = $v;
		} 
	}
?>
	<div class="auth">
	<h3>ФАЙЛМЕНЕДЖЕР</h3>
	<!-- вывод папок мб убрать бо dirname($_GET['link']).'/'; см коммент в строке 9  -->
	<!--  до ЧПУ ссылки были img src="/img/sdir_home.png" и a href="/index.php?module=static&page=program1"  -->
	<!-- src="/skins/default/img/sdir_home.png" -->
	  <img src="/skins/<?php echo Core::$SKIN; ?>/img/sdir_home.png" alt=""><a href="/static/program1">. root</a><br>
	  <img src="/skins/<?php echo Core::$SKIN; ?>/img/sdir_up.png" alt=""><a href="/static/program1/?link=<?php echo @dirname($_GET['link']).'/'; ?>">..up</a><br><br>
	  <span class="simpletext">Папки:<br>
	  <?php foreach ($dirs as $v) { ?>  
		<img src="/skins/<?php echo Core::$SKIN; ?>/img/sdir.png" alt="">
		<?php echo $v.'<br>'; ?>
	  <?php } ?>
	  </span>  
	  <!-- вывод файлов -->
	  <br>
	  <span class="simpletext">Файлы:<br>
	  <?php foreach ($files as $v) { ?>  
		<img src="/skins/<?php echo Core::$SKIN; ?>/img/sfile.png" alt="">
		<?php echo $v.'<br>'; ?>
	  <?php } ?>
	  </span>
	</div>
<?php
}
