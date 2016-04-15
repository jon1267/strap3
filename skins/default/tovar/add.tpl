<div style="padding-top:30px;padding-bottom:30px;margin-left:20px;">
<form action="" method="post">
  <div>
    Наименова товара: <input  type="text" size="40" name="name">
  </div>
  <div>
    Выберите категорию :
	<select name="kategory" size="1">
	  <option  value="телевизоры">телевизоры</option>
	  <option selected value="холодильники">холодильники</option>
	  <option  value="канцтовары">канцтовары</option>
	  <option  value="оргтехника">оргтехника</option>
	</select>
  </div>
   <div>
    Краткое описание: <input type="text" size="40" name="kropis">
  </div> 
   Полное описание: 
   <div>
    <textarea rows="10" cols="60" name="opis"></textarea>
  </div>  
   <div>
    Цена товара: <input type="text" size="10" name="cena"> 
  </div> 
  <div>
    Количество : <input type="text" size="10" name="kol">
  </div>   
  <br>
  <input type="submit" name="add" value="Добавить товар">
</form>
</div>