create database sivasakthi;
use sivasakthi;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(100)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2),
    Stock INT
);
CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Customer (CustomerID, CustomerName, ContactNumber, Email, Address) VALUES
(1, 'Alice Smith', '1234567890', 'alice@example.com', '123 Maple St'),
(2, 'Bob Johnson', '2345678901', 'bob@example.com', '456 Oak St'),
(3, 'Carol Williams', '3456789012', 'carol@example.com', '789 Pine St'),
(4, 'David Brown', '4567890123', 'david@example.com', '101 Birch St'),
(5, 'Eva Davis', '5678901234', 'eva@example.com', '202 Cedar St'),
(6, 'Frank Miller', '6789012345', 'frank@example.com', '303 Spruce St'),
(7, 'Grace Lee', '7890123456', 'grace@example.com', '404 Elm St'),
(8, 'Henry Wilson', '8901234567', 'henry@example.com', '505 Willow St'),
(9, 'Ivy Martinez', '9012345678', 'ivy@example.com', '606 Redwood St'),
(10, 'Jake White', '0123456789', 'jake@example.com', '707 Cherry St');

INSERT INTO Product (ProductID, ProductName, Price, Stock) VALUES
(1, 'Laptop', 999.99, 50),
(2, 'Smartphone', 599.99, 100),
(3, 'Tablet', 399.99, 75),
(4, 'Headphones', 199.99, 150),
(5, 'Smartwatch', 249.99, 80),
(6, 'Camera', 499.99, 40),
(7, 'Printer', 149.99, 60),
(8, 'Monitor', 299.99, 45),
(9, 'Keyboard', 49.99, 200),
(10, 'Mouse', 29.99, 300);

INSERT INTO Sales (SalesID, CustomerID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 1, 2, '2024-01-15'),
(2, 2, 2, 1, '2024-01-16'),
(3, 3, 3, 3, '2024-01-17'),
(4, 4, 4, 1, '2024-01-18'),
(5, 5, 5, 1, '2024-01-19'),
(6, 6, 6, 2, '2024-01-20'),
(7, 7, 7, 1, '2024-01-21'),
(8, 8, 8, 1, '2024-01-22'),
(9, 9, 9, 4, '2024-01-23'),
(10, 10, 10, 3, '2024-01-24');

select*from Customer;
select*from Product;
select*from Sales;

SELECT Sales.SalesID, Customer.CustomerName, Product.ProductName, Sales.Quantity, Sales.SaleDate
FROM Sales
INNER JOIN Customer ON Sales.CustomerID = Customer.CustomerID
INNER JOIN Product ON Sales.ProductID = Product.ProductID;

SELECT Customer.CustomerID, Customer.CustomerName, Sales.SalesID, Product.ProductName, Sales.Quantity
FROM Customer
LEFT JOIN Sales ON Customer.CustomerID = Sales.CustomerID
LEFT JOIN Product ON Sales.ProductID = Product.ProductID;

SELECT Product.ProductID, Product.ProductName, Sales.SalesID, Customer.CustomerName, Sales.Quantity
FROM Product
RIGHT JOIN Sales ON Product.ProductID = Sales.ProductID
RIGHT JOIN Customer ON Sales.CustomerID = Customer.CustomerID;

SELECT Customer.CustomerName, Product.ProductName, Sales.Quantity, Sales.SaleDate
FROM Sales
FULL OUTER JOIN Customer ON Sales.CustomerID = Customer.CustomerID
FULL OUTER JOIN Product ON Sales.ProductID = Product.ProductID;






