CREATE DATABASE filmRud;
use filmRud;

--tabeli rezisoor loomine

CREATE TABLE rezisoor(
rezisoorID int PRIMARY KEY identity(1,1),
eesnimi varchar(20),
perenimi varchar(20) UNIQUE,
synniaasta int);
select * from rezisoor;
--tabeli täitmine 
INSERT INTO rezisoor(eesnimi,perenimi,synniaasta)
VALUES('James','Cemeron',1987),
('Clint','Eastwood',1957),
('David','Lunch',1937),
('Margus','Paju',1967);

--tabeli Film Loomine
CREATE TABLE film(
filmID int PRIMARY KEY identity(1,1),
filmNimetus varchar(100),
pikkus int,
rezisoorID int,
FOREIGN KEY (rezisoorID) REFERENCES rezisoor(rezisoorID),
v_aasta int CHECK(v_aasta<2027)
);
SELECT * FROM film;
SELECT * FROM rezisoor;

Insert into film(filmNimetus,rezisoorID,pikkus,v_aasta)
values('Rapuntsel',4,120,2021)




