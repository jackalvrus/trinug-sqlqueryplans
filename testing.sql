use AdventureWorks2017


select * from Person.Person
select * from Person.Person where LastName between 'a' and 'b'


select LastName, FirstName, MiddleName from Person.Person 


select LastName, FirstName, MiddleName from Person.Person 
where BusinessEntityID = 33


select LastName, FirstName, MiddleName from Person.Person 
where Title = 'Mr.'


select * from Person.Person p
left join Person.EmailAddress a on a.BusinessEntityID = p.BusinessEntityID
where p.BusinessEntityID = 33


select * from Person.Person p
left join Person.EmailAddress a on a.BusinessEntityID = p.BusinessEntityID
where LastName = 'Smith'


select * from Person.Person p
left join Person.EmailAddress2 a on a.BusinessEntityID = p.BusinessEntityID
where LastName = 'Smith'



select * from Person.BusinessEntityAddress
select *, LEAD(AddressId) over (order by BusinessEntityId) x from Person.BusinessEntityAddress

select * from Person.Person
select * from Person.EmailAddress
select * from Production.TransactionHistory
select * from Sales.SalesOrderHeader
select * from Sales.SalesOrderDetail
select * from Sales.vSalesPersonSalesByFiscalYears

select top 100 * from Sales.SalesOrderDetail cross join Production.TransactionHistory
order by ActualCost desc, UnitPrice asc

--JACK: this has a recommended index with product 707
select * from Sales.SalesOrderHeader h
inner join Sales.SalesOrderDetail d on d.SalesOrderID = h.SalesOrderID
where d.ProductID = 911

select productid, count(*) from sales.SalesOrderDetail group by ProductID order by count(*)

SELECT
s.Name AS SchemaName,
t.Name AS TableName,
p.rows AS RowCounts,
CAST(ROUND((SUM(a.used_pages) / 128.00), 2) AS NUMERIC(36, 2)) AS Used_MB,
CAST(ROUND((SUM(a.total_pages) - SUM(a.used_pages)) / 128.00, 2) AS NUMERIC(36, 2)) AS Unused_MB,
CAST(ROUND((SUM(a.total_pages) / 128.00), 2) AS NUMERIC(36, 2)) AS Total_MB
FROM sys.tables t
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
GROUP BY t.Name, s.Name, p.Rows
ORDER BY p.rows desc



select (TABLE_SCHEMA + '.' + TABLE_NAME) as full_table from INFORMATION_SCHEMA.TABLES where TABLE_CATALOG = 'AdventureWorks2017' and TABLE_TYPE = 'BASE TABLE'