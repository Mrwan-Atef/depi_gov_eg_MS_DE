IF OBJECT_ID(N'Staff.RunAllSetupProcedures ' , N'P') IS NULL
 BEGIN
     EXEC('CREATE PROCEDURE Staff.RunAllSetupProcedures
         AS
         BEGIN 
         EXEC Staff.CreateTables;
         EXEC Staff.CreateConstraintsAndRelationships;
         EXEC Staff.InsertDataFromAnotherDatabase;
         EXEC Staff.PerformQueryTasks;
         EXEC Staff.CreateViews;
         EXEC Staff.CreateSpecificViews;  
         END; '); 
    END