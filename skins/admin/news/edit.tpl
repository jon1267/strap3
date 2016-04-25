<!-- Админ. Добавление 1ой новости с бутсрапом3 -->
<div >

	<form action="" method="post">
		<!-- куча говнокода для выравнивания datetimepicker-а бо он рушит всю верстку...!!! -->
		<div class="col-sm-8">
			<div class="row">
				<div class="col-sm-6">
					<div class="row">
						<label class="adm-news-label" >
							Заголовок новости :<span class="color-errors"><?php echo @$errors['title']; ?></span>
							<input  type="text" class="form-control input-sm " size="55" name="title" value="<?php echo @hc($row['title']); ?>"></label>&nbsp;&nbsp;&nbsp;
					</div>
				</div>

				<div class="col-sm-3">
					<label class="adm-news-label">Дата:
						<div class="input-group date date-width" id="datetimepicker1">
							<input type="text" class="form-control input-sm" name="date" value="<?php echo @hc($row['date']); ?>">
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
					<textarea class="form-control input-sm" rows="5" cols="90" name="description"><?php echo @hc($row['description']); ?></textarea></label></p>
		</div>
		<div>
			<p><label class="adm-news-label"> Полный текст новости: <span class="color-errors"><?php echo @$errors['text']; ?></span>
					<textarea class="form-control input-sm" rows="10" cols="90" name="text"><?php echo @hc($row['text']); ?></textarea></label></p>
		</div>
		<!-- <input type="submit" name="ok" value=" Сохранить "> -->
		<br><button class="btn btn-primary" type="submit" name="ok"><i class="fa fa-save"></i>&nbsp;&nbsp;Сохранить новость</button><br><br>

	</form>
	<!--</div>-->

	<!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
	<div class="clear"></div>
	<div class="line"></div>
</div>