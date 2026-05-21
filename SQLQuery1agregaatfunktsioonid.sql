create database example;
use example;


-- 1. Luua tabel testandmetega 
CREATE TABLE Tehingud (
TehingID INT PRIMARY KEY IDENTITY(1,1),
Toode VARCHAR(50) NOT NULL,
Kategooria VARCHAR(50) NOT NULL,
Hind DECIMAL(10, 2) NOT NULL,
Kogus INT NULL,
KliendiKood BIGINT NOT NULL,
Kuupaev DATE NOT NULL
);



-- 2. Täita tabel andmetega 
INSERT INTO Tehingud (Toode, Kategooria, Hind, Kogus, KliendiKood, Kuupaev) VALUES
('Sülearvuti', 'Elektroonika', 1200.00, 5, 1000001, '2026-05-01'),
('Nutitelefon', 'Elektroonika', 800.00, 10, 1000002, '2026-05-02'),
('Kõrvaklapid', 'Elektroonika', 150.00, NULL, 1000001, '2026-05-02'),
('Kohvimasin', 'Kodutehnika', 450.00, 3, 1000003, '2026-05-03'),
('Tolmuimeja', 'Kodutehnika', 250.00, 4, 1000004, '2026-05-04'),
('Külmkapp', 'Kodutehnika', 900.00, 1, 1000001, '2026-05-05'),
('Diivan', 'Mööbel', 1100.00, 2, 1000005, '2026-05-06'),
('Kontoritool', 'Mööbel', 180.00, 8, 1000002, '2026-05-07');



SELECT Kategooria, MIN(Toode) AS SuvalineToode
FROM Tehingud
GROUP BY Kategooria;

SELECT APPROX_COUNT_DISTINCT(KliendiKood) AS LigikaudneKlientideArv
FROM Tehingud;



SELECT Kategooria, AVG(Hind) AS KeskmineHind
FROM Tehingud
GROUP BY Kategooria;


SELECT CHECKSUM_AGG(BINARY_CHECKSUM(Hind)) AS TabeliKontrollsumma
  FROM Tehingud;

  SELECT COUNT(*) AS KoikRead, COUNT(Kogus) AS OlemasolevaKogusegaRead
  FROM Tehingud;

  SELECT COUNT_BIG(*) AS SuurRidadeArv
  FROM Tehingud;

  SELECT Kategooria, GROUPING(Kategooria) AS KasOnVahesumma, SUM(Hind) AS Kogusumma
  FROM Tehingud
  GROUP BY ROLLUP(Kategooria);

  SELECT Kategooria, Toode, GROUPING_ID(Kategooria, Toode) AS GrupiTase
  FROM Tehingud
  GROUP BY CUBE(Kategooria, Toode);

  SELECT MAX(Hind) AS KõigeKallimHind
FROM Tehingud;

SELECT MIN(Kuupaev) AS EsimeneTehing
  FROM Tehingud;

  SELECT STDEV(Hind) AS HindadeStandardhalve
  FROM Tehingud;

  SELECT STDEVP(Hind) AS PopulatsiooniStandardhalve
  FROM Tehingud;

  SELECT Kategooria, STRING_AGG(Toode, ', ') AS TootedNimekirjas
  FROM Tehingud
  GROUP BY Kategooria;

  SELECT Kategooria, SUM(Hind) AS Kogukäive
  FROM Tehingud
  GROUP BY Kategooria;

  SELECT VAR(Hind) AS HindadeDispersioon
  FROM Tehingud;

  SELECT VARP(Hind) AS PopulatsiooniDispersioon
  FROM Tehingud;