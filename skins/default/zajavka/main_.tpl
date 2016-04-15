<!-- заявка на перевозку груза для админа. Главная, вывод з. в строку, ссылки + - редактир  -->
<!-- временно делаю админский вариант в папке для всех, потом думать. Админу пойдет все а всем ...-->
<!-- <div style="padding-top:30px;padding-bottom:30px;margin-left:20px;"> -->
<div>

  <!-- <b>Все заявки</b>&nbsp;&nbsp;&nbsp; -->
  <span class="zagol2">Все заявки </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/zajavka/add" title="Добавить новую заявку" class="btn btn-primary btn-sm"><i class="fa fa-files-o fa-lg"></i>&nbsp;&nbsp; Добавить заявку </a>
    <!-- Вы водит фразы ..была изменена, ...была удалена -->
    <?php if(isset($info)) { ?>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="box simpletext"><?php echo $info; ?></span>
    <?php } ?>

  <br><br>
  
  <form action="" method="post">
  <?php while($row = mysqli_fetch_assoc($zajavki)) { ?>
	<div>
	  <div>
	  <input type="checkbox" name="ids[]" title="Пометить на удаление" value="<?php echo $row['id']; ?>">&nbsp&nbsp
	  <a href="/zajavka/edit/?id=<?php echo $row['id']; ?>" title="Редактировать"> <i class="fa fa-pencil fa-lg"></i></a>&nbsp
	  <a href="/zajavka/main/?action=delete&id=<?php echo $row['id']; ?>" title="Удалить одну"> <i class="fa fa-trash-o fa-lg"></i></a>&nbsp
	  <?php
      // добавлять поля таблицы тут...
          $zastr =  mb_substr($row['otkuda'],0,25)." | ".
                    mb_substr($row['kuda'],0,25)." | ".
                    mb_substr($row['gruz'],0,25)." | ".
                    mb_substr(datru($row['datap']),0,25)." | ";
          echo $zastr;
      ?>
      </div>
	</div>
    <br><!-- <hr> жрет много места, если много заявок то и этот br убрать -->
  <?php } ?>
  <br>
  <!-- <input type="submit" name="delete" value="Удалить отмеченное"> -->
  <button class="btn btn-primary" type="submit" title="Удалить отмеченные заявки" name="delete"><i class="fa fa-trash-o fa-lg"></i>&nbsp;&nbsp;Удалить отмеченное</button><br><br>
  </form>
  <!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
  <div class="clear"></div>
  <div class="line"></div>

</div>