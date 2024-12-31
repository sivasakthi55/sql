use sivasakthi;
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL
);
INSERT INTO Categories (CategoryID, CategoryName) VALUES (1, 'Beverages');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (2, 'Dairy');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (3, 'Snacks');
INSERT INTO Categories (CategoryID, CategoryName) VALUES (4, 'Produce');

CREATE TABLE Products1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

INSERT INTO Products1 (ProductID, ProductName, CategoryID, Price, Stock) VALUES (1, 'Milk', 2, 1.50, 100);
INSERT INTO Products1 (ProductID, ProductName, CategoryID, Price, Stock) VALUES (2, 'Orange Juice', 1, 2.00, 50);
INSERT INTO Products1 (ProductID, ProductName, CategoryID, Price, Stock) VALUES (3, 'Chips', 3, 1.20, 200);
INSERT INTO Products1 (ProductID, ProductName, CategoryID, Price, Stock) VALUES (4, 'Bananas', 4, 0.50, 150);

CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

INSERT INTO Customers1 (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St');
INSERT INTO Customers1 (CustomerID, FirstName, LastName, Email, PhoneNumber, Address) VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '456 Elm St');

CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Orders1 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES (1, 1, '2024-11-13', 5.50);
INSERT INTO Orders1 (OrderID, CustomerID, OrderDate, TotalAmount) VALUES (2, 2, '2024-11-13', 3.00);

select * from Categories;
select * from products1;
select * from customers1;
select * from orders1;


1. Find Products with Stock Less Than 100

	select productname,stock from products where stock<100;

2.Display the categories and the number of products available in each category (using a subquery):

	SELECT CategoryName, (SELECT COUNT(*) FROM Products  WHERE Products.CategoryID = Categories.CatqegoryID)AS ProductCount FROM Categories;

3.Select all orders placed by a specific customer (for example, CustomerID = 1):

		select orderid,orderdate,totalamount from orders where customerid=1;

4.Find all products in the 'Dairy' category

		select Productname from products where CategoryID in (select CategoryID from Categories where CategoryName='dairy');

5.Select products whose names contain the word 'Juice':

		select productname,price from products where productname like '%juice%';

6.Find all customers who do not have a phone number listed:

		select firstname,lastname from customers where PhoneNumber is null;

7.Display the total amount of all orders placed by a customer with a given CustomerID (e.g., CustomerID = 2):

		select sum(totalamount)from orders where customerid=2;

8.Find the name of the category of the product 'Milk':

		select categoryname from Categories where CategoryID = (select CategoryID from products where productname='milk');

9.Retrieve the product(s) with the highest price:

		select productname ,(price) from products where price=(select max(price) from products);

10.List products that belong to the same category as the product 'Orange Juice':

		select productname from products where CategoryID=(select CategoryID from products where ProductName='orange juice');

11.Select customers who have not placed any orders 

		select customerid,firstname from customers where customerid not in (select customerid from orders );

12.Find products that have a stock lower than the average stock of all products:

		select productname,stock from products where stock<(select avg(stock) from products);

13.Retrieve the name of the customer who placed the order with the highest total amount:

		select firstname ,lastname from customers where CustomerID= (select customerid from orders where totalamount= (select max(totalamount) from orders));

14.Find all products that are priced higher than the average price of products in the 'Snacks' category:

		select productname,price from Products where price > (select avg (price) from products where CategoryID in (select CategoryID from Categories where CategoryName='snacks'))

15.List the names of customers who have an order with a total amount greater than $5.00:

		select firstname,lastname from customers where CustomerID in (select CustomerID from orders where TotalAmount>5);

16.Select products whose price is above the overall average price of all products:

		select productname from products where price>(select avg(price) from products);

17.Find products that belong to the same category as any product priced over $1.00:

		select productname from products where CategoryID in (select CategoryID from products where price>1);

		
select * from Categories;
select * from products1;
select * from customers1;
select * from orders1;

1.Total Stock by Category, Ordered by Total Stock in Descending Orde

		select Categories.CategoryName,SUM(products1.stock)as total_stock 
		from Products1
		join Categories on Categories.CategoryID=Products1.CategoryID
		group by Categories.CategoryName order by total_stock desc;

2.Average Price of Products by Category, Ordered by Average Price in Ascending Order

		select c.categoryname , AVG(p.price)as avg_price 
		from Products1 p 
		join Categories c on c.CategoryID=p.CategoryID
		group by c.CategoryName order by avg_price asc;

3.Total Revenue by Customer, Ordered by Revenue in Descending Order

		select CONCAT(c.firstname,c.lastname)as customername ,SUM(o.totalamount)as totalrevenue 
		from Customers1 c
		join Orders1 o on  o.customerid=c.CustomerID
		group by c.firstname,c.lastname
		order by totalrevenue desc;

4.Count Products in Each Category with Price Greater Than 1.00
		
       select c.categoryname , COUNT(p.productname)as totalproducts 
	   from Products1 p
	   join Categories c on c.CategoryID=p.CategoryID
	   where p.price>1.00
	   group by c.CategoryName 
	   
5.Top 3 Most Expensive Products

	select top 3 productname , price from Products1 order by Price desc;

6.Daily Order Count, Sorted by Most Recent Date

		select orderdate , count(orderid)as ordercount from Orders1 group by OrderDate order by OrderDate desc;


