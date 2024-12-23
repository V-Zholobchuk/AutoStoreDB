CREATE OR ALTER PROCEDURE dbo.sp_SetPrices
    @PriceId INT = NULL OUTPUT,
    @ProductId INT = NULL,
    @AccessoryId INT = NULL,
    @Price DECIMAL(18, 2) = NULL,
    @StartDate DATETIME = NULL,
    @EndDate DATETIME = NULL
AS
BEGIN
    IF @PriceId IS NULL
    BEGIN
        DECLARE @MissingParams NVARCHAR(MAX) = ''

        IF @Price IS NULL
            SET @MissingParams = @MissingParams + 'Price, '

        IF @StartDate IS NULL
            SET @MissingParams = @MissingParams + 'StartDate, '

        IF LEN(@MissingParams) > 0
        BEGIN
            SET @MissingParams = LEFT(@MissingParams, LEN(@MissingParams) - 1)
            PRINT 'Invalid value of:' + @MissingParams
            RETURN
        END
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

    IF @AccessoryId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Accessories
        WHERE AccessoryId = @AccessoryId
    )
    BEGIN
        PRINT 'Invalid AccessoryId'
        RETURN
    END

    BEGIN TRY
        IF @PriceId IS NULL
        BEGIN
            INSERT INTO dbo.Prices (ProductId, AccessoryId, Price, StartDate, EndDate)
            VALUES (@ProductId, @AccessoryId, @Price, @StartDate, @EndDate)

            SET @PriceId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Prices
            SET 
                ProductId = ISNULL(@ProductId, ProductId),
                AccessoryId = ISNULL(@AccessoryId, AccessoryId),
                Price = ISNULL(@Price, Price),
                StartDate = ISNULL(@StartDate, StartDate),
                EndDate = ISNULL(@EndDate, EndDate)
            WHERE PriceId = @PriceId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
