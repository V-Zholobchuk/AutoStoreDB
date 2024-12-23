CREATE TABLE Sales (
    SaleId INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
    ProductId INT NOT NULL, 
    ClientId INT NOT NULL, 
    EmployeeId INT NOT NULL, 
    SaleDate DATETIME NOT NULL, 
    PriceId INT NOT NULL,
	DiscountsId INT NULL,
	GuaranteeId int NULL
	)