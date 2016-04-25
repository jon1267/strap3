<!-- Вывод новости мой вариант для длинных полей $row['title'] $row['description'] $row['text'] -->
<!-- заявка на перевозку груза для админа. Главная, вывод з. в строку, ссылки + - редактир  -->
<!-- временно делаю админский вариант в папке для всех, потом думать. Админу пойдет все а всем ...-->
<!--Этот вариант когда заявка в таблице. Заявка в строчку см main_.php Когда таблица бооольшая ??? незнаю-->
<div>
	<span class="zagol2">Все новости </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="/admin/news/add" title="Добавить новость" class="btn btn-primary btn-sm"><i class="fa fa-files-o fa-lg"></i>&nbsp;&nbsp; Добавить новость </a>
	<!-- Вы водит фразы ..была изменена, ...была удалена -->
	<?php if(isset($info)) { ?>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<span class="box simpletext"><?php echo $info; ?></span>
	<?php } ?>
	<br><br>
	<form action="" method="post">
		<?php $tbody=''; while($row = $news->fetch_assoc()) { ?>
			<div>
				<input type="checkbox" name="ids[]" title="Пометить на удаление" value="<?php echo $row['id']; ?>">&nbsp;&nbsp;
				<a href="/admin/news/edit/?id=<?php echo $row['id']; ?>" title="Редактировать новость"> <i class="fa fa-pencil fa-lg"></i></a>&nbsp;
				<a href="/admin/news/main/?action=delete&id=<?php echo $row['id']; ?>" title="Удалить новость"> <i class="fa fa-trash-o fa-lg"></i></a>&nbsp;
				<?php
				// добавлять поля таблицы тут...
				$newsstr =  '<span class="boldtext">'.$row['title'].'</span>  | '.
							'<span class="date-show">'.mb_substr(datru($row['date']),0,10).'</span><br>'.
				    		'<span class="simpletext">'.$row['description'].'</span><br><br>';
				echo $newsstr;
				// формирую таблицу...$tbody содержит тело табл. без тегов <tbody></tbody>
				//$tbody .= '<tr>'.'<td>'.'<input type="checkbox" name="ids[]" title="Пометить на удаление" value="'.$row['id'].'">&nbsp;&nbsp;'.
				//	'<a href="/admin/zajavka/edit/?id='.$row['id'].'"title="Редактировать"><i class="fa fa-pencil fa-lg"></i></a>&nbsp;&nbsp;'.
				//	'<a href="/admin/zajavka/main/?action=delete&id='.$row['id'].'" title="Удалить одну"><i class="fa fa-trash-o fa-lg"></i></a>&nbsp;'.'</td>'.
				//	'<td>'.mb_substr($row['otkuda'],0,25).'</td>'.
				//	'<td>'.mb_substr($row['kuda'],0,25).'</td>'.
				//	'<td>'.mb_substr($row['gruz'],0,20).'</td>'.
				//	'<td>'.mb_substr(datru($row['datap']),0,12).'</td>'.
				//	'<td>'.mb_substr($row['fio'],0,15).'</td>'.
				//	'<td>'.mb_substr($row['tel'],0,20).'</td>'.
				//	'</tr>';
				?>
			</div>
			<!-- В общем выборку очищаю...-->
		<?php }; $news->close(); ?>
		<!-- <input type="submit" name="delete" value="Удалить отмеченное"> -->
		<br>
		<button class="btn btn-primary" type="submit" title="Удалить отмеченные заявки" name="delete"><i class="fa fa-trash-o fa-lg"></i>&nbsp;&nbsp;Удалить отмеченное</button><br><br>
	</form>
	<!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
	<div class="clear"></div>
	<div class="line"></div>
</div>
