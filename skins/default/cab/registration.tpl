<div class="auth">
	<?php if(!isset($_SESSION['regok'])) { ?>
	<form action="" method="post">
	 <table>
	  <tr>
		<td width="80">Логин *</td>
		<td><input type="text" name="login" value="<?php echo @htmlspecialchars($_POST['login']); ?>"></td>
		<td style="color: red;"><?php echo @$errors['login']; ?></td>
	  </tr>
	  <tr>
		<td>Пароль *</td>
		<td><input type="password" name="password" value="<?php echo @htmlspecialchars($_POST['password']); ?>"></td>
		<td style="color: red;"><?php echo @$errors['password']; ?></td>
	  </tr>
	  <tr>
		<td>E-mail *</td>
		<td><input type="text" name="email" value="<?php echo @htmlspecialchars($_POST['email']); ?>"></td>
		<td style="color: red;"><?php echo @$errors['email']; ?></td>
	  </tr>
	  <tr>
		<td>Возраст</td>
		<td><input type="text" name="age" value="<?php echo @htmlspecialchars($_POST['age']); ?>"></td>
	  </tr>
	 </table>
	 <p style="font-size:10px;">* - обязятельные для заполнения</p>
	 <input type="submit" name="sendreg" value="Зарегистрироваться">
	</form>
	<?php } else { unset($_SESSION['regok']); ?>
	<div>Вы успешно зарегистрировались на сайте!</div>
	<?php } ?>
</div>