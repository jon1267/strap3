<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title><?php echo hc(Core::$META['title']); ?></title>
<meta name="description" content="<?php echo hc(Core::$META['description']); ?>" >
<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>" >
<!--/skins/admin  <link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css"> это универсальнее но не работает -->
<?php if(count(Core::$CSS)) {echo implode("\n",Core::$CSS);} ?>
<?php if(count(Core::$JS))  {echo implode("\n",Core::$JS);} ?>
<!-- две строки кода пхп выше подключают файлы стиля, если в массиве Core::$CSS[] есть какие-л элементы. см ниже что дб в массиве...-->
<!-- код php Core::$CSS[] = '<link type="text/css" rel="stylesheet" href="/css/zzep_style.css">' файл стиля должен существовать! -->

<!-- Bootstrap - подключил в config.php стр 15 -->
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="/css/font-awesome.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
<script src="/js/jquery.min.js"></script>

<!-- 2. Подключить скрипт moment-with-locales.min.js для работы с датами -->
<script type="text/javascript" src="/js/moment-with-locales.min.js"></script>
<!-- 4. Подключить скрипт виджета "Bootstrap datetimepicker" -->
<script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
<!-- 6. Подключить CSS виджета "Bootstrap datetimepicker" -->
<link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" >


<!-- этот код показывает и удаляет текст через 3 сек -->
<script type="text/javascript">
	setTimeout(function(){ $('.box').fadeOut('fast')},3000);  //3000 = 3 секунд
</script>

</head>

<body>
  <header>
<!-- АДМИНКА LOGO Админка
наверное нада на сайте для всех сделать токо п.меню Админ, и по клику на нем, не вываливать меню
а переход сюда, а тут другое гл.меню с пунктами Новости, Заявки, Польз., На сайт...
 -->
<div class="container">
    <div class="row" id="header">
	<div class="col-xs-12">

		<a href="/admin"><img src="/skins/admin/img/logo.png" alt="Logo" class="img-rounded" id="logo"></a>
		<div class="container nav-border">
		<div class="navbar navbar-inverse">

		<?php if(isset($_SESSION['user']) && $_SESSION['user']['access'] ==5 ) { ?>
			<div class="container nav-width">
			<ul class="nav navbar-nav">
				<li><a href="/static/main">НА САЙТ</a></li>
				<li><a href="/admin/zajavka/main">ЗАЯВКИ</a></li>
				<li><a href="#">НОВОСТИ </a></li>
				<!--
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">УСЛУГИ <b
                            class="caret"></b> </a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Пункт 1</a></li>
                        <li><a href="#">Пункт 2</a></li>
                        <li><a href="#">Пункт 3</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Пункт 4</a></li>
                    </ul>
                </li>
                -->
				<li><a href="#">КОНТАКТЫ</a></li>
			</ul>
			</div>
			<?php } ?>

		  </div>
		</div>
		</div>
	</div>
	</div>
</div>
</header>

  <div id="content">
	<!-- $content формируется в index.php на стр.21 блок ob_start. Это возможные ошибки -->
    <?php echo $content; ?>
</div>

<!-- футер <div class="line"></div> -->
<div class="clear"></div>

<div class="row" id="footer">
<div class="col-xs-12">
	<span class="fzagol">QuickTrack Админ © <?php echo Core::$CREATED." - ".date("Y"); ?> |</span>
	<span class="ftext">&nbspВсе права принадлежат их закооным обладателям&nbsp&nbsp&nbsp&nbsp </span>
	<a class="soc-ic" href="/admin"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon1.png" alt=""></a>
	<a class="soc-ic" href="/admin"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon2.png" alt=""></a>
	<a class="soc-ic" href="/admin"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon3.png" alt=""></a>
	<a class="soc-ic" href="/admin"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon4.png" alt=""></a>
</div>
</div>
<!-- конец футера -->

<!-- Инициализация виджета "Bootstrap datetimepicker"               'dateFormat': "yy-mm-dd", -->
<script type="text/javascript">
  $(function () {
	  //Идентификатор элемента HTML (например: #datetimepicker1), для которого необходимо инициализировать виджет "Bootstrap datetimepicker"
	  $('#datetimepicker1').datetimepicker(
		  {pickTime: false, language: 'ru'}
	  );
  });
</script>

<!--для работы всплывающих посказок -->
<script>
  $(function(){
	  $("[rel='tooltip']").tooltip();
	  $("[rel='popover']").popover({trigger: "hover" });
  });
</script>
<script src="/js/bootstrap.js"></script>
</body>
</html>