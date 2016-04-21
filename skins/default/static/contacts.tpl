<!-- конец логотип и главное меню -->
<div id="clear"></div>
<!-- блок на 2 колонки картинка текст и рядом на 1 колонку текст -->
<div id="centerpic"></div> <!-- это устраняет сдвиг на 10px влево...а чего сдвиг хз-разбир некогда  -->
<div class="col_1cont">
	<span class="zagol3">контактная информация<br><br></span>
	<div id="clear"></div>
	<div class="img12">
		<img src="/skins/<?php echo Core::$SKIN; ?>/img/pic7.jpg" alt="">
	</div>
	<div class="clear"></div>
				<span class="simpletext"><br><br>
										The Company Name Inc.<br>
										8901 Marmora Road, <br>
										Glasgow, D04 89GR.<br> 
										Freephone:  +1 800 559 6580 <br>
										Telephone:  +1 800 603 6035 <br>
										FAX: +1 800 889 9898 <br>
										E-mail: mail@demolink.org <br>
 				</span>
</div>
<div class="col_2cont">
	<span class="zagol3">свяжитесь с нами<br><br></span>
	<div class="clear"></div>
	<form name="contform" action="" method="post" >
		<p><input type="text" class="form-control input-small" size="50" name="name"  placeholder = "Name"/></p>
		<p><input type="text" class="form-control" size="50" name="email" placeholder = "E-mail"/></p>
		<p><input type="text" class="form-control" size="50" name="phone" placeholder = "Phone"/></p>
		<p><textarea class="form-control" rows="10" cols="50" name="message" placeholder = "Message" ></textarea></p>
		<br>
		<p><button class="btn btn-primary " type="reset" ><i class="fa fa-eraser"></i>&nbsp;&nbsp;Очистить</button>&nbsp;&nbsp;&nbsp;
		<button class="btn btn-primary " type="submit" name="contacts" value="Отправить" ><i class="fa fa-save"></i>&nbsp;&nbsp;Отправить</button>
		<!--<br><button class="btn btn-primary" type="submit" name="add"><i class="fa fa-save"></i>&nbsp;&nbsp;Добавить заявку</button><br><br> -->
	</form>
</div>
<!-- эти 2 дива рисуют тонкую разделит. линию посередине блока content-->
<div class="clear"></div>
<div class="line"></div>