<!-- блок новостей для Всех токо вывод всех  -->

<?php if(isset($info)) { ?>
  <h3><?php echo $info; ?></h3>
<?php } ?>

<div id="clear"></div>
<!-- блок центральной части  -->
<div id="centerpic"></div>	<!-- это устраняет сдвиг на 10px влево...а чего сдвиг хз-разбир некогда  -->
<?php


	while ($row = mysqli_fetch_assoc($news)) {
		?>


			<div class="col_13">
				<span class="zagol3">Новости компании</span><br><br>
				<div id="clear"></div>
				<div class="img123">
					<img src="/skins/<?php echo Core::$SKIN; ?>/img/pic5.png" class="img-circle" alt="round img">
				</div>
				<span class="boldtext"><?php echo $row['title']; ?></span>
				<span class="simpletext"><?php echo $row['description']; ?>
				</span>
			</div>

		<?php
	}
?>

<!-- конец страницы -->
<div class="clear"></div>
<div class="line"></div>
<!-- футер -->
