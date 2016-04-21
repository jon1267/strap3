<!-- заявка на перевозку груза для админа. Главная, вывод з. в строку, ссылки + - редактир  -->
<!-- временно делаю админский вариант в папке для всех, потом думать. Админу пойдет все а всем ...-->
<!--Этот вариант когда заявка в таблице. Заявка в строчку см main_.php Когда таблица бооольшая ??? незнаю-->
<div>
  <span class="zagol2">Все заявки </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="/admin/zajavka/add" title="Добавить новую заявку" class="btn btn-primary btn-sm"><i class="fa fa-files-o fa-lg"></i>&nbsp;&nbsp; Добавить заявку </a>
    <!-- Вы водит фразы ..была изменена, ...была удалена -->
    <?php if(isset($info)) { ?>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="box simpletext"><?php echo $info; ?></span>
    <?php } ?>
    <br><br>
  <form action="" method="post">
  <?php $tbody=''; while($row = $zajavki->fetch_assoc()) { ?>
	  <div>
          <?php
          /* эти три ссылки были выше откр. тега ПХП
          <input type="checkbox" name="ids[]" title="Пометить на удаление" value="<?php echo $row['id']; ?>">&nbsp&nbsp
          <a href="/zajavka/edit/?id=<?php echo $row['id']; ?>" title="Редактировать"> <i class="fa fa-pencil fa-lg"></i></a>&nbsp
          <a href="/zajavka/main/?action=delete&id=<?php echo $row['id']; ?>" title="Удалить одну"> <i class="fa fa-trash-o fa-lg"></i></a>&nbsp
          */
          // добавлять поля таблицы тут...
          //$zastr =  mb_substr($row['otkuda'],0,25)." | ".
          //    mb_substr($row['kuda'],0,25)." | ".
          //    mb_substr($row['gruz'],0,25)." | ".
          //    mb_substr(datru($row['datap']),0,25)." | ";
          //echo $zastr;
          // формирую таблицу...$tbody содержит тело табл. без тегов <tbody></tbody>
          $tbody .= '<tr>'.'<td>'.'<input type="checkbox" name="ids[]" title="Пометить на удаление" value="'.$row['id'].'">&nbsp;&nbsp;'.
                           '<a href="/admin/zajavka/edit/?id='.$row['id'].'"title="Редактировать"><i class="fa fa-pencil fa-lg"></i></a>&nbsp;&nbsp;'.
                           '<a href="/admin/zajavka/main/?action=delete&id='.$row['id'].'" title="Удалить одну"><i class="fa fa-trash-o fa-lg"></i></a>&nbsp;'.'</td>'.
                           '<td>'.mb_substr($row['otkuda'],0,25).'</td>'.
                           '<td>'.mb_substr($row['kuda'],0,25).'</td>'.
                           '<td>'.mb_substr($row['gruz'],0,20).'</td>'.
                           '<td>'.mb_substr(datru($row['datap']),0,12).'</td>'.
                           '<td>'.mb_substr($row['fio'],0,15).'</td>'.
                           '<td>'.mb_substr($row['tel'],0,20).'</td>'.
                    '</tr>';
          ?>
      </div>
  <!-- странно, $row->close() дает fatal error. А так ошибки нет.В общем выборку очищаю...-->
  <?php }; $zajavki->close(); ?>

      <table class="table table-bordered table-hover table-condensed ">
          <thead>
          <tr>
              <th><i class="fa fa-wrench"></i>&nbsp;&nbsp;Упр.</th>
              <th><i class="fa fa-hand-o-left"></i>&nbsp;&nbsp;Откуда</th>
              <th><i class="fa fa-hand-o-right"></i>&nbsp;&nbsp;Куда</th>
              <th><i class="fa fa-suitcase"></i>&nbsp;&nbsp;Груз</th>
              <th><i class="fa fa-calendar"></i>&nbsp;&nbsp;Дата</th>
              <th><i class="fa fa-user"></i>&nbsp;&nbsp;Контакт</th>
              <th><i class="fa fa-phone"></i>&nbsp;&nbsp;Телефон</th>
          </tr>
          </thead>
          <tbody>
              <?php echo $tbody; ?>
           </tbody>
      </table>
  <!-- <input type="submit" name="delete" value="Удалить отмеченное"> -->
  <button class="btn btn-primary" type="submit" title="Удалить отмеченные заявки" name="delete"><i class="fa fa-trash-o fa-lg"></i>&nbsp;&nbsp;Удалить отмеченное</button><br><br>
  </form>
  <!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
  <div class="clear"></div>
  <div class="line"></div>

</div>
