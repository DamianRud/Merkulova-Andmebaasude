-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Veebr 19, 2026 kell 02:15 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `rud2`
--

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `KustutaBrand` (IN `id` INT)   BEGIN
SELECT * FROM brands;
DELETE  FROM brands WHERE brand_id=id;
SELECT * FROM brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KustutaStore` (IN `id` INT(1))   BEGIN
SELECT * FROM stores;
DELETE FROM stores WHERE store_id = id;
SELECT * FROM stores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LisaBrand` (IN `brandNimi` VARCHAR(30))   BEGIN
INSERT INTO brands(brand_name) VALUES (brandNimi);
SELECT * FROM brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LisaStore` (IN `StoreNimi` VARCHAR(30), IN `linn` VARCHAR(30), IN `tel` VARCHAR(13))   BEGIN 
INSERT INTO stores(store_name,city,prohe)
VALUES(StoreNimi,linn,tel);
SELECT * FROM stores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `otsing1taht` (IN `taht` CHAR(1))   BEGIN
SELECT * FROM brands WHERE brand_name LIKE CONCAT(taht,'%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaBrand` (IN `id` INT, IN `uus_brandNimi` VARCHAR(3))   BEGIN 
SELECT * FROM brands;
UPDATE brands SET brand_name=uus_brandNimi WHERE brand_id=id;
SELECT * FROM brands;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `uuendaStore` (IN `id` INT, IN `uusTelefon` VARCHAR(30), IN `uuslinn` VARCHAR(30))   BEGIN
SELECT * FROM stores;
UPDATE  stores SET prohe=ussTelefon,city=uuslinn WHERE store_id=id;
SELECT * FROM stores;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`) VALUES
(1, 'tes'),
(2, 'Pol'),
(3, 'abibas'),
(4, 'adidas');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'sülearvutid'),
(2, 'lauaarvutid'),
(3, 'nutitelefon'),
(4, 'PC'),
(5, 'klaviatur');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `model_year` int(11) DEFAULT NULL,
  `list_price` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `brand_id`, `category_id`, `model_year`, `list_price`) VALUES
(1, 'Abibas -1', 3, 2, 2025, 25.00),
(2, 'Abibas-1', 3, 1, 2025, 250.50),
(3, 'Puma-2', 2, 1, 2026, 300.00),
(4, 'Nike-3', 1, 1, 2023, 400.00);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `stocks`
--

CREATE TABLE `stocks` (
  `store_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `stores`
--

CREATE TABLE `stores` (
  `store_id` int(11) NOT NULL,
  `store_name` varchar(50) NOT NULL,
  `prohe` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `stores`
--

INSERT INTO `stores` (`store_id`, `store_name`, `prohe`, `email`, `street`, `city`, `state`, `zip_code`) VALUES
(1, 'adidas', '12345', 'test@test.ee', 'uus', 'Tallinn', 'Harju', '11569'),
(2, 'Abraham', '5513234', 'test@gmail.com', 'Lasnamae', 'Tallinn', 'Estonia', '5633563'),
(3, 'Bogdan', '5665655', 'Bogdan@gmail.com', 'Lasnamae', 'Tallinn', 'Harjuma', '874578578'),
(5, 'Artur', '75575234', 'artur@gmail.com', 'Mustamae', 'Tallinn', 'Harjuma', '3456765432'),
(7, 'Kola', '374628444', 'kola@gmail.com', 'Habersti', 'Tallinn', 'Harjuma', '464363636'),
(8, 'Zara', '553535535', NULL, NULL, 'Tartu', NULL, NULL);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indeksid tabelile `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indeksid tabelile `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeksid tabelile `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indeksid tabelile `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indeksid tabelile `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indeksid tabelile `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`store_id`,`product_id`,`quantity`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksid tabelile `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabelile `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT tabelile `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`);

--
-- Piirangud tabelile `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Piirangud tabelile `staffs`
--
ALTER TABLE `staffs`
  ADD CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`store_id`),
  ADD CONSTRAINT `staffs_ibfk_2` FOREIGN KEY (`manager_id`) REFERENCES `staffs` (`staff_id`);

--
-- Piirangud tabelile `stocks`
--
ALTER TABLE `stocks`
  ADD CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
