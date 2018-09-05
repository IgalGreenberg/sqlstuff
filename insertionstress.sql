create database [inserttest]
GO

USE [inserttest]
GO

drop table if exists dbo.t1;
go

create table dbo.t1(col1 int identity(0,1), charcol varchar(255))
GO

--this one just runs indefinitely 
declare @c int = 0

while 0 <> 1
begin
	INSERT INTO [dbo].[t1]([charcol])
	VALUES ('test data')
end
GO

--insert 1000 rows
declare @c int = 0

while @c < 1000
begin
	INSERT INTO [dbo].[t1]([charcol])
	VALUES ('test data')
	set @c = @c + 1
end
GO

--insert a doubling number of rows - this will bring down any server very quickly - take care
declare @c int = 0

delete from dbo.t1;
INSERT INTO [dbo].[t1]([charcol]) VALUES ('test data'); --seed record

while @c < 20
begin
	INSERT INTO [dbo].[t1]([charcol])
	select charcol from dbo.t1;
	set @c = @c + 1
end
GO
