<!-- должен быть обернут в бутсрапов <div class="container"> -->
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
                <img src="/skins/<?php echo Core::$SKIN; ?>/img/slide1.jpg" alt="slide 1">
                <!--<div class="carousel-caption">
                    <h3>Первый слайд</h3>
                    <p>Описание первого слайда</p>
                </div>-->
            </div>
            <div class="item">
                <img src="/skins/<?php echo Core::$SKIN; ?>/img/slide2.jpg" alt="slide 2">
                <!--<div class="carousel-caption">
                    <h3>Второй слайд</h3>
                    <p>Описание второго слайда</p>
                </div>-->
            </div>
            <div class="item">
                <img src="/skins/<?php echo Core::$SKIN; ?>/img/slide3.jpg" alt="slide 3">
                <!--<div class="carousel-caption">
                    <h3>Третий слайд</h3>
                    <p>Описание третьего слайда</p>
                </div>-->
            </div>
            <div class="item">
                <img src="/skins/<?php echo Core::$SKIN; ?>/img/slide4.jpg" alt="slide 4">
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