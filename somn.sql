-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Час створення: Чрв 07 2018 р., 20:09
-- Версія сервера: 5.7.21
-- Версія PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `somn`
--

-- --------------------------------------------------------

--
-- Структура таблиці `max`
--

DROP TABLE IF EXISTS `max`;
CREATE TABLE IF NOT EXISTS `max` (
  `name` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `max`
--

INSERT INTO `max` (`name`) VALUES
('maxs'),
('Макс'),
('Макс'),
('6'),
('Ьфч'),
('ьфч');

-- --------------------------------------------------------

--
-- Структура таблиці `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name-project` text CHARACTER SET utf8 NOT NULL,
  `image-project` text CHARACTER SET utf8 NOT NULL,
  `categories` text CHARACTER SET utf8 NOT NULL,
  `about-project` text CHARACTER SET utf8 NOT NULL,
  `city-project` text CHARACTER SET utf8 NOT NULL,
  `tel-project` text CHARACTER SET utf8 NOT NULL,
  `days-project` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=cp1251;

--
-- Дамп даних таблиці `project`
--

INSERT INTO `project` (`id`, `name-project`, `image-project`, `categories`, `about-project`, `city-project`, `tel-project`, `days-project`, `money`) VALUES
(1, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(2, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(3, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(4, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(5, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(6, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(7, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(8, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(9, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(10, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(11, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(12, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(13, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(14, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(15, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(16, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(17, '1', '1', 'Игры', '1', '1', '1', 45, 1),
(18, '1', '1', 'Игры', '1', '1', '1', 45, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `argee` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `argee`) VALUES
(1, 'Maxim', 'maximkerimov@bigmir.net', '31609068fa02cabf1860799a3893596e', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
