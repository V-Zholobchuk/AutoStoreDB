CREATE TABLE Discounts (
    DiscountsId INT IDENTITY(1,1) PRIMARY KEY NOT NULL ,
    ProductId INT NOT NULL, 
    DiscountsPercentage DECIMAL(5, 2) NOT NULL, 
    DiscountsStart DATETIME NOT NULL, 
   DiscountsEnd DATETIME NOT NULL
)
