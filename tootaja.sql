CREATE DATABASE RUDTAR1
use RUDTAR1

--tabeli loomine
CREATE TABLE tootaja(
tootajaID int PRIMARY KEY identity(1,1),
eesnimi varchar(30),
perenimi varchar(30),
synniaeg date,
koormus decimal(5,2),
elukoht TEXT,
abielus bit
);
--tabeli kustutamine
drop table tootaja;
--tabeli kuvamine
select * from tootaja;

--tabeli andmete lisamine 

INSERT INTO tootaja(eesnimi,perenimi,synniaeg)
VALUES ('Mark','Gringo','2025-10-13'),
('Sten','Valgus','2025-10-13'),
('Dmitri','Kapp','2025-10-13');
