

--1)
WITH zad1 
AS
(
	SELECT LoginID, JobTitle, BirthDate, Gender FROM AdventureWorks2022.HumanResources.Employee AS em
	JOIN AdventureWorks2022.HumanResources.EmployeePayHistory AS pe
	ON em.BusinessEntityID = pe.BusinessEntityID
)
SELECT * INTO #TempEmployeeInfo FROM zad1;

SELECT * FROM #TempEmployeeInfo;




-- 2)
WITH zad2 
AS
(
	SELECT concat(CompanyName, ' (', FirstName, LastName, ')') AS CompanyConcat, TotalDue AS Revenue 
	FROM AdventureWorksLT2022.SalesLT.Customer AS Cust
	JOIN AdventureWorksLT2022.SalesLT.SalesOrderHeader AS SalHe
	ON Cust.CustomerID = SalHe.CustomerID
)
SELECT * FROM zad2
ORDER BY CompanyConcat;



-- 3)
WITH zad3 
AS
(
SELECT cat.Name AS Category, LineTotal AS SalesValue FROM AdventureWorksLT2022.SalesLT.Product AS pro
JOIN AdventureWorksLT2022.SalesLT.ProductCategory AS cat
ON pro.ProductCategoryID = cat.ProductCategoryID
JOIN AdventureWorksLT2022.SalesLT.SalesOrderDetail AS sal
ON pro.ProductID = sal.ProductID
)
SELECT Category, ROUND(SUM(SalesValue),2) AS SalesValue FROM zad3
GROUP BY Category
ORDER BY Category;
