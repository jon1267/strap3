<!-- блок новостей для Всех токо вывод всех  -->

<?php if(isset($info)) { ?>
  <h3><?php echo $info; ?></h3>
<?php } ?>

<div id="clear"></div>
<!-- блок центральной части  -->
<div id="centerpic"></div>	<!-- это устраняет сдвиг на 10px влево...а чего сдвиг хз-разбир некогда  -->
<?php

for ($i = 0; $i<=5; $i++) {
	while ($row = mysqli_fetch_assoc($news)) {
		?>

		<?php if ($i === 0) { ?>
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
		<?php }
		if ($i === 1) { ?>
			<div class="col_2">
				<span class="zagol3">&nbsp;</span><br><br>
				<div id="clear"></div>
				<div class="img123">
					<img src="/skins/<?php echo Core::$SKIN; ?>/img/pic2.png" alt="">
				</div>
				<span class="boldtext"><?php echo $row['title']; ?></span>
				<span class="simpletext"><br><?php echo $row['description']; ?>
				</span>
				<div id="clear"></div>
				<div class="img123">
					<img src="/skins/<?php echo Core::$SKIN; ?>/img/pic3.png" alt="">
				</div>
				<span class="boldtext"><?php echo $row['title']; ?></span>
				<span class="simpletext"><br><?php echo $row['description']; ?>
				</span>

			</div>
		<?php } ?>
		<?php
	}
}
?>

<!-- конец страницы -->
<div class="clear"></div>
<div class="line"></div>
<!-- футер -->
