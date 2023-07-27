--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
SELECT*
FROM Sales.Customer 
GO

----------------------ЗАДАНИЕ №2-----------------------------
SELECT*
FROM Sales.Store
ORDER BY Name
GO

----------------------ЗАДАНИЕ №3-----------------------------
SELECT TOP 10 *
FROM HumanResources.Employee
WHERE BirthDate > '1989-09-28'
GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию

SELECT NationalIDNumber, LoginID, JobTitle
FROM HumanResources.Employee
WHERE LoginID like '%0'
ORDER BY JobTitle DESC
GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------
SELECT*
FROM Person.Person
WHERE ModifiedDate<'2009-01-01' AND ModifiedDate>'2008-01-01' AND Title IS NULL
GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT Name

FROM HumanResources.EmployeeDepartmentHistory,HumanResources.Department
WHERE EndDate IS NOT NULL
GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
----------------
SELECT product.TerritoryID, COUNT(*) as 'CommissionPct' 
FROM  Sales.SalesPerson as product
INNER JOIN Sales.SalesPerson as Persen
ON product.TerritoryID=Persen.TerritoryID
GROUP BY product.TerritoryID
HAVING COUNT(*) > 0

GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------

SELECT *
FROM HumanResources.Employee
WHERE HumanResources.Employee.VacationHours = (SELECT MAX(HumanResources.Employee.VacationHours) FROM HumanResources.Employee )
GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee
WHERE HumanResources.Employee.JobTitle='Network Administrator' OR HumanResources.Employee.JobTitle='Network Manager' OR HumanResources.Employee.JobTitle='Sales Representative'
GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee
FULL JOIN Purchasing.PurchaseOrderHeader
ON EmployeeID=BusinessEntityID
GO