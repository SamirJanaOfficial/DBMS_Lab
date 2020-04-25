ASSIGNMENT - 6


CREATION :

Create table Customers(CustomerID Number(1),CustomerName varchar2(20),ContactName Varchar2(20),Address Varchar2(20), City Varchar2(20), PostalCode Number(5), Country Varchar2(20));

Desc Customers;

Insertion:

SQL> Insert into Customers values(1,'Alfreds Futter','Maria Anders','Obere Str. 57','Berlin','Germany');

SQL> insert into Customers values(2,'Ana helados','Ana Trujillo','Avda. de la Constitución 2222','México D.F.','Mexico');

SQL> insert into Customers values(3,'Antonio Moreno','Antonio Moreno','Mataderos 2312','México D.F.','Mexico');

...


Create table Suppliers(SupplierID Number(1),SupplierName varchar2(20),ContactName Varchar2(20),Address Varchar2(20), City Varchar2(20), PostalCode Number(5), Country Varchar2(20));

Desc Suppliers;

Insertion:

SQL> Insert into Suppliers values(1,'Exotic Liquid','Charlotte Cooper','49 Gilbert St.','London',12209,'Germany');

SQL> insert into Suppliers values(2,'New Orleans Cajun Delights	','Shelley Burke','P.O. Box 78934','Mexico D.F.',05023,'Mexico');

SQL> insert into Suppliers values(3,'Grandma Kelly's Homestead','Regina Murphy','707 Oxford Rd.','Ann Arbor',48104,'USA');


QUERIES :

1. SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

2. SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

3. SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

4. SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

