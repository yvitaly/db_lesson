-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 16 2021 г., 20:19
-- Версия сервера: 10.4.20-MariaDB
-- Версия PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `southwest-db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `createDate` date NOT NULL,
  `updateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`id`, `email`, `fName`, `lName`, `createDate`, `updateDate`) VALUES
(1, 'customer1@gmail.com', 'CustomerFName', 'CustomerLName', '2021-09-08', '2021-09-10'),
(2, 'customer2@gmail.com', 'CustomerFName2', 'CustomerLName2', '2021-09-01', '2021-09-02'),
(3, 'customer3@gmail.com', 'CustomerFName3', 'CustomerLName3', '2021-09-06', '2021-09-07');

-- --------------------------------------------------------

--
-- Структура таблицы `customer_order`
--

CREATE TABLE `customer_order` (
  `orderId` int(11) NOT NULL,
  `customerId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `customer_order`
--

INSERT INTO `customer_order` (`orderId`, `customerId`) VALUES
(3, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `orderitems`
--

CREATE TABLE `orderitems` (
  `id` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` varchar(50) NOT NULL,
  `createDate` date NOT NULL,
  `updateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderID`, `productID`, `qty`, `createDate`, `updateDate`) VALUES
(1, 3, 1, '25', '2021-09-08', '2021-09-07'),
(2, 5, 3, '25', '2021-09-07', '2021-09-02'),
(3, 6, 4, '25', '2021-09-09', '2021-09-07'),
(4, 5, 1, '25', '2021-09-09', '2021-09-02'),
(5, 5, 4, '25', '2021-09-09', '2021-09-02');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `saler` varchar(50) NOT NULL,
  `saleDate` date NOT NULL,
  `ifPaid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `saler`, `saleDate`, `ifPaid`) VALUES
(3, 'Shues_Saler', '2021-09-02', 1),
(4, 'Shues_Saler2', '2021-09-02', 1),
(5, 'Shues_Saler3', '2021-09-03', 1),
(6, 'Shues_Saler4', '2021-09-03', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `maker` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `qty` int(10) NOT NULL,
  `userID` int(11) NOT NULL,
  `createDate` date NOT NULL,
  `updateDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `maker`, `price`, `qty`, `userID`, `createDate`, `updateDate`) VALUES
(1, 'Adiddas K 123', 'Adidas', '123867.00', 25, 1, '2021-09-09', '2021-09-10'),
(3, 'Adiddas K 124', 'Adidas', '123865.00', 25, 1, '2021-09-08', '2021-09-02'),
(4, 'Adiddas K 125', 'Adidas', '1238.00', 25, 2, '2021-09-09', '2021-09-02'),
(5, 'Adiddas K 126', 'Adidas', '5060.00', 25, 1, '2021-09-02', '2021-09-04');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `secondName` varchar(50) NOT NULL,
  `role` enum('admin','maneger','salesmen') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `firstName`, `secondName`, `role`) VALUES
(1, 'admin@gmail.com', 'FirstName', 'SecondName', 'admin'),
(2, 'admin2@gmail.com', 'FirstName2', 'SecondName2', 'admin');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `customer_order`
--
ALTER TABLE `customer_order`
  ADD KEY `fk_customer_id` (`customerId`),
  ADD KEY `fk_order_id` (`orderId`);

--
-- Индексы таблицы `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`orderID`),
  ADD KEY `fk_product_id` (`productID`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_user` (`userID`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Ограничения внешнего ключа таблицы `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`orderID`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `fk_product_id` FOREIGN KEY (`productID`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_user` FOREIGN KEY (`userID`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
