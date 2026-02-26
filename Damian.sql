CREATE DATABASE Damian;
use Damian;

CREATE TABLE category(
idCategory int identity(1,1) Primary key,
Category_Name varchar(50),
);

INSERT INTO Category (Category_Name)
VALUES 
('õun'),
('pirn'),
('paprika');


SELECT * FROM category;



CREATE TABLE Product (
idProduct INT IDENTITY(1,1) Primary key,
Name varchar(50),
idCategory INT,
Price DECIMAL(7,2),
);

INSERT INTO Product (Name, idCategory, Price)
VALUES
('püksid', 1, 1200.00),
('T-Särk', 2, 25.50),
('särk', 3, 3.20),
('tosud', 1, 800.00),
('lips', 2, 60.00);

Select * FROM Product;







CREATE TABLE Sale (
idSale INT IDENTITY(1,1) PRIMARY KEY,
idProduct int,
idCustomer int,
Count_pr int,
Date_of_sale DATE
);


INSERT INTO Sale (idProduct, idCustomer, Count_pr, Date_of_sale)
VALUES
(1, 1, 1, '2026-02-01'),
(3, 2, 5, '2026-02-05'),
(2, 3, 2, '2026-02-10'),
(4, 1, 1, '2026-02-15'),
(5, 2, 3, '2026-02-20');

SELECT * FROM Sale;




--PK Lisamine
ALTER TABLE Category
ADD CONSTRAINT pk_Category PRIMARY KEY(idCategory);

SELECT * FROM category;

ALTER TABLE Product
ADD CONSTRAINT pk_product PRIMARY KEY(idProduct);


ALTER TABLE Sale
ADD CONSTRAINT pk_sale PRIMARY KEY(idSale);



--Unique Lisamine
ALTER TABLE Category
ADD CONSTRAINT uq_category_name UNIQUE(Category_Name);



EXEC sp_help Category;
EXEC sp_help Product;
EXEC sp_help Sale;




--fk key
ALTER TABLE Product
ADD CONSTRAINT fk_product_category FOREIGN KEY(idCategory)
REFERENCES Category(idCategory);



ALTER TABLE Sale
ADD CONSTRAINT fk_sale_product FOREIGN KEY(idProduct)
REFERENCES Product(idProduct);






ALTER TABLE Sale
ADD CONSTRAINT fk_sale_customer FOREIGN KEY(idCustomer)
REFERENCES Customer(idCustomer);


ALTER TABLE Product
ADD CONSTRAINT chk_price CHECK(Price > 0);

ALTER TABLE Sale
ADD CONSTRAINT chk_count CHECK(Count_pr > 0);







CREATE TABLE Customer(
idCustomer INT IDENTITY(1,1) primary key,
Name varchar(50) NOT NULL,
Contact varchar(100)
);


ALTER TABLE Customer
ADD CONSTRAINT pk_customer PRIMARY KEY(idCustomer);

select * from Customer;



ALTER TABLE Sale
ADD CONSTRAINT fk_sale_customer FOREIGN KEY(idCustomer)
REFERENCES Customer(idCustomer);


ALTER TABLE Customer
ADD CONSTRAINT pk_customer PRIMARY KEY(idCustomer);