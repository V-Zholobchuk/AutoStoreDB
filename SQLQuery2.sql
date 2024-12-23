CREATE OR ALTER PROCEDURE dbo.sp_SetCarPurchase
    @SaleId INT = NULL OUTPUT,
    @ProductId INT = NULL,
    @ClientId INT = NULL,
    @EmployeeId INT = NULL,
    @SaleDate DATETIME = NULL,
    @PriceId INT = NULL,
    @DiscountsId INT = NULL,
    @GuaranteeId INT = NULL
AS
BEGIN
    -- Перевірка наявності необхідних параметрів
    IF @SaleId IS NULL
    BEGIN
        DECLARE @MissingParams NVARCHAR(MAX) = ''

        IF @ProductId IS NULL
            SET @MissingParams = @MissingParams + 'ProductId, '
        IF @ClientId IS NULL
            SET @MissingParams = @MissingParams + 'ClientId, '
        IF @EmployeeId IS NULL
            SET @MissingParams = @MissingParams + 'EmployeeId, '
        IF @SaleDate IS NULL
            SET @MissingParams = @MissingParams + 'SaleDate, '
        IF @PriceId IS NULL
            SET @MissingParams = @MissingParams + 'PriceId, '

        IF LEN(@MissingParams) > 0
        BEGIN
            SET @MissingParams = LEFT(@MissingParams, LEN(@MissingParams) - 1)
            PRINT 'Invalid value of: ' + @MissingParams
            RETURN
        END
    END

    -- Перевірка на наявність записів у відповідних таблицях
    IF @ProductId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Product WHERE ProductId = @ProductId)
    BEGIN
        PRINT 'Invalid ProductId'
        RETURN
    END

    IF @ClientId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Client WHERE ClientId = @ClientId)
    BEGIN
        PRINT 'Invalid ClientId'
        RETURN
    END

    IF @EmployeeId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Employee WHERE EmployeeId = @EmployeeId)
    BEGIN
        PRINT 'Invalid EmployeeId'
        RETURN
    END

    IF @PriceId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Prices WHERE PriceId = @PriceId)
    BEGIN
        PRINT 'Invalid PriceId'
        RETURN
    END

    IF @DiscountsId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Discounts WHERE DiscountsId = @DiscountsId)
    BEGIN
        PRINT 'Invalid DiscountsId'
        RETURN
    END

    IF @GuaranteeId IS NOT NULL AND NOT EXISTS (SELECT 1 FROM dbo.Guarantee WHERE GuaranteeId = @GuaranteeId)
    BEGIN
        PRINT 'Invalid GuaranteeId'
        RETURN
    END

    BEGIN TRY
        -- Якщо @SaleId не передано, викликаємо процедуру для вставки нового запису
        IF @SaleId IS NULL
        BEGIN
            EXEC dbo.sp_SetSales @ProductId, @ClientId, @EmployeeId, @SaleDate, @PriceId, @DiscountsId, @GuaranteeId, @SaleId
        END
        ELSE
        BEGIN
            -- Якщо @SaleId передано, викликаємо процедуру для оновлення запису
            EXEC dbo.sp_SetSales @SaleId, @ProductId, @ClientId, @EmployeeId, @SaleDate, @PriceId, @DiscountsId, @GuaranteeId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
