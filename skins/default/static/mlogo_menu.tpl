<!--этот файл выводит ссыли вход-регистрация,логотип(сделать ссылку) навигацию -->
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
                                            <li><a href="#">История фирмы</a></li>
                                            <li><a href="#">Новости</a></li>
                                            <li><a href="#">Наши клиенты</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Расчет стоимости</a></li>
                                        </ul>

                                    </li>
                                    <li><a href="/static/main">ЗАЯВКА</a></li>
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
                                    <li><a href="/static/contacts">КОНТАКТЫ</a></li>
                                    <!-- index.php?module=static&page=contacts -->
                                    <?php if ( isset($_SESSION['user']) AND ($_SESSION['user']['access'] == 5) ) { ?>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">АДМИН <b
                                                    class="caret"></b></a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">Новости</a></li>
                                            <li><a href="#">Заявки</a></li>
                                            <li class="divider"></li>
                                            <li><a href="#">Пользователи</a></li>
                                        </ul>
                                    </li>
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