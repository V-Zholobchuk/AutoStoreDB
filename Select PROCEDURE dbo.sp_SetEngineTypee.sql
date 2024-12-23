
EXEC dbo.sp_SetEngineTypee

    @EngineTypeName = 'Diesel',
    @EngineVolume = 3.00,
    @Description = 'High-performance diesel engine'
SELECT * FROM dbo.EngineType

EXEC dbo.sp_SetEngineTypee
   @EngineTypeId =5,
    @EngineVolume = 3.50
SELECT * FROM dbo.EngineType

