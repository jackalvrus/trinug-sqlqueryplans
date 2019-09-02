SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Person].[EmailAddress2](
	[BusinessEntityID] [int] NOT NULL,
	[EmailAddressID] [int] IDENTITY(1,1) NOT NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL CONSTRAINT [DF_EmailAddress2_rowguid] DEFAULT (newid()) NOT NULL,
	[ModifiedDate] [datetime] CONSTRAINT [DF_EmailAddress2_ModifiedDate] DEFAULT (getdate()) NOT NULL,
	CONSTRAINT [PK_EmailAddress2_BusinessEntityID_EmailAddressID] PRIMARY KEY CLUSTERED 
	(
		[EmailAddressID] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT [FK_EmailAddress2_Person_BusinessEntityID] FOREIGN KEY([BusinessEntityID])
	REFERENCES [Person].[Person] ([BusinessEntityID])
) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_EmailAddress2_EmailAddress] ON [Person].[EmailAddress2]
(
	[EmailAddress] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

/*
CREATE NONCLUSTERED INDEX [IX_EmailAddress2_BusinessEntityID] ON [Person].[EmailAddress2]
(
	[BusinessEntityID] ASC
) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
*/

insert into Person.EmailAddress2 (BusinessEntityID, EmailAddress, rowguid, ModifiedDate)
select BusinessEntityID, EmailAddress, rowguid, ModifiedDate from Person.EmailAddress
GO
