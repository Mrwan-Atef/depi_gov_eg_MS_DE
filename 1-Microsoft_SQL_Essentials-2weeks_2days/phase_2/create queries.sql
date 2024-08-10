USE CompanyDB
GO

CREATE PROCEDURE Staff.PerformQueryTasks
AS
BEGIN
-- get employees table
select * from staff.employees


-- get projects table
SELECT * from staff.Projects

-- get employee info
select * from staff.Employees

-- get department info
select * from staff.Departments

-- a summary of employees' names and positions within each department

select 
FirstName + ' ' + LastName as full_name,
DepartmentName
from staff.Employees e 
join staff.Departments d
on e.DepartmentID = d.DepartmentID


-- retrieve info about  empolyees and their assigned assignments
select 
FirstName + ' ' + LastName as full_name,
StartDate,
EndDate
from staff.Employees e
join staff.Assignments a
on e.EmployeeID = a.EmployeeID
where EndDate is not null
ORDER by StartDate DESC


-- get employees who are assgined to multible assignments
SELECT 
e.FirstName,
e.LastName,
COUNT(DISTINCT a.ProjectID) AS NumProjectsAssigned
FROM staff.Employees e
JOIN staff.Assignments a 
ON e.EmployeeID = a.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(DISTINCT a.ProjectID) > 1;


-- the project names in each department along with the count of projects in each department

SELECT 
d.DepartmentName,
COUNT(DISTINCT p.ProjectID) AS NumProjects
FROM staff.Projects p
JOIN staff.Assignments a 
ON p.ProjectID = a.ProjectID
JOIN staff.Employees e 
ON a.EmployeeID = e.EmployeeID
JOIN staff.Departments d 
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

END;
go


-- Retrieve Employees and Their Current Projects

go

