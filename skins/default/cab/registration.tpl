<div>
	<div class="col-md-8">
	<?php if(!isset($_SESSION['regok'])) { ?>
	<form action="" method="post">
	 <table>
	  <tr>
		<td width="100"><p>Логин *</p></td>
		<td><p><input type="text" class="form-control input-sm" name="login" value="<?php echo @htmlspecialchars($_POST['login']); ?>"></p></td>
		<td style="color: red;padding-left: 10px;"><p><?php echo @$errors['login']; ?></p></td>
	  </tr>
	  <tr>
		<td><p>Пароль *</p></td>
		<td><p><input type="password" class="form-control input-sm" name="password" value="<?php echo @htmlspecialchars($_POST['password']); ?>"></p></td>
		<td style="color: red;padding-left: 10px;"><p><?php echo @$errors['password']; ?></p></td>
	  </tr>
	  <tr>
		<td><p>E-mail *</p></td>
		<td><p><input type="text" class="form-control input-sm" name="email" value="<?php echo @htmlspecialchars($_POST['email']); ?>"></p></td>
		<td style="color: red;padding-left: 10px;"><p><?php echo @$errors['email']; ?></p></td>
	  </tr>
	 </table>
	<p style="font-size:12px;">* - обязятельные для заполнения</p>
	<!--<input type="submit" name="sendreg" value="Зарегистрироваться"> -->
	<button class="btn btn-sm btn-mymore" type="submit" name="sendreg"><i class="fa fa-user-plus"></i> Регистрация </button>
	<br><br>
	</form>
	<?php } else { unset($_SESSION['regok']); ?>
		<div>
			<span class="simpletext">Вы успешно зарегистрировались на сайте! На указанный при регистрации e-mail,<br>
			Вам было выслано письмо, со ссылкой, по которой Вам нужно кликнуть для активации<br>
			своего аккаунта.</span>
		</div>
	<?php } ?>

	</div>
	<!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
	<div class="clear"></div>
	<div class="line"></div>
</div>