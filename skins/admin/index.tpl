<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title><?php echo hc(Core::$META['title']); ?></title>
<meta name="description" content="<?php echo hc(Core::$META['description']); ?>" >
<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>" >
<!--  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css"> это универсальнее но не работает -->
<link href="/skins/admin/css/style.css" rel="stylesheet" type="text/css">
<?php if(count(Core::$CSS)) {echo implode("\n",Core::$CSS);} ?>
<?php if(count(Core::$JS))  {echo implode("\n",Core::$JS);} ?>
<!-- две строки кода пхп выше подключают файлы стиля, если в массиве Core::$CSS[] есть какие-л элементы. см ниже что дб в массиве...-->
<!-- код php Core::$CSS[] = '<link type="text/css" rel="stylesheet" href="/css/zzep_style.css">' файл стиля должен существовать! -->
</head>

<body>
  <header>
    <!-- АДМИНКА LOGO Админка -->
    <div class="blocks">
		<a href="/admin/main"><img src="/skins/admin/img/logo.png" alt=""></a><br><br>
		<?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] ==5 ) { ?>
		<nav>
		  <a href="/admin/">Админка</a>
		  <a href="/admin/news/main">Новости</a>
		  <a href="/admin/tovar/main">Товары</a>
		  <a href="/static/main" title="Перейти на сайт для всех">На сайт</a>
		  <?php if(isset($_SESSION['user']['login'])) ?>
			 <a href="/admin/static/exit">Выход</a>
		  <?php { echo @$_SESSION['user']['login']; } ?>
		  <!--
		  <a href="/cab/registration">Регистрация</a>
		  <a href="/cab/auth">Авторизация</a>

		  <a href="/errros/404">404</a>
		  -->
		</nav>
		<?php } ?>

	 </div>
	</header>
  <div id="content">
	<!-- $content формируется в index.php на стр.21 блок ob_start. Это возможные ошибки -->
    <?php echo $content; ?>
  </div>

<!-- футер  -->
<!-- <footer>Копирайты &copy; <?php echo Core::$CREATED." - ".date("Y"); ?></footer> -->
<div id="clear"></div>
<div class="line"></div>
<div id="clear"></div>
<div class="footer">
	<span class="fzagol">НашаАдминка © <?php echo Core::$CREATED." - ".date("Y"); ?> |</span>
	<span class="ftext">&nbspВсе права принадлежат их закооным обладателям&nbsp&nbsp&nbsp&nbsp </span>
	<a class="soc-ic" href="/admin"><img src="/skins/admin/img/soc-icon1.png" alt=""></a>
	<a class="soc-ic" href="/admin"><img src="/skins/admin/img/soc-icon2.png" alt=""></a>
	<a class="soc-ic" href="/admin"><img src="/skins/admin/img/soc-icon3.png" alt=""></a>
	<a class="soc-ic" href="/admin"><img src="/skins/admin/img/soc-icon4.png" alt=""></a>
</div>
<!-- конец футера -->
  
  </body>

</html>