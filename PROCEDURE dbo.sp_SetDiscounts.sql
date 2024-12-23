CREATE OR ALTER PROCEDURE dbo.sp_SetDiscounts
    @DiscountsId INT = NULL OUTPUT,
    @ProductId INT = NULL,
    @DiscountsPercentage DECIMAL(5, 2) = NULL,
    @DiscountsStart DATETIME = NULL,
    @DiscountsEnd DATETIME = NULL
AS
BEGIN
IF @DiscountsId IS NULL
    DECLARE @MissingParams NVARCHAR(MAX) = ''

    IF @DiscountsPercentage IS NULL
        SET @MissingParams = @MissingParams + 'DiscountsPercentage, '

    IF @DiscountsStart IS NULL
        SET @MissingParams = @MissingParams + 'DiscountsStart, '

    IF @DiscountsEnd IS NULL
        SET @MissingParams = @MissingParams + 'DiscountsEnd, '

    IF LEN(@MissingParams) > 0
    BEGIN
        SET @MissingParams = LEFT(@MissingParams, LEN(@MissingParams) - 2)
        PRINT 'Invalid value of: ' + @MissingParams
        RETURN
    END
	 IF @ProductId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Product
        WHERE ProductId = @ProductId
    )
    BEGIN
        PRINT 'Invalid ProductId'
        RETURN
    END
    BEGIN TRY
        IF @DiscountsId IS NULL
        BEGIN
            INSERT INTO dbo.Discounts (ProductId, DiscountsPercentage, DiscountsStart, DiscountsEnd)
            VALUES (@ProductId, @DiscountsPercentage, @DiscountsStart, @DiscountsEnd)

            SET @DiscountsId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Discounts
            SET 
                ProductId = ISNULL(@ProductId, ProductId),
                DiscountsPercentage = ISNULL(@DiscountsPercentage, DiscountsPercentage),
                DiscountsStart = ISNULL(@DiscountsStart, DiscountsStart),
                DiscountsEnd = ISNULL(@DiscountsEnd, DiscountsEnd)
            WHERE DiscountsId = @DiscountsId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
