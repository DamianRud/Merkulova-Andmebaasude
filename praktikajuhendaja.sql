-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Märts 26, 2026 kell 02:39 PL
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
-- Andmebaas: `päringud`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `praktikajuhendaja`
--

CREATE TABLE `praktikajuhendaja` (
  `praktikajuhendaja_id` int(11) NOT NULL,
  `Esineme_Nimi` varchar(50) DEFAULT NULL,
  `viimased_Nimi` varchar(50) DEFAULT NULL,
  `Sünipäev_kuupäevad` date DEFAULT NULL,
  `Telefon_number` varchar(20) DEFAULT NULL,
  `Palk` decimal(10,2) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `praktikajuhendaja`
--

INSERT INTO `praktikajuhendaja` (`praktikajuhendaja_id`, `Esineme_Nimi`, `viimased_Nimi`, `Sünipäev_kuupäevad`, `Telefon_number`, `Palk`, `Email`) VALUES
(1, 'Andrus', 'Kivi', '1985-05-12', '+372 551 2345', 1800.00, NULL),
(2, 'Mari', 'Tamm', '1990-11-23', '+372 512 9876', 2100.50, NULL),
(3, 'Jüri', 'Kask', '1978-03-30', '+372 533 4455', 1950.00, NULL),
(4, 'Tiina', 'Mägi', '1982-07-15', '+372 566 7788', 2500.00, NULL),
(5, 'Mait', 'Lepik', '1995-01-05', '+372 501 0203', 1700.00, NULL),
(6, 'Kati', 'Oja', '1988-09-18', '+372 522 3344', 2200.00, NULL),
(7, 'Sander', 'Pärn', '1980-12-01', '+372 588 6677', 2350.00, NULL),
(8, 'Liis', 'Kuusk', '1992-06-25', '+372 544 5566', 1900.00, NULL),
(9, 'Toomas', 'Sild', '1975-02-14', '+372 599 8811', 2050.00, NULL),
(10, 'Elena', 'Vaher', '1993-08-09', '+372 577 1122', 2150.00, NULL);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `praktikajuhendaja`
--
ALTER TABLE `praktikajuhendaja`
  ADD PRIMARY KEY (`praktikajuhendaja_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `praktikajuhendaja`
--
ALTER TABLE `praktikajuhendaja`
  MODIFY `praktikajuhendaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
