<!-- заявка на перевозку груза для всех. Начало (гл.меню) добавление заявки, вывода заявок  нет -->
<!-- сообщение, что заявка добавлена, кнопка добавить еще... -->
<div>
    &nbsp;&nbsp;&nbsp;<span class="zagol2">Заявка на перевозку груза </span>&nbsp;&nbsp;&nbsp;
    <a href="/zajavka/add" title="Добавить новую заявку" class="btn btn-primary btn-sm"><i class="fa fa-files-o fa-lg"></i>&nbsp;&nbsp; Добавить еще заявку </a>
     <!--Вы водит фразы ..была изменена, ...была удалена -->
    <?php if(isset($info)) { ?>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="box simpletext"><?php echo $info; ?></span>
        <br><br>
        <div class="alert alert-info">
            <i class="fa fa-commenting "></i>
            <button type="button" class="close" data-dismiss="alert"><i class="fa fa-times-circle"></i></button>
            <br>
            <strong>Ваша заявка была сохраненна.</strong> Если был указан корректный номер телефона, и мы сможем с Вами связаться,
            мы максимально быстро свяжемся, для уточнения деталей перевозки.
            <br>
        </div>
    <?php } ?>
  <!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
  <div class="clear"></div>
  <div class="line"></div>

</div>
