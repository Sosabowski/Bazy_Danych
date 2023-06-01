USE AdventureWorks2022
CREATE FUNCTION fib(@i INT)
RETURNS @wynik TABLE(Numer INT,Fibonacci INT)
AS
BEGIN
	DECLARE
	@i0 INT	= 0,
	@i1 INT  = 1,
	@id1 INT = 1,
	@id2 INT = 2,
	@rep INT = 0,
	@tmp INT
	INSERT INTO @wynik VALUES(@id1,@i0),(@id2,@i1)
	WHILE(@rep < @i-2)
	BEGIN
	INSERT INTO @WYNIK VALUES(@id2+1,@i1+@i0)
		SET @tmp = @i1
		SET @i1 = @i1 + @i0
		SET @i0 = @tmp
		SET @rep +=1
		SET @id2 +=1
	END	
	RETURN 
END;

--
CREATE PROCEDURE fibonaprint(@n INT)
AS
BEGIN
SELECT * FROM fib(@n)
WHERE Numer = @n
END;
--
EXEC fibonaprint 25;


--2.
Select * from Person.Person
select * from person.BusinessEntity
CREATE TRIGGER tr1
	ON person.person 
	AFTER INSERT 
	AS 
		BEGIN
			UPDATE Person.Person  
			SET Person.LastName = UPPER(Person.LastName)
		END;

INSERT INTO  Person.BusinessEntity (rowguid) VALUES (NEWID());
INSERT INTO Person.Person(BusinessEntityID,PersonType,NameStyle,FirstName,MiddleName,LastName,EmailPromotion,ModifiedDate) 
VALUES (20778,'IN',0,'Wiktor','Adam','Salwa',2,2009-01-07);

--3.
CREATE TRIGGER taxRateMonitoring
	ON Sales.SalesTaxRate
	AFTER UPDATE
	AS
		BEGIN
			DECLARE @NewTaxRate int, @TaxRate int
			SELECT @NewTaxRate = TaxRate FROM inserted
			SELECT @TaxRate = TaxRate FROM deleted
			IF @NewTaxRate > 1.3* @TaxRate
			PRINT 'Przesadzono z podatkiem!'
			END

SELECT * FROM Sales.SalesTaxRate;



UPDATE Sales.SalesTaxRate 
SET TaxRate =  76.00
WHERE SalesTaxRateID = 23;