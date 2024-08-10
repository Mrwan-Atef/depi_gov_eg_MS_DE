CREATE PROCEDURE Staff.CreateSpecificViews
AS
BEGIN
    -- Create view EmployeeProjectAssignments
    DECLARE @sql NVARCHAR(MAX);
    SET @sql = '
    CREATE VIEW EmployeeProjectAssignments AS
    SELECT 
        CONCAT(E.FirstName, '' '', E.LastName) AS EmployeeName,
        D.DepartmentName,
        P.ProjectName,
        A.Role,
        DATEDIFF(DAY, A.StartDate, A.EndDate) AS AssignmentDuration
    FROM 
        staff.Employees E
    JOIN 
        staff.Departments D ON E.DepartmentID = D.DepartmentID
    JOIN 
        staff.Assignments A ON E.EmployeeID = A.EmployeeID
    JOIN 
        staff.Projects P ON A.ProjectID = P.ProjectID;
    ';
    
    EXEC sp_executesql @sql;

    -- Verify the newly created view
   
END;


drop PROCEDURE CreateSpecificViews