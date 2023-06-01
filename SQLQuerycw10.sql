USE AdventureWorks2022


--1
BEGIN TRANSACTION Trans1;

UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 680;

COMMIT TRANSACTION Trans1;

SELECT * FROM Production.Product WHERE
ProductID = 680

--2
BEGIN TRANSACTION;

DELETE FROM Production.Product
WHERE ProductID = 707;

ROLLBACK TRANSACTION;

SELECT * FROM Production.Product WHERE ProductID = 707;

--3

BEGIN TRANSACTION;

	INSERT INTO Production.Product(rowguid)
	VALUES(NEWID());

	INSERT INTO Production.Product(Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate) --niby b³¹d przy name ale sie dodaje :s
	VALUES('Neues Produkt', 'DEU-2137', 0, 0, 1000, 750, '10.00', '15.00', 1, '2023-06-01')

COMMIT TRANSACTION;

SELECT * FROM Production.Product WHERE Name = 'Neues Produkt'

--4

BEGIN TRANSACTION 
UPDATE Production.Product SET StandardCost = StandardCost * 1.1
IF(SELECT SUM(StandardCost) FROM Production.Product) <=50000
	COMMIT TRANSACTION 
ELSE
	ROLLBACK TRANSACTION


--5

BEGIN TRANSACTION
	INSERT INTO Production.Product(rowguid)
	VALUES(NEWID());
	INSERT INTO Production.Product(Name, ProductNumber, MakeFlag, FinishedGoodsFlag, SafetyStockLevel, ReorderPoint, StandardCost, ListPrice, DaysToManufacture, SellStartDate)
	VALUES('Produkt aus Danzig', 'DEU-420',  0, 0, 1000, 750, '20.00', '25.00', 1, '2023-06-01')
	IF EXISTS(SELECT COUNT(ProductNumber) FROM Production.Product GROUP BY ProductNumber HAVING COUNT(ProductNumber) > 1)
BEGIN ROLLBACK
PRINT 'Transakcja zostala odrzucona'
END
	ELSE
COMMIT;

SELECT * FROM Production.Product WHERE Name = 'Produkt aus Danzig';

--6

BEGIN TRANSACTION;

IF EXISTS (
    SELECT 1 FROM Sales.SalesOrderDetail WHERE OrderQty = 0
)
BEGIN
    ROLLBACK TRANSACTION;
END
ELSE
BEGIN
    UPDATE Sales.SalesOrderDetail
    SET OrderQty = OrderQty + 1;

    COMMIT TRANSACTION;
END

SELECT * FROM Sales.SalesOrderDetail where OrderQty = 1
--7

SELECT * FROM Production.Product

BEGIN TRANSACTION TRAN7
DECLARE
	@avg INT = (SELECT AVG(ListPrice) FROM Production.Product),
	@a INT = (SELECT COUNT(*) FROM Production.Product)
DELETE FROM Production.Product WHERE StandardCost> @avg
DECLARE
@b INT = (SELECT COUNT(*) FROM Production.Product)

IF @a - 10 < @b
	ROLLBACK TRANSACTION
ELSE
	COMMIT TRANSACTION


