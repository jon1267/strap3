<!--Редактирование 1ой новости с бутсрапом3 -->
<div>
	<div class="control-group">
		<form action="" method="post">
				<!--
				<div>
					<p><label class="adm-news-label"> Заголовок новости :
					<input  type="text" class="form-control input-md " size="55" name="title" value="<?php echo hc($row['title']); ?>"></label>&nbsp;&nbsp;&nbsp;
					<label class="adm-news-label"> Дата:
					<input type="text" class="form-control input-md" name="date" value="<?php echo hc($row['date']); ?>">
					</label></p>
				</div>
				-->

				<div>
					<p><label class="adm-news-label"> Описание новости:
					<textarea class="form-control input-md" rows="5" cols="90" name="description"><?php echo hc($row['description']); ?></textarea>
					</label></p>
				</div>
				<div>
					<p><label class="adm-news-label"> Полный текст новости:
					<textarea class="form-control input-md" rows="10" cols="90" name="text"><?php echo hc($row['text']); ?></textarea>
					</label></p>
				</div>
				<!-- <input type="submit" name="ok" value=" Сохранить "> -->
				<br><button class="btn btn-primary" type="submit" name="ok"><i class="fa fa-save"></i>&nbsp;&nbsp;Сохранить новость</button><br><br>

		</form>
	</div>
</div>
	<!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
	<div class="clear"></div>
	<div class="line"></div>
</div>

<!--
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