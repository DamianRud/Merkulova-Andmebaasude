CREATE DATABASE Rud;
use Rud;

--tabeli loomine
CREATE TABLE kasutaja(
kasutajaID int primary key Identity(1,1),
kasutajaNimi varchar(15) NOT NULL,
epost varchar(15),
parool char(10) NOT NULL);

Select * FROM kasutaja;


Insert into kasutaja(kasutajaNimi,parool)
values('Lev','Test');

--tabeli muutmine ja uue veergu lisamine 
ALTER TABLE kasutaja ADD elukoht varchar(15);


--tabeli andmete uuendamine

UPDATE kasutaja SET elukoht='Tallinn';

--veeru kustutamine
ALTER TABLE kasutaja DROP COLUMN elukoht;
Select * FROM kasutaja;


--veeru andmetüübi muutmine
ALTER TABLE kasutaja ALTER COLUMN parool varchar(50);
SELECT * FROM kasutaja

Insert into kasutaja(kasutajaNimi,parool)
values('Andrei','12345678901234567890');


--protseduur tabeli muutmine

CREATE procedure muudaTabeli
@tegevus varchar(15),
@tabeliNimi varchar(15),
@veeruNimi varchar(15),
@andmetüüp varchar(15) = Null
AS
Begin
	DECLARE @sqltegevus varchar(max)
	SET @sqltegevus=case
		When @tegevus='add' then concat('ALTER TABLE ', @tabeliNimi, 'ADD ', @veeruNimi,' ',@andmetüüp)

		When @tegevus='drop' then concat('ALTER TABLE ', @tabeliNimi, ' DROP COLUMN ', @veeruNimi)
END;
print(@sqltegevus);
begin
EXEC(@sqltegevus);
END;
END;

--kutse
EXEC muudaTabeli @tegevus=' add',@tabeliNimi='kasutaja',@veeruNimi='Test',@andmetüüp='int'
SELECT * FROM kasutaja

EXEC muudaTabeli @tegevus='drop', @tabeliNimi='kasutaja', @veeruNimi='Test';