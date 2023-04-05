SELECT * FROM Categories; --(EX1.1)
SELECT ProductName, UnitPrice, UnitsInStock FROM Products; --(EX1.2)
SELECT ProductName, UnitPrice, UnitsInStock, UnitPrice*UnitsInStock AS StockValue FROM Products; --(Example 2.1)
SELECT ProductName AS Product, UnitPrice, UnitsInStock, UnitPrice * UnitsInStock AS StockValue FROM Products; --(EX2.1)
SELECT ProductName AS Product, UnitPrice, UnitsOnOrder, UnitPrice * UnitsOnOrder AS TotalValue FROM Products; --(EX2.2)
SELECT ProductName As Product, UnitsInStock, UnitsOnOrder, UnitsInStock+UnitsOnOrder As TotalUnits FROM Products; --(EX2.3)
SELECT ProductName, UnitsInStock+3 FROM Products; --(Example 2.4A)
SELECT ProductName, UnitPrice*0.2 FROM Products; --(Example 2.4B)
SELECT ProductName, UnitPrice / 5 FROM Products; --(EX2.4)
SELECT 7*8; --(EX2.5)
SELECT ProductName, UnitsInStock % 12 AS ProductsLeftOver FROM Products;--EX2.6
SELECT ProductName, (UnitsInStock + UnitsOnOrder) * UnitPrice AS TotalPrice FROM Products;--EX2.7
SELECT Address + City FROM Customers; --Example 2.8
SELECT ContactName, Address+','+City FROM Customers; --Ex2.8
SELECT ContactName, Address+ ', ' + City AS 'Name and Address' FROM Customers; --EX2.9
SELECT GetDate();
SELECT * FROM Orders;
--The IsNull() function takes two arguments. IsNull(ColumnName, Value) 
--This will choose the column name and return the value, below example returns blank
SELECT OrderID, ShipCity, IsNull(ShipRegion,'') AS ShipRegion, ShipCountry FROM Orders;
SELECT IsNull(null,0);
SELECT IsNull(1,0);
SELECT OrderID, ShipAddress + ', ' + ShipCity + ', ' + ShipPostalCode AS 'Order Address' FROM Orders; --EX2.10
SELECT OrderID, ShipCity + ',' + IsNull(ShipRegion, '') + ShipCountry AS 'Order Address' FROM Orders; --EX2.10 / EX2.11
SELECT * FROM Customers WHERE City = 'Berlin'; --EX3.1
SELECT ContactName, Phone FROM Customers WHERE City = 'Berlin';--EX3.2
SELECT CompanyName, City FROM Suppliers WHERE Country = 'Japan'; --EX3.3
SELECT CompanyName, City FROM Suppliers WHERE Country = 'India'; --EX3.4
SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInStock>=10; --EX3.5
SELECT ProductName, UnitPrice FROM Products WHERE UnitPrice>21.35; --EX3.5
SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInStock*UnitsOnOrder<100; --EX3.6
--The Like Function is used for exact matches for words
SELECT ProductName FROM Products WHERE ProductName LIKE '%P%';
SELECT HireDate FROM Employees WHERE HireDate >'1993-01-01';
--BETWEEN OPERATOR is used with AND
--BETWEEN will get you all the information between two rangers where the math operators won't
SELECT * FROM Orders WHERE OrderDate Between '1997-01-01' AND '1997-01-02';
SELECT * FROM Orders WHERE OrderDate >='1997-01-01' AND OrderDate<'1997-01-02';
SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInstock Between '10' AND '20'; --EX4.1A
SELECT ProductName, UnitsInStock FROM Products WHERE UnitsInstock >=10 AND UnitsInStock <20; --EX4.1B
SELECT * FROM Orders WHERE ShipCountry = 'Brazil' AND OrderDate >'1997-01-01'; --EX4.2
SELECT * FROM Orders WHERE ShipCountry = 'Brazil' AND OrderDate BETWEEN '1997-01-01' and '1998-01-01'; --EX4.3
SELECT * FROM Employees WHERE City='Seattle' OR Country = 'UK';
--Example from Excercise
SELECT * FROM Customers WHERE ContactTitle = 'Owner' AND (Country = 'USA' OR Country = 'Mexico'); -- Ex4.4
--<> means 'not equal to'
SELECT * FROM Customers WHERE Country <> 'USA'; --EX 4.5
SELECT * FROM Customers WHERE ContactTitle LIKE '%sales%' OR ContactTitle LIKE '%Marketing%'; --EX 4.6
SELECT * FROM Customers WHERE COUNTRY <> 'USA' AND (ContactTitle LIKE '%sales%' OR ContactTitle LIKE '%Marketing%'); --EX 4.6
--The <> operator applies to a single condition while NOT operator applies to multiple conditions
SELECT * FROM Customers WHERE Country <> 'USA' AND NOT (ContactTitle LIKE '%sales%' OR ContactTitle LIKE '%Marketing%'); --EX 4.7
SELECT * FROM Customers WHERE (Country <> 'USA' AND Country<> 'Mexico')AND NOT (ContactTitle LIKE '%sales%' OR ContactTitle LIKE '%Marketing%'); --EX 4.8
SELECT DISTINCT Country FROM Suppliers; --EX 5.1
SELECT * FROM Suppliers ORDER By SupplierID;
SELECT ProductName,CategoryID, UnitPrice FROM Products ORDER BY CategoryID, UnitPrice; --EX 6.1
SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice;--EX 7.1
SELECT SUM(UnitsInStock) FROM Products;
SELECT * FROM Products;
SELECT SUM(UnitsInStock) FROM Products WHERE Discontinued = 1; --EX7.1
SELECT SUM(UnitsInStock) FROM Products WHERE CategoryID = 1; --EX7.2
--GROUP BY must be used with another aggreate function
SELECT CategoryID, SUM(UnitsInStock) AS UnitsInStock FROM Products GROUP BY CategoryID;
SELECT SupplierID, SUM(UnitsOnOrder) AS UnitsOnOrder FROM Products GROUP By SupplierID; --EX8.3
SELECT SupplierID, SUM(UnitsOnOrder*UnitPrice) AS TotalValue FROM Products GROUP BY SupplierID;--EX8.4
SELECT CategoryID, MAX(UnitPrice) AS MaximumPrice FROM Products GROUP BY CategoryID; --EX8.5
SELECT SupplierID, MIN(UnitPrice) AS MinimumPrice FROM Products GROUP BY SupplierID; --EX8.6
SELECT CategoryID, COUNT(*) FROM Products GROUP BY CategoryID HAVING Count(*)<10;
SELECT CategoryID FROM Products GROUP BY CategoryID HAVING Count(*)<10;
SELECT CategoryID, UnitsInStock FROM Products ORDER BY CategoryID;
SELECT CategoryID, UnitsInStock FROM Products WHERE UnitsInStock > 100 ORDER BY CategoryID;
SELECT CategoryID, SUM(UnitsInStock) FROM Products GROUP BY CategoryID HAVING SUM(UnitsInStock)>100; --EX9.1
SELECT * FROM Products ORDER BY SupplierID;
SELECT SupplierID, COUNT(SupplierID) AS ProductDiversity FROM Products GROUP BY SupplierID HAVING COUNT(SupplierID) = 1;
SELECT SupplierID, COUNT(*) AS ProductDiversity From Products GROUP BY SupplierID HAVING Count(*) =1; --EX9.2
SELECT CategoryID, COUNT(UnitsOnOrder), SUM(UnitsOnOrder) FROM Products GROUP BY CategoryID HAVING SUM(UnitsOnOrder) =0; --EX9.3
SELECT * FROM Orders;
--The [] brackets will access a table with space its name
SELECT * FROM [Order Details];
SELECT OrderID, SUM(Quantity) FROM[Order Details] GROUP BY OrderID HAVING SUM(Quantity)<50;--EX9.4
SELECT OrderID, MAX(Discount) AS Discount FROM[Order Details] GROUP BY OrderID HAVING MAX(Discount) > 0.2; --EX9.5
SELECT OrderID, COUNT(*), SUM(Quantity) FROM [Order Details] GROUP BY OrderID;
SELECT OrderID, SUM(UnitPrice*Quantity) AS CashValue, SUM(Quantity) AS UnitCount FROM [Order Details] GROUP BY OrderID;

