use CompanyDB
GO

IF OBJECT_ID(N'Staff.InsertDataFromAnotherDatabase ' , N'P') IS NOT NULL
DROP PROCEDURE Staff.InsertDataFromAnotherDatabase;
go

CREATE PROCEDURE Staff.InsertDataFromAnotherDatabase 
AS 
BEGIN
    -- Assuming SourceDB is already linked and accessible
    INSERT INTO Staff.Employees (EmployeeID, FirstName, LastName, DepartmentID)
    SELECT EmployeeID, FirstName, LastName, DepartmentID
    FROM SourceDB.dbo.Employees;

    INSERT INTO Staff.Departments (DepartmentID, DepartmentName)
    SELECT DepartmentID, DepartmentName
    FROM SourceDB.dbo.Departments;

    INSERT INTO Staff.Projects (ProjectID, ProjectName)
    SELECT ProjectID, ProjectName
    FROM SourceDB.dbo.Projects;

    INSERT INTO Staff.Assignments (AssignmentID, EmployeeID, ProjectID, "Role", StartDate, EndDate)
    SELECT AssignmentID, EmployeeID, ProjectID, "Role", StartDate, EndDate
    FROM SourceDB.dbo.Assignments;
END;
GO


