<!-- Админ. Добавление 1ой новости с бутсрапом3 -->
<div class="row">

		<form action="" method="post">
			<!-- куча говнокода для выравнивания datetimepicker-а бо он рушит всю верстку...!!! -->
			<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-6">
				<div class="row">
				<label class="adm-news-label" >
				Заголовок новости :<span class="color-errors"><?php echo @$errors['title']; ?></span>
				<input  type="text" class="form-control input-sm " size="55" name="title" value="<?php echo @hc($_POST['title']); ?>"></label>&nbsp;&nbsp;&nbsp;
				</div>
				</div>

				<div class="col-sm-3">
				<label class="adm-news-label">Дата:
					<div class="input-group date date-width" id="datetimepicker1">
						<input type="text" class="form-control input-sm" name="date" value="<?php echo @hc($_POST['date']); ?>">
						<span class="input-group-addon">
							<span class="glyphicon glyphicon-calendar"></span>
						</span>
					</div>
				</label>
				</div>
			</div>
			</div>

			<div>
				<p><label class="adm-news-label"> Описание новости:<span class="color-errors"><?php echo @$errors['description']; ?></span>
				<textarea class="form-control input-sm" rows="5" cols="90" name="description"><?php echo @hc($_POST['description']); ?></textarea></label></p>
			</div>
			<div>
				<p><label class="adm-news-label"> Полный текст новости: <span class="color-errors"><?php echo @$errors['text']; ?></span>
				<textarea class="form-control input-sm" rows="10" cols="90" name="text"><?php echo @hc($_POST['text']); ?></textarea></label></p>
			</div>
			<!-- <input type="submit" name="ok" value=" Сохранить "> -->
			<br><button class="btn btn-primary" type="submit" name="add"><i class="fa fa-save"></i>&nbsp;&nbsp;Добавить новость</button><br><br>

		</form>
	<!--</div>-->

<!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
<div class="clear"></div>
<div class="line"></div>
</div>

<!--
<div style="padding-top:30px;padding-bottom:30px;margin-left:20px;">
  <form action="" method="post">
    <div>
	  Заголовок новости:&nbsp <input type="text" size="30" name="title">
	</div>
    <div>
	  Категория новости:&nbsp <input type="text" size="30" name="cat">
	</div>
	
	<div>
	  Описание новости:<br><textarea rows="10" cols="55" name="description" ></textarea>
	</div>
	<div>
	  Полный текст новости:<br><textarea rows="10" cols="55" name="text" ></textarea>
	</div>
	<br>
    <input type="submit" name="add" value=" Добавить ">
  </form>
</div>