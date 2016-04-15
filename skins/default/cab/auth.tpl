<div style="padding:50px;">
  <?php if(!isset($status) || $status != 'OK') { echo @$error; ?>
  <form action="" method="post">
    Login: <input type="text" name="login"><br>
	Pass : <input type="password" name="pass"><br><br>
	<!-- Авто авторизация: <input type="checkbox" name="autoauth" title="Запомнить меня на этом сайте"><br><br> -->
	<input type="submit" name="submit" value="  Вход  ">
  </form>
  <?php } else { ?>
    Вы успешо авторизованы.
  <?php } ?>
</div>