SELECT * FROM Region;
SELECT * FROM Territories;

SELECT * FROM Region
INNER JOIN Territories
ON Region.RegionID = Territories.RegionID

SELECT * FROM Region AS r
INNER JOIN Territories AS t
ON r.regionID = t.regionID;

SELECT * FROM Region r
INNER JOIN Territories t
ON r.regionID = t.regionID;

SELECT r.regionID, r.regionDescription, t.TerritoryDescription FROM
Region r
Inner Join Territories t
ON r.regionID = t.regionID
Order BY RegionID;


SELECT t.*, r.RegionDescription FROM Region r
INNER JOIN Territories t
ON r.regionID = t.regionID;

SELECT t.TerritoryDescription, r.* FROM Region r
INNER JOIN Territories t
ON r.regionID = t.regionID;

SELECT * FROM Products;
SELECT * FROM Categories;

--Calling out specific tables will be important because if you use the * clause it will show both tables combined into one
--This script will only call out Category Name from Categories and then all the columns from products
SELECT c.CategoryName, p.*
FROM Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;
--EX11.1

--This will stack categories table onto products table
SELECT * FROM Products p
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

SELECT * FROM Orders;
SELECT * FROM Customers;

SELECT o.OrderId,o.CustomerID, c.CompanyName
FROM Orders o
INNER JOIN Customers c
ON o.CustomerId = c.CustomerId;
--EX11.2

