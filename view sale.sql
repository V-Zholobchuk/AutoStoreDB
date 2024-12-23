
CREATE VIEW dbo.vw_sale_date AS 

SELECT 
    S.SaleId,
    S.SaleDate,
    P.FirstName AS ClientFirstName,
    P.LastName AS ClientLastName,
    E.FirstName AS EmployeeFirstName,
    E.LastName AS EmployeeLastName
FROM 
    Sales S
JOIN 
    Client C ON S.ClientId = C.ClientId
JOIN 
    People P ON C.PersonId = P.PersonId
JOIN 
    Employee Em ON S.EmployeeId = Em.EmployeeId
JOIN 
    People E ON Em.PersonId = E.PersonId;
	GO