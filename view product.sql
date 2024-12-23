CREATE VIEW dbo.vw_Product_Instock AS 
SELECT 
    P.ProductName, 
    M.MarkaName, 
    MD.ModelName, 
    CT.TypeName AS CarType, 
    C.NameColor AS Color, 
    ET.EngineTypeName, 
    T.TransmissionType, 
    AV.AvailabilityStatus
FROM 
    Product P
JOIN 
    Marka M ON P.MarkaId = M.MarkaId
JOIN 
    Model MD ON P.ModelId = MD.ModelId
JOIN 
    CarTypes CT ON P.CarTypeId = CT.CarTypeId
JOIN 
    Color C ON P.ColorId = C.ColorId
JOIN 
    EngineType ET ON P.EngineTypeId = ET.EngineTypeId
JOIN 
    Transmissions T ON P.TransmissionId = T.TransmissionId
JOIN 
    Availability AV ON P.AvailabilityId = AV.AvailabilityId
WHERE 
    AV.AvailabilityStatus = 'In Stock';  
	GO