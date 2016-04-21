<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<title><?php echo hc(Core::$META['title']); ?></title>
<meta name="description" content="<?php echo hc(Core::$META['description']); ?>" >
<meta name="keywords" content="<?php echo hc(Core::$META['keywords']); ?>" >
<link href="/skins/<?php echo Core::$SKIN; ?>/css/style.css" rel="stylesheet" type="text/css">
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
<div class="container">
    <!-- выводит ссыли вход-регистрация,логотип навигацию -->
    <!-- должен быть обернут в бутсрапов <div class="container"> -->
    <div class="row" id="header">
        <!-- ссылка вход регистрация -->
        <div class="btn-rgoup ent-reg">
            <!-- -->
            <?php if( isset($_SESSION['error']) AND ($_SESSION['error'] == 'NO' ) ) {  ?>
                <span class="box simpletext">Нет такого логина или пароля. </span>
            <?php  } unset($_SESSION['error']); ?>
            <?php if(isset($_SESSION['user']) AND ($_SESSION['user']['active'] == 1)) { ?>
                <span class="simpletext"> <?php echo $_SESSION['user']['login']; ?>&nbsp;&nbsp;</span>
                <a href="/cab/exit" id="ent-reg-link" class="btn  btn-xs" > <i class="fa fa-sign-out"></i> Выход  </a>
            <?php } else { ?>
                <a href="#" id="ent-reg-link" class="btn  btn-xs" data-toggle="modal" data-target="#modal-1"> <i class="fa fa-sign-in"></i> Вход&nbsp;&nbsp;|&nbsp;&nbsp;Регистрация </a>
            <?php } ?>
        </div>
        <!-- конец ссылка вход регистрация -->
        <div class="col-xs-12">
            <a href="/"><img src="/skins/<?php echo Core::$SKIN; ?>/img/logo.png" alt="Logo" id="logo"></a>
            <!-- навигация те гл меню -->
            <div class="container nav-border">
                <div class="row">
                    <div class="navbar navbar-inverse">

                        <div class="container nav-width">
                            <div class="container nav-width">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                                            data-target="#responsive-menu">
                                        <span class="sr-only">Открыть навигацию</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <!-- <a  class="navbar-brand" href="#">Логотип</a> -->
                                </div>
                                <div class="collapse navbar-collapse" id="responsive-menu">
                                    <ul class="nav navbar-nav">
                                        <li><a href="/static/main">ГЛАВНАЯ</a></li>
                                        <!-- index.php?module=static&page=main -->
                                        <li class="dropdown">
                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">О НАС <b
                                                    class="caret"></b></a>
                                            <ul class="dropdown-menu">
                                                <li><a href="/static/about">История фирмы</a></li>
                                                <li><a href="/news/main">Новости</a></li>
                                                <li><a href="/static/servises">Наши клиенты</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#">Расчет стоимости</a></li>
                                            </ul>

                                        </li>
                                        <li><a href="/zajavka/add">ЗАЯВКА</a></li>
                                        <!--/main
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
                                        <li><a href="/static/contacts">КОНТАКТЫ</a></li>
                                        <!-- index.php?module=static&page=contacts -->
                                        <?php if ( isset($_SESSION['user']) AND ($_SESSION['user']['access'] == 5) ) { ?>
                                            <li><a href="/admin/static/main">АДМИН</a></li>
                                            <!--
                                            <li class="dropdown">
                                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">АДМИН <b
                                                        class="caret"></b></a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="#">Новости</a></li>
                                                    <li><a href="/admin/zajavka/main">Заявки</a></li>
                                                    <li class="divider"></li>
                                                    <li><a href="#">Пользователи</a></li>
                                               </ul>
                                            </li>
                                            -->
                                        <?php } ?>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- конц навигация те гл меню -->
        </div>
    </div>

    <div id="content">
        <!-- $content формируется в index.php на стр.21 блок ob_start. Это возможные ошибки -->
        <?php echo $content; ?>
    </div>

    <!-- футер  -->
    <!-- должен быть обернут в бутсрапов <div class="container"> -->
    <div class="row" id="footer">
        <div class="col-md-12">
            <div >
                <span class="fzagol">QuickTruck © <?php echo Core::$CREATED.' - '.date('Y'); ?> |</span>
                <span class="ftext">&nbspВсе права принадлежат их закооным обладателям&nbsp&nbsp&nbsp&nbsp </span>
                <a class="soc-ic" href="#"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon1.png" alt="1"></a>
                <a class="soc-ic" href="#"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon2.png" alt="2"></a>
                <a class="soc-ic" href="#"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon3.png" alt="3"></a>
                <a class="soc-ic" href="#"><img src="/skins/<?php echo Core::$SKIN; ?>/img/soc-icon4.png" alt="4"></a>
            </div>
        </div>
    </div>
    <!-- конец футера -->
</div>

<!-- модальное окно вход регистрация modal-sm(md) большее окно -->
<div class="modal fade" id="modal-1">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button class="close" type="button" data-dismiss="modal">
                    <i class="fa fa-close"></i>
                </button>
                <h5 class="modal-title">Вход / Регистрация.</h5>
            </div>
            <div class="modal-body">
                <div class="tabs">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab-1">
                            <h5>Введите логин и пароль</h5>
                            <form action="/modules/cab/auth.php" method="post">
                                <div class="form-group">
                                    <p><input type="text" class="form-control" placeholder="Логин" name="login"></p>
                                    <p><input type="password" class="form-control" placeholder="Пароль" name="pass"></p>
                                </div>
                                <p class="text-center">
                                    <!--<button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-sign-in"></i> Вход </button>-->
                                    <button class="btn btn-sm btn-mymore" type="submit"><i class="fa fa-sign-in"></i> Вход </button>
                                </p>
                                <p class="nav nav-tabs text-center">
                                    <a href="#tab-2" data-toggle="tab" class="my-er-modal"> Регистрация </a>
                                </p>
                            </form>
                        </div>
                        <div class="tab-pane fade " id="tab-2">
                            <h5>Введите логин, пароль и e-mail</h5>
                            <form action="" method="post">
                                <div class="form-group ">
                                    <p><input type="text" class="form-control" placeholder="Логин" name="login"></p>
                                    <p><input type="password" class="form-control" placeholder="Пароль" name="pass"></p>
                                    <p><input type="text" class="form-control" placeholder="E-mail" value=""></p>
                                </div>
                                <p class="text-center">
                                    <!--<button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-user-plus"></i> Регистрация </button>-->
                                    <button class="btn btn-sm btn-mymore" type="submit"><i class="fa fa-user-plus"></i> Регистрация </button>
                                </p>
                                <p class="nav nav-tabs text-center">
                                    <a href="#tab-1" data-toggle="tab" class="my-er-modal"> Вход </a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- конец модальное окно вход регистрация -->

<!-- Этот код запускает карусель. может надоедать...-->
<!--<script type="text/javascript">
//  $(document).ready(function(){
//      // Инициализирует карусель
//      $('#carousel').carousel({interval: 7000})
//      $('#carousel').carousel('cycle')
//  });
</script> -->

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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<!--<script src="/skins/<?php echo Core::$SKIN; ?>/js/jquery.min.js"></script>-->

<!-- Include all compiled plugins (below), or include individual files as needed -->
<!-- <script src="/skins/<?php echo Core::$SKIN; ?>/js/bootstrap.js"></script> -->
<script src="/js/bootstrap.js"></script>
</body>

</html>