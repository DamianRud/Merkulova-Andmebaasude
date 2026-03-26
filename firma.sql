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
-- Tabeli struktuur tabelile `firma`
--

CREATE TABLE `firma` (
  `firmaID` int(11) NOT NULL,
  `firmanimi` varchar(50) DEFAULT NULL,
  `aadress` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `firma`
--

INSERT INTO `firma` (`firmaID`, `firmanimi`, `aadress`, `telefon`) VALUES
(1, 'InfoTehnoloogia OÜ', 'Sõpruse pst 145', '+372 555 1234'),
(2, 'DigiLahendused AS', 'Tartu mnt 80', '+372 512 3456'),
(3, 'Eesti Energia', 'Lelle 22', '+372 612 0000'),
(4, 'Nortal AS', 'Lõõtsa 6', '+372 660 0000'),
(5, 'Wise', 'Rataskaevu 6', '+372 588 7766'),
(6, 'Telia Eesti AS', 'Mustamäe tee 3', '+372 639 7111'),
(7, 'Boltech OÜ', 'Vana-Lõuna 15', '+372 533 2211'),
(8, 'Skype Technologies', 'Akadeemia tee 15', '+372 686 1000'),
(9, 'Cybernetica AS', 'Mäealuse 2', '+372 639 7900'),
(10, 'Pipedrive OÜ', 'Paldiski mnt 80', '+372 566 9988'),
(11, 'IT-Keskus OÜ', 'Tallinn, Raja 15', '5551122');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firmaID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `firma`
--
ALTER TABLE `firma`
  MODIFY `firmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
