EXEC dbo.sp_SetSales
    @ProductId = 5,
    @ClientId = 4,
    @EmployeeId = 1,
    @SaleDate = '2024-11-17',
    @PriceId = 38,
    @GuaranteeId = 12
	SELECT * FROM dbo.Sales

	EXEC dbo.sp_SetSales
   @SaleId = 33,
    @SaleDate = '2024-11-18'
	SELECT * FROM dbo.Sales

