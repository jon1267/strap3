<div style="padding-top:30px;padding-bottom:30px;margin-left:20px;">
  <form action="" method="post">
    <div>
	  Заголовок новости:&nbsp <input type="text" size="30" name="title" value="<?php echo hc($row['title']); ?>">
	</div>
    <div>
	  Категория новости:&nbsp <input type="text" size="30" name="cat" value="<?php echo hc($row['cat']); ?>">
	</div>
	
	<div>
	  Описание новости:<br><textarea rows="10" cols="55" name="description"><?php echo hc($row['description']); ?></textarea>
	</div>
	<div>
	  Полный текст новости:<br><textarea rows="10" cols="55" name="text"><?php echo hc($row['text']); ?></textarea>
	</div>
	<br>
    <input type="submit" name="ok" value=" Сохранить ">
  </form>
</div>