SELECT * FROM Products;
SELECT * FROM Suppliers;

-----------------------
SELECT p.SupplierID, s.CompanyName, SUM(p.UnitsOnOrder) AS TotalUnitsOnOrder 
FROM Products p 
INNER JOIN Suppliers s
ON p.SupplierId = s.SupplierID
GROUP BY p.SupplierId, s.CompanyName
ORDER BY p.SupplierId, TotalUnitsOnOrder DESC;
--EX11.3 except that I went a little extra on this code


SELECT * FROM Categories;
SELECT * FROM Products;

--Just remember that the select name and the group by name must always be the same
SELECT c.CategoryName, MAX(p.UnitPrice) AS MaxPrice
FROM Products p
INNER JOIN Categories c
ON p.CategoryId = c.CategoryID
GROUP BY c.CategoryName
ORDER BY MaxPrice;
--EX11.4

SELECT DISTINCT CompanyName FROM Customers c
INNER JOIN Orders o
ON c.CustomerId = o.CustomerId;
--EX12.1

SELECT * FROM Customers c
LEFT OUTER JOIN Orders o
ON c.CustomerId = o.CustomerId;

SELECT * FROM Customers c
LEFT OUTER JOIN Orders o
ON c.CustomerId = o.CustomerId
WHERE o.CustomerID IS NULL;

SELECT * FROM Orders o
RIGHT OUTER JOIN Customers c
ON c.CustomerId = o.CustomerId
WHERE o.CustomerID IS NULL;


SELECT * FROM Orders o
LEFT OUTER JOIN Customers c
ON c.CustomerId = o.CustomerId
WHERE c.CustomerID IS NULL;

SELECT * FROM EmployeeTerritories;
SELECT * FROM Territories;

SELECT * FROM Territories t
LEFT JOIN EmployeeTerritories et
ON t.TerritoryID = et.TerritoryID;
--EX 12.2

SELECT * FROM territories t
LEFT JOIN EmployeeTerritories et
ON t.TerritoryID = et.TerritoryID
WHERE et.EmployeeID IS NULL;
--EX12.3

--This quere would be a problem because it show all the data and slow down the execution, use an inner join to avoid all nulls.
--Inner joins will avoid all nulls
SELECT * FROM territories t
LEFT JOIN EmployeeTerritories et
ON t.TerritoryID = et.TerritoryID
WHERE et.EmployeeID IS NOT NULL;
--EX12.4

SELECT * FROM Territories t
INNER JOIN EmployeeTerritories et
ON t.TerritoryID = et.TerritoryID;
--EX12.4 but this uses inner join to show that execution matters

SELECT * FROM EmployeeTerritories;
SELECT * FROM Territories;
SELECT * FROM Employees;

