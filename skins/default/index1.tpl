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

<!-- Bootstrap - подключил в config.php стр 15
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/font-awesome.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
-->
</head>

<body>
<div class="container">
    <div class="row" id="header">
        <!-- ссылка вход регистрация -->
        <div class="btn-rgoup ent-reg">
            <a href="#" id="ent-reg-link" class="btn  btn-xs" data-toggle="modal" data-target="#modal-1"> <i class="fa fa-sign-in"></i> Вход&nbsp;&nbsp;|&nbsp;&nbsp;Регистрация </a>
            <!-- если делаеть две отдельные ссылки на вход и регистрацию то убрать комментарии тут...
            <a href="#" class="btn  btn-xs" data-toggle="modal" data-target="#modal-1"><i class="fa fa-user-plus"></i> Регистрация</a>
            -->
        </div>
        <!-- конец ссылка вход регистрация -->
        <div class="col-xs-12">
            <a href="./"><img src="img/logo.png" alt="Logo" id="logo"></a>
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
                                        <li><a href="#">ЗАЯВКА</a></li>
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
                                        <!--
                                        <li><a href="#">АДМИН</a></li>
                                        -->
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

    <!-- слайдер  -->
    <div class="center">
        <div class="carousel slide" id="carousel" >
            <!--индикаторы слайдов-->
            <ol class="carousel-indicators">
                <li class="active" data-target="#carousel" data-slide-to="0"></li>
                <li data-target="#carousel" data-slide-to="1"></li>
                <li data-target="#carousel" data-slide-to="2"></li>
                <li data-target="#carousel" data-slide-to="3"></li>
            </ol>
            <!--слайды-->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="img/slide1.jpg" alt="slide 1">
                    <!--<div class="carousel-caption">
                        <h3>Первый слайд</h3>
                        <p>Описание первого слайда</p>
                    </div>-->
                </div>
                <div class="item">
                    <img src="img/slide2.jpg" alt="slide 2">
                    <!--<div class="carousel-caption">
                        <h3>Второй слайд</h3>
                        <p>Описание второго слайда</p>
                    </div>-->
                </div>
                <div class="item">
                    <img src="img/slide3.jpg" alt="slide 3">
                    <!--<div class="carousel-caption">
                        <h3>Третий слайд</h3>
                        <p>Описание третьего слайда</p>
                    </div>-->
                </div>
                <div class="item">
                    <img src="img/slide4.jpg" alt="slide 4">
                    <!--<div class="carousel-caption">
                        <h3>Четвертый слайд</h3>
                        <p>Описание четвертого слайда</p>
                    </div>-->
                </div>
            </div>
            <!--стрелки переключения слайдов -->
            <a href="#carousel" class="left carousel-control" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <a href="#carousel" class="right carousel-control" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>

        </div>
    </div>
    <!-- конец слайдер -->
    <!-- три колонки на гл стр. -->
    <div class="row" id="content">
        <div class="col_13">
            <div class="img123">
                <img src="img/home-img1.png" alt="img1">
            </div>
            <span class="zagol1">10 ЛЕТ МЫ ЗАНИМАЕМСЯ </span>
            <span class="zagol2">&nbsp;&nbsp;ПЕРЕВОЗКОЙ ГРУЗОВ ! </span>
            <span class="simpletext"><br><br><br><br>Наша компания основана в 2006 году.
                Мы являемся членами Международной Ассоциации Перевозчиков.
                Нами получен полный пакет разрешительных документов и лицензий,
                необходимых для перевозки грузов в Европпу.
            </span>
            <a href="#" class="btn btn-sm btn-mymore">Подробнее&nbsp;&nbsp;<i class="fa fa-caret-right"></i></a>
        </div>
        <div class="col_2">
            <div class="img123">
                <img src="img/home-img2.png" alt="img2">
            </div>
            <span class="zagol1">СПЕЦИАЛИЗАЦИЯ,  </span>
            <span class="zagol2">ЛОГИСТИКА, ДОСТАВКА.</span>
            <span class="simpletext"><br><br><br><br>Основное направление нашей
                деятельности - автоперевозка тяжеловесных и негабаритных грузов из
                Украины в Европпу, а также по Украине. Как мы работаем ? Очень просто.
                Заявка <i class="fa fa-long-arrow-right"></i> Расчет <i class="fa fa-long-arrow-right"></i>
                Оплата <i class="fa fa-long-arrow-right"></i> Перевозка.
            </span>
            <a href="#" class="btn btn-sm btn-mymore">Подробнее&nbsp;&nbsp;<i class="fa fa-caret-right"></i></a>
        </div>
        <div class="col_13">
            <div class="img123">
                <img src="img/home-img3.png" alt="img3">
                <!-- <i class="fa fa-cog fa-4x"></i> -->
            </div>
            <span class="zagol1">НАДЕЖНАЯ ТЕХНИКА </span>
            <span class="zagol2">ОПЫТНЫЙ ПЕРСОНАЛ </span>
            <span class="simpletext"><br><br><br><br>В настоящее время в нашем распоряжении
                имеется 5 тягачей Volvo 20т. 86 кубов. По мере возможностей,
                 мы будем увеличивать наш автопарк. Все наши водители имеют
                большой стаж и опыт международных перевозок.
            </span>
            <a href="#" class="btn btn-sm btn-mymore">Подробнее&nbsp;&nbsp;<i class="fa fa-caret-right"></i></a>
        </div>
        <!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
        <div class="clear"></div>
        <div class="line"></div>
        <br>
        <!-- конец три колонки на гл стр. -- -->

        <!--  еще три колонки с текстом...кружками и картой -->
        <div class="col_13">
            <span class="zagol3">всегда рады клиентам</span>
				<span class="boldtext"><br><br>Быстрая и рациональная перевозка<br>
											   грузов - одна из самых ожидаемых<br>
											   услуг на современном рынке.<br></span>
				<span class="simpletext"><br>Опыт показывает, что
										доставка грузов своими силами
										для многих предприятий становится
										сложным трудозатратным и дорогим
										процессом с не всегда понятными перспективами.
				</span>
				<span class="simpletext"><br><br>Поэтому мы предлагаем сотрудничество
											 с нашим предприятием. Мы досконально знаем
											 све дело, надежны и добросовестны.
				</span>
        </div>
        <div class="col_2">
            <span class="zagol3">наш сервис</span><br><br>

            <div class="clear"></div>
            <div class="img456">
                <img src="img/home-img6.png" alt="">
            </div>
            <span class="zagol4">Мы не беремся за рискованные</span>
            <span class="zagol4">или неосуществимые проекты.</span>

            <div class="clear"></div>
            <div class="img456">
                <img src="img/home-img5.png" alt="">
            </div>
            <span class="zagol4">Но если беремся, мы делаем то</span>
            <span class="zagol4">что обещаем нашим партнерам.</span>
            <!-- Но если уж беремся, мы делаем то, что обещаем. -->
            <div class="clear"></div>
            <div class="img456">
                <img src="img/home-img4.png" alt="">
            </div>
            <span class="zagol4">Мы делаем все, чтобы Ваш груз</span>
            <span class="zagol4">всегда доставлялся вовремя.</span>

            <div class="clear"></div>
            <div class="img456">
                <img src="img/home-img7.png" alt="">
            </div>
            <span class="zagol4">Мы заботливо относимся к нашим</span>
            <span class="zagol4">клиентам, и к своей репутации.</span>

        </div>
        <div class="col_13">
            <span class="zagol3">география поставок</span>
				<span class="simpletext"><br><br>География поставок широка, но
									основное наше напрвление это грузоперевозки
									из Украины в Европпу и обратно.<br><br></span>
            <div class="clear"></div>
            <img src="img/map.png" alt="">
        </div>
        <!--  конец три колонки с текстом...кружками и картой -->

        <!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
        <div class="clear"></div>
        <div class="line"></div>
    </div>

    <!-- футер  -->
    <div class="row" id="footer">
        <div class="col-md-12">
            <div >
                <span class="fzagol">QuickTruck © <?php echo Core::$CREATED.' - '.date('Y'); ?> |</span>
                <span class="ftext">&nbspВсе права принадлежат их закооным обладателям&nbsp&nbsp&nbsp&nbsp </span>
                <a class="soc-ic" href="#"><img src="img/soc-icon1.png" alt="1"></a>
                <a class="soc-ic" href="#"><img src="img/soc-icon2.png" alt="2"></a>
                <a class="soc-ic" href="#"><img src="img/soc-icon3.png" alt="3"></a>
                <a class="soc-ic" href="#"><img src="img/soc-icon4.png" alt="4"></a>
            </div>
        </div>
    </div>
    <!-- конец футера -->
</div>

<!-- модальное окно вход регистрация -->
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
                            <form action="" method="post">
                                <div class="form-group">
                                    <p><input type="text" class="form-control" placeholder="Логин" value=""></p>
                                    <p><input type="password" class="form-control" placeholder="Пароль" value=""></p>
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
                        <div class="tab-pane fade" id="tab-2">
                            <h5>Введите логин, пароль и e-mail</h5>
                            <form action="" method="post">
                                <div class="form-group">
                                    <p><input type="text" class="form-control" placeholder="Логин" value=""></p>
                                    <p><input type="password" class="form-control" placeholder="Пароль" value=""></p>
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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<script src="js/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.js"></script>
</body>

</html>