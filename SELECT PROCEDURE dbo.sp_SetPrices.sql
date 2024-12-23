EXEC dbo.sp_SetPrices
    @ProductId = 5,
    @Price = 100000.00,
   @StartDate = '2024-11-01',
    @EndDate = '2024-12-01'
	SELECT * FROM dbo.Prices

	EXEC dbo.sp_SetPrices
	@PriceId = 37,
	@Price = 99000.000
    SELECT * FROM dbo.Prices
