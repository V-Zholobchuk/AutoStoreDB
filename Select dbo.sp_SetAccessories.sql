EXEC dbo.sp_SetAccessories 
@AccessoryName = 'Keychain',
@AvailabilityId = 1
SELECT * FROM dbo.Accessories;


EXEC dbo.sp_SetAccessories
@AccessoryName = 'Keychain'
SELECT * FROM dbo.Accessories;


EXEC dbo.sp_SetAccessories 
@AccessoryId =6,
@Description = 'Keychain for keys'
SELECT * FROM dbo.Accessories;