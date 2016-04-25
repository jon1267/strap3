<div>
	<span class="zagol3">Новости компании</span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/news/main" class="simpletext">Вернуться к новостям</a>
	<br><br>
	<div class="just-text">
		<div class="img123">
			<img src="/skins/<?php echo Core::$SKIN; ?>/img/<?php echo $_GET['pic']; ?>" class="img-rounded" alt="round">
		</div>
		<span class="boldtext"><?php echo $row['title']; ?></span>&nbsp;&nbsp;
		<span class="date-show"><?php echo ' '.datru($row['date']); ?></span><br>
		<span class="simpletext "><?php echo $row['text']; ?></span>
	</div>
</div><br>
<!-- конец страницы -->
<div class="clear"></div>
<div class="line"></div>
<!-- футер -->