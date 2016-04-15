<!-- товары для админа -->
<div style="padding-top:30px;padding-bottom:30px;margin-left:20px;">
  <?php if(isset($info)) { ?>
    <h4><?php echo $info; ?></h4>
  <?php } ?>
  
  <b><i>Список товаров</i></b> <a href="/admin/tovar/add">Добавить товар</a> <br>
  <br>
  
  <form action="" method="post">
  <?php while($row = mysqli_fetch_assoc($tovars)) { ?>
	<div>
	  <div>
	  <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>">&nbsp&nbsp
	  <a href="/admin/tovar/edit/?id=<?php echo $row['id']; ?>">Редактир</a>&nbsp
	  <a href="/admin/tovar/main/?action=delete&id=<?php echo $row['id']; ?>">Удалить</a>&nbsp
	  <b><?php echo $row['name']."  ".$row['kropis']."  ".$row['kategory'] ?></b></div>
	</div>
  <hr>
  <?php } ?>
  <input type="submit" name="delete" value="Удалить отмеченное">
  </form>

  </div>