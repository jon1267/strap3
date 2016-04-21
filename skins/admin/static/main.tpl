<?php 
// подключаем обычную авторизацию из сайта для всех если человек не авторизирован
if(!isset($_SESSION['user']) || $_SESSION['user']['access'] != 5 ) {
	include './skins/default/cab/auth.tpl'; 
}
?>
<div class="clear"></div>
<div class="line"></div>