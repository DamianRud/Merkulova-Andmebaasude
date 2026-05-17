use opilased3;

select * from oppilased;

select * from logi;

CREATE TRIGGER lihtneTrigger
ON oppilased
FOR INSERT
AS
INSERT INTO logi (kuupäev, tegevus, kasutaja)
VALUES (GETDATE(), 'Lisati uus õpilane!', SUSER_NAME())