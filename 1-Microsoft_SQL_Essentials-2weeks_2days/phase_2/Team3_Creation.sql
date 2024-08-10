IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CompanyDB')
BEGIN
    CREATE DATABASE CompanyDB;
END
GO


IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'Staff')
BEGIN
    EXEC('CREATE SCHEMA Staff';);
END
GO


USE CompanyDB ;
GO

IF OBJECT_ID(N'Staff.CreateTables ' , N'P') IS NOT NULL
DROP PROCEDURE Staff.CreateTables;
go

CREATE PROCEDURE Staff.CreateTables 
AS 
BEGIN
IF OBJECT_ID(N'Staff.Employees' , N'U') IS NULL
    CREATE TABLE Staff.Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName  NVARCHAR(50) NOT NULL,                                      
    DepartmentID INT
    );

IF OBJECT_ID(N'Staff.Departments' , N'U') IS NULL
    CREATE TABLE Staff.Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100) NOT NULL,
    Location NVARCHAR(100)
    );

IF OBJECT_ID(N'Staff.Projects' , N'U') IS NULL
    CREATE TABLE Staff.Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName NVARCHAR(100),
    StartDate DATE,
    EndDate DATE ,
    Budget  MONEY
    );

IF OBJECT_ID(N'Staff.Assignments' , N'U') IS NULL
    CREATE TABLE Staff.Assignments (
    AssignmentID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    "Role" NVARCHAR(50),
    StartDate DATE,
    EndDate   DATE,
    );

END;
go 
