use AdventureWorks2017


select current_timestamp


select * from Person.Person
select * from Person.EmailAddress


select * from Sales.SalesOrderDetail


select * from Person.Person 
where BusinessEntityID = 33


DBCC DROPCLEANBUFFERS


select * from Person.Person p
left join Person.EmailAddress a on a.BusinessEntityID = p.BusinessEntityID


select * from Person.Person 
where LastName = 'Smith' and Title = 'Mr.'


insert into Person.Person (
	BusinessEntityID, PersonType, Title, FirstName, LastName
) values (
	123, 'IN', 'Mr.', 'Jack', 'Alvrus'
)


update Person.PersonPhone
set PhoneNumberTypeID = 33
where BusinessEntityID = 123


delete from Person.BusinessEntity
where BusinessEntityID = 123


select * from HumanResources.vEmployee


DBCC FREEPROCCACHE


select * from Person.Person p
left join Person.EmailAddress2 a on a.BusinessEntityID = p.BusinessEntityID
where LastName = 'Smith'

