-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 11 2016 г., 16:59
-- Версия сервера: 5.5.45
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `main`
--

-- --------------------------------------------------------

--
-- Структура таблицы `zajavka`
--

CREATE TABLE IF NOT EXISTS `zajavka` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `otkuda` varchar(255) NOT NULL,
  `kuda` varchar(255) NOT NULL,
  `transp` varchar(100) NOT NULL,
  `datap` date NOT NULL,
  `gruz` varchar(100) NOT NULL,
  `ves` float NOT NULL,
  `vol` float NOT NULL,
  `fio` varchar(100) NOT NULL,
  `tel` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `zajavka`
--

INSERT INTO `zajavka` (`id`, `otkuda`, `kuda`, `transp`, `datap`, `gruz`, `ves`, `vol`, `fio`, `tel`, `email`, `notes`) VALUES
(1, 'Дн-вская обл. Синельн. р-н, п. Зеленый Гай', 'Франкфурт на Одере, Германия', 'Франкфурт на Одере, Германия', '2010-05-20', 'Согласно договора на трансп. услуги', 7995, 23, 'Иван Иваныч', '+380671111111', 'no@mail.ru', 'Боковая загрузка платформа с тентом'),
(2, 'г. Артемовск Донецкой обл', 'г. Вестерхаузен земля Бавария Германия', 'г. Вестерхаузен земля Бавария Германия', '2016-05-15', 'Мешки соли на палетах', 18000, 46, 'Аннушка', '(067) 671-23-77', 'not@email.my', 'Таможенное оформление на пункте перехода Ягодин за счет отправителя'),
(3, 'г. Краматорск Донецкой обл.', 'Ганновер, Рюсенхальм Германия', 'Боковая загрузка тент 20 тон 50 кубов', '2016-06-27', 'Мешки на палетах', 7500, 36, 'Александр Петрович', '370-31-12', 'no@mial.ru', 'Нужна таможенная очистка на п перехода Яготин'),
(5, 'г. Днепропетровск, Украина', 'г. Гренобль, Франция', '20 тон 45 кубов', '2010-05-20', 'Мрамор шлифованный', 17000, 25, 'Иван Иванов', '3772367', '', ''),
(7, 'Борсполь, Киевс обл., Украина', 'Роттердам, Голландия', 'Роттердам, Голландия', '2007-07-20', 'Груз на палетах, согласно догоаора', 0, 0, 'Василий', '0676213411', '', 'Уточнения в тексте договора');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