SELECT LastName, FirstName, e.EmployeeID, TerritoryDescription FROM Employees e
INNER JOIN EmployeeTerritories et
ON e.EmployeeID = et.EmployeeID
INNER JOIN Territories t
ON et.TerritoryID = t.TerritoryID;
--EX12.5

SELECT staff.FirstName + ' ' + staff.LastName AS Staff,
boss.FirstName + ' ' + boss.LastName AS Boss
FROM Employees staff
INNER JOIN Employees boss
ON staff.ReportsTo = boss.EmployeeID;

SELECT staff.FirstName + ' ' + staff.LastName AS Staff,
boss.FirstName + ' ' + boss.LastName AS Boss
FROM Employees staff
LEFT OUTER JOIN Employees boss
ON staff.ReportsTo = boss.EmployeeID;
--EX13.1

SELECT CompanyName FROM Suppliers
UNION ALL
SELECT CompanyName FROM Customers;

SELECT * FROM Suppliers;


--UNION ALL also includes duplicates
SELECT CompanyName, 'Supplier' AS CompanyType, Country, City
FROM Suppliers
UNION ALL
SELECT CompanyName, 'Customer', Country, City
FROM Customers;
--EX15.1

SELECT Country FROM Suppliers
UNION ALL
SELECT Country FROM Customers;

SELECT Country, 'Supplier' FROM Suppliers
UNION 
SELECT Country, 'Customer' FROM Customers;

---INTERSECT will return rows that are only in both tables
SELECT Country FROM Customers
INTERESECT
SELECT Country FROM Suppliers;

--EXCEPT will only get rows in one table

SELECT Country FROM Customers
EXCEPT
SELECT Country FROM Suppliers;


--This script returns tables
SELECT Name
FROM Sys.Tables
WHERE Name LIKE '%DEMO%';

SELECT Name
FROM Sys.Views
WHERE Name Like '%Product%';
--Ex18.1

SELECT ProductName, UnitsInStock*UnitPrice AS StockValue
FROM Products;

SELECT * FROM(
	SELECT ProductName, UnitsInStock*UnitPrice AS StockValue
	FROM Products
	)
	sq
	WHERE sq.StockValue >= 1000;


--Subqueries will run first and then outside will run next
--Basically run inside then outside
SELECT SUM(StockValue) FROM(
	SELECT ProductName, UnitsInStock*UnitPrice AS StockValue
	FROM Products
	)
	sq
	WHERE sq.StockValue >= 1000;
--EX19.1

SELECT * FROM
(
SELECT CompanyName, 'Supplier' AS CompanyType, City, Country
FROM Suppliers
UNION ALL
SELECT CompanyName, 'Customer', City, Country
FROM Customers
) sq
ORDER BY sq.Country, sq.City;

--EX19.2

SELECT SupplierID, CompanyName, Country
FROM Suppliers
WHERE Country IN ('UK', 'USA');

SELECT SupplierID, CompanyName, Country
FROM Suppliers
WHERE Country NOT IN ('UK', 'USA');

SELECT ProductName
FROM Products
WHERE SupplierID IN
(
SELECT SupplierID
FROM Suppliers
WHERE Country = 'UK'
);

SELECT * FROM Products;
SELECT * FROM Suppliers;

SELECT *
FROM Products
WHERE SupplierID IN
(
SELECT SupplierID
FROM Suppliers
WHERE Country IN ('UK','USA')
);

--EX 19.3

SELECT *
FROM Products
WHERE CategoryID IN
(
SELECT CategoryID
FROM Categories
WHERE CategoryName NOT IN ('Seafood', 'Meat/Poutry')
);
--EX 19.4

SELECT *
FROM Products
WHERE UnitPrice >= ALL
(
SELECT UnitPrice
FROM Products
);

SELECT *
FROM Products
WHERE UnitPrice =
(
SELECT MAX(UnitPrice)
FROM Products
);

SELECT *
FROM Products
WHERE UnitPrice <= ALL
(
SELECT UnitPrice
FROM Products
);

SELECT *
FROM Products
WHERE UnitPrice < ANY
(
SELECT UnitPrice
FROM Products
);
