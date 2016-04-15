<!-- Редактир 1-ой заявки на перевозку полный админский вариант htmlspecialchars -->
<!-- <div style="padding-top:30px;padding-bottom:30px;margin-left:20px;"> -->

<div class="row" >
    <div class="control-group">
        <div class="col-sm-10">
            <span class="zagol2"><p>Редактируем заявку на перевозку груза.</p></span><br><br>
        </div>

        <form action="" method="post">

            <!--<div class="form-group">  -->
            <div class="col-sm-6">
                <div>
                    <p><label class="boldtext"><i class="fa fa-certificate color-star"></i> Откуда :
                    <span class="color-errors"><?php echo @$errors['otkuda']; ?></span>
                    <input  type="text" class="form-control" size="50" name="otkuda" value="<?php echo hc($row['otkuda']); ?>"></label>
                    </p>
                </div>

                <div >
                    <p><label class="boldtext">Транспорт:&nbsp;
                        <span rel="popover" data-placement="right" data-content="Ваши пожелания к транспорту.
                        Возможно платформа с боковой загрузкой. Тент, будка, крепление груза и тп. "><i class="fa fa-question-circle " ></i></span>
                        <input type="text" class="form-control" size="50" name="transp" value="<?php echo hc($row['transp']); ?>"></label></p>
                </div>
                <div>
                    <p><label class="boldtext"><i class="fa fa-certificate color-star"></i> Груз:&nbsp;
                    <span rel="tooltip" data-placement="right" title="Что будем перевозить."><i class="fa fa-question-circle " ></i></span>
                    <span class="color-errors"><?php echo @$errors['gruz'];?></span>
                    <input type="text" class="form-control" size="50" name="gruz" value="<?php echo hc($row['gruz']); ?>"></label></p>
                 </div>
                <div>
                    <p><label class="boldtext"><i class="fa fa-certificate color-star"></i> Контактное лицо:&nbsp;
                    <span rel="tooltip" data-placement="right" title="Фамилия Имя"><i class="fa fa-question-circle " ></i></span>
                    <span class="color-errors"><?php echo @$errors['fio'];?></span>
                    <input type="text" class="form-control" size="50" name="fio" value="<?php echo hc($row['fio']); ?>"></label></p>
                </div>

            </div>

            <div class="col-sm-6">
                <div >
                    <p><label class="boldtext"><i class="fa fa-certificate color-star"></i> Куда:
                    <span class="color-errors"><?php echo @$errors['kuda']; ?></span>
                    <input type="text" class="form-control" size="50" name="kuda" value="<?php echo hc($row['kuda']); ?>"></label></p>
                </div>
                <p><div>
                    <label class="boldtext">Дата перевозки:
                    <div class="input-group date" id="datetimepicker1" >
                        <input type="text" class="form-control" name="datap" value="<?php ;echo hc($row['datap']); ?>">
                        <span class="input-group-addon">
                        <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                        </div>
                    </label>
                </div></p>
                <div>
                    <p>
                    <label class="boldtext">Вес:&nbsp;<span rel="tooltip" data-placement="right" title="Вес груза кг."><i class="fa fa-question-circle " ></i></span>
                    <span class="color-errors"><?php echo @$errors['ves'];?></span>
                    <input type="text" class="form-control" size="20" name="ves" value="<?php echo hc($row['ves']); ?>"></label>&nbsp;&nbsp;
                    <label class="boldtext">Объем:&nbsp;<span rel="tooltip" data-placement="right" title="Объем груза м3."><i class="fa fa-question-circle " ></i></span>
                    <span class="color-errors"><?php echo @$errors['vol'];?></span>
                    <input type="text" class="form-control" size="20" name="vol" value="<?php echo hc($row['vol']); ?>"></label>
                    </p>
                </div>
                <div>
                    <p>
                    <label class="boldtext"><i class="fa fa-certificate color-star"></i> Телефон: <span rel="tooltip" data-placement="right" title="Контактный телефон"><i class="fa fa-question-circle " ></i></span>
                    <span class="color-errors"><?php echo @$errors['tel'];?></span>
                    <input type="text" class="form-control" size="20" name="tel" value="<?php echo hc($row['tel']); ?>"></label>&nbsp;&nbsp;
                    <label class="boldtext">E-mail:&nbsp;<span rel="tooltip" data-placement="right" title="Для обмена документами."><i class="fa fa-question-circle " ></i></span>
                    <span class="color-errors"><?php echo @$errors['email'];?></span>
                    <input type="text" class="form-control" size="20" name="email" value="<?php echo hc($row['email']); ?>"></label>
                    </p>
                </div>

            </div>
            <div class="col-sm-12">
                <p><label class="boldtext">Комментарии:
                <textarea class="form-control" rows="2" cols="127" name="notes" ><?php echo hc($row['notes']); ?></textarea></label></p>
                <p><span><i class="fa fa-certificate color-star"></i> - обязательно для заполнения</span><br>
                <span><i class="fa fa-question-circle color-quest" ></i> - дополнительная информация</span></p>

                <!-- <input class="btn btn-primary" type="submit" name="ok" value=" Сохранить заявку " >-->
                <br><button class="btn btn-primary" type="submit" name="ok"><i class="fa fa-save"></i>&nbsp;&nbsp;Сохранить заявку</button><br><br>
            </div>
            <!--</div class="form-group" > -->
        </form>
    </div>
    <!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
    <div class="clear"></div>
    <div class="line"></div>

</div>

