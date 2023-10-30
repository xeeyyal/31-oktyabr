CREATE DATABASE TasksJoin2

USE TasksJoin2

CREATE TABLE Products(
ProductID int primary key identity,
[Name] nvarchar(50) not null,
Price decimal,
Cost decimal,
)

CREATE TABLE Categories(
CategoryID int primary key identity,
[Name] nvarchar(50) not null
)

CREATE TABLE Colors(
ColorID int primary key identity,
[Name] nvarchar(50) not null
)

CREATE TABLE ProductsColors (
ProductColorID int primary key identity,
ProductID int references Products(ProductID),
ColorID int references Colors(ColorID)
)

SELECT *FROM Products
SELECT *FROM Categories
SELECT *FROM Colors
SELECT *FROM ProductsColors

INSERT INTO Categories([Name]) VALUES
('APPLE')

INSERT INTO Products([Name],Price,Cost) VALUES
('iPhone 15',2950.99,250.99),
('iPhone 15 PRO',3250.99,350.99),
('iPhone 15 Plus',3650.99,450.99),
('iPhone 15 PRO MAX',4050.99,550.99)

INSERT INTO Colors([Name]) VALUES
('Black'),
('Blue'),
('White'),
('Gold')

INSERT INTO ProductsColors(ProductID,ColorID) VALUES
(1,3),
(2,4),
(3,1),
(4,2),
(2,1),
(3,4),
(4,3)

SELECT Products.[Name] AS ProductName, Categories.[Name] AS CategoryName, Colors.[Name] AS ColorName FROM Products
LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID
LEFT JOIN ProductsColors ON Products.ProductID = ProductsColors.ProductID
LEFT JOIN Colors ON ProductsColors.ColorID = Colors.ColorID;
