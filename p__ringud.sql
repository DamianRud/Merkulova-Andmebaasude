-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Märts 26, 2026 kell 02:42 PL
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

DELIMITER $$
--
-- Toimingud
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ArvutaKeskminePalk` ()   BEGIN
    SELECT AVG(Palk) AS 'Juhendajate Keskmine Palk' 
    FROM praktikajuhendaja;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LisaEmailVeerg` ()   BEGIN
    ALTER TABLE praktikajuhendaja ADD COLUMN Email VARCHAR(100);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LisaUusFirma` (IN `p_nimi` VARCHAR(50), IN `p_aadress` VARCHAR(50), IN `p_telefon` VARCHAR(20))   BEGIN
    INSERT INTO firma (firmanimi, aadress, telefon)
    VALUES (p_nimi, p_aadress, p_telefon);
    

    SELECT * FROM firma ORDER BY firmaID DESC LIMIT 1;
END$$

--
-- Funktsioonid
--
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateAge` (`dob` DATE) RETURNS INT(11) DETERMINISTIC BEGIN
    RETURN TIMESTAMPDIFF(YEAR, dob, CURDATE());
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fnComputeAge` (`dob` DATE) RETURNS VARCHAR(50) CHARSET utf8mb4 COLLATE utf8mb4_general_ci DETERMINISTIC BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE days INT;
    DECLARE temp_date DATE;
    
   
    SET years = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    SET temp_date = DATE_ADD(dob, INTERVAL years YEAR);
    
    SET months = TIMESTAMPDIFF(MONTH, temp_date, CURDATE());
    SET temp_date = DATE_ADD(temp_date, INTERVAL months MONTH);
    
   
    SET days = DATEDIFF(CURDATE(), temp_date);
    
    RETURN CONCAT(years, ' Years ', months, ' Months ', days, ' Days old');
END$$

DELIMITER ;

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

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `praktikabaas`
--

CREATE TABLE `praktikabaas` (
  `praktikabaasID` int(11) NOT NULL,
  `firmaID` int(11) DEFAULT NULL,
  `praktikatingimused` varchar(50) DEFAULT NULL,
  `arvutiprogramm` varchar(50) DEFAULT NULL,
  `juhendajaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `praktikabaas`
--

INSERT INTO `praktikabaas` (`praktikabaasID`, `firmaID`, `praktikatingimused`, `arvutiprogramm`, `juhendajaID`) VALUES
(1, 1, 'Kontoritöö', 'MS Excel', 1),
(2, 2, 'Kaugisõpe', 'VS Code', 2),
(3, 3, 'Täisajaga', 'AutoCAD', 3),
(4, 4, 'Paindlik', 'IntelliJ', 4),
(5, 5, 'Tasustatud', 'Slack', 5),
(6, 6, 'Kontoris', 'SAP', 6),
(7, 7, 'Osaline tööaeg', 'Docker', 7),
(8, 8, 'Projektipõhine', 'Figma', 8),
(9, 9, 'Lepinguga', 'Python/IDLE', 9),
(10, 10, 'Suvepraktika', 'Jira', 10);

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

-- --------------------------------------------------------

--
-- Sise-vaate struktuur `v_sygis_juhendajad`
-- (Tegelik vaade on allpool)
--
CREATE TABLE `v_sygis_juhendajad` (
`Esineme_Nimi` varchar(50)
,`viimased_Nimi` varchar(50)
,`Sünipäev_kuupäevad` date
);

-- --------------------------------------------------------

--
-- Sise-vaate struktuur `v_vakantsid_ettevottes`
-- (Tegelik vaade on allpool)
--
CREATE TABLE `v_vakantsid_ettevottes` (
`firmanimi` varchar(50)
,`kohtade_arv` bigint(21)
);

-- --------------------------------------------------------

--
-- Vaate struktuur `v_sygis_juhendajad`
--
DROP TABLE IF EXISTS `v_sygis_juhendajad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sygis_juhendajad`  AS SELECT `praktikajuhendaja`.`Esineme_Nimi` AS `Esineme_Nimi`, `praktikajuhendaja`.`viimased_Nimi` AS `viimased_Nimi`, `praktikajuhendaja`.`Sünipäev_kuupäevad` AS `Sünipäev_kuupäevad` FROM `praktikajuhendaja` WHERE month(`praktikajuhendaja`.`Sünipäev_kuupäevad`) in (9,10,11) ;

-- --------------------------------------------------------

--
-- Vaate struktuur `v_vakantsid_ettevottes`
--
DROP TABLE IF EXISTS `v_vakantsid_ettevottes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_vakantsid_ettevottes`  AS SELECT `f`.`firmanimi` AS `firmanimi`, count(`b`.`praktikabaasID`) AS `kohtade_arv` FROM (`firma` `f` left join `praktikabaas` `b` on(`f`.`firmaID` = `b`.`firmaID`)) GROUP BY `f`.`firmanimi` ;

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firmaID`);

--
-- Indeksid tabelile `praktikabaas`
--
ALTER TABLE `praktikabaas`
  ADD PRIMARY KEY (`praktikabaasID`),
  ADD KEY `firmaID` (`firmaID`),
  ADD KEY `juhendajaID` (`juhendajaID`);

--
-- Indeksid tabelile `praktikajuhendaja`
--
ALTER TABLE `praktikajuhendaja`
  ADD PRIMARY KEY (`praktikajuhendaja_id`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `firma`
--
ALTER TABLE `firma`
  MODIFY `firmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT tabelile `praktikabaas`
--
ALTER TABLE `praktikabaas`
  MODIFY `praktikabaasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabelile `praktikajuhendaja`
--
ALTER TABLE `praktikajuhendaja`
  MODIFY `praktikajuhendaja_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `praktikabaas`
--
ALTER TABLE `praktikabaas`
  ADD CONSTRAINT `praktikabaas_ibfk_1` FOREIGN KEY (`firmaID`) REFERENCES `firma` (`firmaID`),
  ADD CONSTRAINT `praktikabaas_ibfk_2` FOREIGN KEY (`juhendajaID`) REFERENCES `praktikajuhendaja` (`praktikajuhendaja_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
