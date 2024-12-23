EXEC dbo.sp_SetDiscounts
    @ProductId = 5,
    @DiscountsPercentage = 15.00,
    @DiscountsStart = '2024-11-01',
    @DiscountsEnd = '2024-12-01'
	SELECT * FROM dbo.Discounts

EXEC dbo.sp_SetDiscounts
@DiscountsId = 10,
    @DiscountsPercentage = 17.00
	SELECT * FROM dbo.Discounts

