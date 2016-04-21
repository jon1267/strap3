<!-- блок новостей для Всех токо вывод всех  -->
<!-- блок центральной части  -->
<span class="zagol3">Новости компании</span>
<!-- Вы водит фразы ..Данной новости несуществует...,была изменена, ...была удалена -->
<?php if(isset($info)) { ?>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="box simpletext"><?php echo $info; ?></span>
<?php } ?>
<br><br>
<!--
<div class="col_13">
<div class="img123">
	<img src="/skins/<?php echo Core::$SKIN; ?>/img/pic5.png" class="img-circle" alt="round img">
</div>
class="img-circle" $row['description text'] <br><br><br><br> <div class="clear"></div>
-->
<?php $i = 2;
 	//while ($row = mysqli_fetch_assoc($news)) {
 	while ($row = $news->fetch_assoc()) {
		$pname = 'pic'.$i.'.png';
?>
		<div>
			<div class="just-text">
				<div class="img123">
					<img src="/skins/<?php echo Core::$SKIN; ?>/img/<?php echo $pname; ?>" class="img-rounded" alt="round">
				</div>
				<span class="boldtext"><?php echo $row['title']; ?></span>&nbsp;&nbsp;
				<span class="date-show"><?php echo ' '.$row['date']; ?></span><br>
				<span class="simpletext"><?php echo $row['description']; ?></span><br>
				<a href="/news/show?id=<?php echo $row['id']; ?>&pic=<?php echo $pname; ?>" class="simpletext">Подробнее</a> &nbsp;<br><br><br>
			</div>
		</div>

<?php
	$i++;
	}
	$news->close();
?>
<!-- конец страницы -->
<div class="clear"></div>
<div class="line"></div>
<!-- футер -->
