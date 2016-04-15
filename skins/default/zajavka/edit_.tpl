<!-- Редактир 1-ой заявки на перевозку полный админский вариант htmlspecialchars -->
<!-- <div style="padding-top:30px;padding-bottom:30px;margin-left:20px;"> -->
<div>
<form action="" method="post">
    <div>
    Откуда: <input  type="text" size="40" name="otkuda" value="<?php echo hc($row['otkuda']); ?>">
    </div>
    <div>
      Куда: <input type="text" size="40" name="kuda" value="<?php echo hc($row['kuda']); ?>">
    </div>
    <div>
      Чем: <input type="text" size="40" name="transp" value="<?php echo hc($row['transp']); ?>">
    </div>
    <div>
      Дата <input type="date" name="datap" value="<?php echo $row['datap']; ?>">
    </div>
    <div>
        Груз: <input type="text" size="40" name="gruz" value="<?php echo hc($row['gruz']); ?>">
    </div>
    <div>
        Вес: <input type="number" size="40" name="ves" value="<?php echo floatAll($row['ves']); ?>">
    </div>
    <div>
        Объем: <input type="number" size="40" name="vol" value="<?php echo floatAll($row['vol']); ?>">
    </div>
    <div>
        Конт.Лицо: <input type="text" size="40" name="fio" value="<?php echo hc($row['fio']); ?>">
    </div>
    <div>
        Телефон: <input type="text" size="40" name="tel" value="<?php echo hc($row['tel']); ?>">
    </div>
    <div>
        E-mail: <input type="text" size="40" name="email" value="<?php echo hc($row['email']); ?>">
    </div>
    Комментарии:
   <div>
    <textarea rows="10" cols="60" name="notes"><?php echo hc($row['notes']); ?></textarea>
  </div>  
  <br>
  <input type="submit" name="ok" value="Сохранить заявку">
</form>
</div>
