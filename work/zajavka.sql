-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 15 2016 г., 15:53
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `zajavka`
--

INSERT INTO `zajavka` (`id`, `otkuda`, `kuda`, `transp`, `datap`, `gruz`, `ves`, `vol`, `fio`, `tel`, `email`, `notes`) VALUES
(1, 'Дн-вская обл. Синельн. р-н, п. Зеленый Гай', 'Франкфурт на Одере, Германия', 'Платформа Volvo тент 25 кубов', '2016-06-20', 'Согласно договора на трансп. услуги', 15000, 23, 'Семен Семеныч Киндерман', '7351122', 'no@mail.ru', 'Боковая загрузка платформа с тентом'),
(19, 'Авдеевка Донецкой обл.', 'Варшава респ. Польша', '', '2016-09-13', 'Полистирол на палетах', 8500, 2, 'Алексей', '321-45-76', '', ''),
(3, 'г. Краматорск Донецкой обл.', 'Ганновер, Рюсенхальм Германия', 'Боковая загрузка тент 20 тон 50 кубов', '2016-06-21', 'Мешки на палетах', 7500, 36, 'Александр Васильевич', '370-47-10', 'no@mial.ru', 'Нужна таможенная очистка на п перехода Яготин'),
(16, 'г. Соледар Донецкая обл.', 'Рюссельхайм Бавария Германия', '', '2016-05-18', 'мешки соли на поддоне', 9000, 6, 'Семен Семенович', '322-55-66', '', 'Таможенная очистка за счет перевозчика'),
(7, 'Борсполь, Киевс обл., Украина', 'Роттердам, Голландия', 'Будка холодильник', '2016-06-20', 'Груз на палетах, согласно догоаора', 0, 0, 'Васлий', '(067) 621-34-11', '', 'Уточнения в тексте договора');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
