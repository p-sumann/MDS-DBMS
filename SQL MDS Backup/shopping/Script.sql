CREATE TABLE Customer (
    CustomerID SERIAL PRIMARY KEY,
    CustFirstName VARCHAR(25),
    CustMidName VARCHAR(10),
    CustLastName VARCHAR(25)
);

CREATE TABLE SalesOrder (
	OrderID SERIAL PRIMARY KEY,
	OrderDate DATE,
	CustomerID INT, FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)

);

CREATE TABLE Product (
	ProductID SERIAL PRIMARY KEY,
	ProductName VARCHAR(25),
	UnitPrice DECIMAL,
	NumberInStock INT
);

CREATE TABLE Orderline
(
	OrderLineId SERIAL PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	QuantityOrdered VARCHAR(15),
	FOREIGN KEY(OrderID) REFERENCES SalesOrder(OrderID),
	FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);





DROP TABLE SalesOrder CASCADE;

SalesOrder
