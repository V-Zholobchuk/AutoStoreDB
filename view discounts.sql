CREATE VIEW dbo.vw_Discounts_Product AS 
SELECT 
    D.DiscountsId,
    D.DiscountsPercentage,
    D.DiscountsStart,
    D.DiscountsEnd,
    P.ProductName
FROM 
    Discounts D
JOIN 
    Product P ON D.ProductId = P.ProductId
WHERE 
    D.DiscountsEnd > GETDATE(); 
	GO