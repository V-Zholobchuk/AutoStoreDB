DECLARE @NewEmployeeId INT;

EXEC dbo.sp_SetEmployee
    @PersonId = 5,           
    @Position = 'Manager',    
    @HireDate = '2024-01-01'
Select * From dbo.Employee
Select * From dbo.People
Select * From dbo.Client

EXEC dbo.sp_SetEmployee
    @EmployeeId = 3,           
    @Position = 'Senior Manager'
Select * From dbo.Employee
    