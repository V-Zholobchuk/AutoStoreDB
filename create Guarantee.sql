CREATE TABLE Guarantee(
    GuaranteeId INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
    ProductId INT NOT NULL,
    GuaranteePeriod INT NULL, 
    GuaranteeDetails NVARCHAR(1000) NULL
)
ALTER TABLE Guarantee
ADD GuaranteeStartDate DATETIME NULL;
