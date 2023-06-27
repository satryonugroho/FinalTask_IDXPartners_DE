CREATE TABLE DimCustomer
(
	CustomerID int PRIMARY KEY,
	CustomerName varchar(128),
	Age int,
	Gender varchar(8),
	City varchar(32),
	NoHP varchar(16)
);

CREATE TABLE DimProduct
(
	ProductID int PRIMARY KEY,
	ProductName varchar(256),
	ProductCategory varchar(256),
	ProductUnitPrice int
);

CREATE TABLE DimStatusOrder
(
	StatusID int PRIMARY KEY,
	StatusOrder varchar(32),
	StatusOrderDesc varchar(64)
);

CREATE TABLE FactSalesOrder
(
    OrderID int PRIMARY KEY,
    CustomerID int FOREIGN KEY REFERENCES DimCustomer(CustomerID),
    ProductID int FOREIGN KEY REFERENCES DimProduct(ProductID),
    Quantity int ,
    Amount int,
    StatusID int FOREIGN KEY REFERENCES DimStatusOrder(StatusID),
    OrderDate date
);
