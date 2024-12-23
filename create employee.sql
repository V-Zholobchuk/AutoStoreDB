CREATE TABLE Employee (
    EmployeeId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    PersonId int NOT NULL,
    Position NVARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
)
