CREATE VIEW dbo.vw_Accessory_Instock AS 
SELECT 
    A.AccessoryName,
    A.Description,
    AV.AvailabilityStatus
FROM 
    Accessories A
JOIN 
    Availability AV ON A.AvailabilityId = AV.AvailabilityId
WHERE 
    AV.AvailabilityStatus = 'In Stock';  
	GO