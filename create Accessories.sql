CREATE TABLE Accessories (
    AccessoryId int IDENTITY(1,1) PRIMARY KEY NOT NULL ,
    AccessoryName NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(1000) NULL, 
    AvailabilityId int NOT NULL
)
