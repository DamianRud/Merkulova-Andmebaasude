
CREATE DATABASE veebipoodRud;
USE veebipoodRud;

CREATE TABLE categories(
category_id INT PRIMARY KEY IDENTITY(1,1),
category_name VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO categories(category_name)
VALUES
('T-särk'),
('mantel'),
('pusa'),
('pintsak');


CREATE TABLE brands(
brand_id INT PRIMARY KEY IDENTITY(1,1),
brand_name VARCHAR(30) UNIQUE NOT NULL
);

INSERT INTO brands(brand_name)
VALUES
('Nike'),
('Adidas'),
('Zara'),
('HM');


CREATE TABLE products(
product_id INT PRIMARY KEY IDENTITY(1,1),
product_name VARCHAR(50) NOT NULL,
brand_id INT NOT NULL,
category_id INT NOT NULL,
model_year INT,
list_price DECIMAL(7,2),
FOREIGN KEY (category_id) REFERENCES categories(category_id),
FOREIGN KEY (brand_id) REFERENCES brands(brand_id)
);


INSERT INTO products(
product_name, brand_id, category_id, model_year, list_price)
VALUES
('Nike T-särk', 1, 1, 2020, 25.50),
('Adidas Pusa', 2, 3, 2021, 30.00),
('Zara Mantel', 3, 2, 2022, 80.00);


SELECT * FROM brands;
SELECT * FROM categories;
SELECT * FROM products;


SELECT * FROM categories;

Update categories SET category_name='kingad'
WHERE category_id=2;
--procedure mis lisab INSERT andmeid tabelise brands
CREATE PROCEDURE LisaBrand
@brand_nimi varchar(30)
as
BEGIN
	INSERT INTO brands(brand_name) VALUES (@brand_nimi);
	SELECT * FROM brands;
END
--procedure käivatus/kutse
EXEC LisaBrand 'Audi';


--procedure mis kustutab DELETE tabelist id järgi

CREATE PROCEDURE kustutaBrand
@id int
AS
BEGIN
SELECT * FROM brands;
DELETE FROM brands WHERE brand_id=@id;
END;

--Kutse
EXEC kustutaBrand 4;
EXEC kustutaBrand @id=5;

--procedure mis otsib brandinimed 1 tähte jargi 
CREATE PROCEDURE otsing1tahte
@taht char(1)
AS
BEGIN
SELECT * FROM brands WHERE brand_name LIKE @taht+'%';
END;
--kutse
EXEC otsing1tahte'A';

--procedure mis uuendab UPDATE brandinimi id järgi

CREATE PROCEDURE uuendaBrand
@id int,
@uus_brandNimi varchar(30)
AS
BEGIN
SELECT * FROM brands;
UPDATE brands SET brand_name=@uus_brandNimi
WHERE brand_id=@id;
END;
--kutse
EXEC uuendaBrand 2,'ussPollo';
