<!-- блок новостей для Всех токо вывод всех  -->
<div style="padding-top:30px;padding-bottom:30px;margin-left:20px;">
<?php if(isset($info)) { ?>
  <h3><?php echo $info; ?></h3>
<?php } ?>
<b>Все новости:</b>&nbsp&nbsp <!--  <a href="/news/add">Добавить новость</a> --> <br><br> 
<form action="" method="post">
<?php while($row = mysqli_fetch_assoc($news)) { ?>
<!-- style="padding-top:30px;padding-bottom:30px;margin-left:20px;" -->
	<div>
	  <div>

  	    <!--  <input type="checkbox" name="ids[]" value="<?php echo $row['id']; ?>"> &nbsp  -->
		<a href="/news/edit?id=<?php echo $row['id']; ?>">Редактир</a> &nbsp
	    <!--  <a href="/news?action=delete&id=<?php echo $row['id']; ?>">Удалить</a> &nbsp  -->
		
	    <?php echo $row['title']; ?><span style="color:#777777;font-size:10px;"><?php echo ' '.$row['date']; ?></span>
	  </div>
	</div>
	<hr>
<?php } ?>
<!--  <input type="submit" name="delete" value="Удалить отмеченное"> -->
</form>
</div>