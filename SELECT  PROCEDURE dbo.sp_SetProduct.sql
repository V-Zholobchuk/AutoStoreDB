EXEC dbo.sp_SetProduct
    @MarkaId = 6,               
    @ModelId = 5,              
    @CarTypeId = 1,             
    @ColorId = 4,               
    @EngineTypeId = 5,         
    @TransmissionId = 1,       
    @GuaranteeId = 9,           
    @AvailabilityId = 1,        
    @ProductName = 'Audi A8'  
SELECT * FROM dbo.[Product]

EXEC dbo.sp_SetProduct
@ProductId = 5,
 @GuaranteeId = 12
 SELECT * FROM dbo.[Product]




SELECT * FROM dbo.Marka
SELECT * FROM dbo.Model
SELECT * FROM dbo.CarTypes
SELECT * FROM dbo.Color
SELECT * FROM dbo.EngineType
SELECT * FROM dbo.Transmissions
SELECT * FROM dbo.Guarantee