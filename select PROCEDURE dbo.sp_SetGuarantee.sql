EXEC dbo.sp_SetGuarantee
    @ProductId = 5,                
    @GuaranteePeriod = 24,    
    @GuaranteeDetails = '2 years or 60.000 km warranty.'
SELECT * FROM dbo.Guarantee

EXEC dbo.sp_SetGuarantee
 @GuaranteeId = 9,
    @GuaranteeDetails = '2 years or 55.000 km warranty.'
SELECT * FROM dbo.Guarantee

