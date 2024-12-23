SELECT 
    G.GuaranteeId,
    P.ProductName,
    G.GuaranteePeriod,
    G.GuaranteeDetails
FROM 
    Guarantee G
JOIN 
    Product P ON G.ProductId = P.ProductId;
