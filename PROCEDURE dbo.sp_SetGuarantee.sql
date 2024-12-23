CREATE OR ALTER PROCEDURE dbo.sp_SetGuarantee
    @GuaranteeId INT = NULL OUTPUT,
    @ProductId INT = NULL,
    @GuaranteePeriod INT = NULL,
    @GuaranteeDetails NVARCHAR(1000) = NULL,
    @SaleDate DATETIME = NULL  
AS
BEGIN
    IF @GuaranteeId IS NULL
    BEGIN
        IF @ProductId IS NULL
        BEGIN
            PRINT 'Invalid value of: ProductId'
        END

        IF @GuaranteePeriod IS NULL
        BEGIN
            PRINT 'Invalid value of: GuaranteePeriod'
            RETURN
        END
    END
    
    IF @GuaranteeDetails IS NULL
    BEGIN
        PRINT 'Invalid value of: GuaranteeDetails'
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
        IF @GuaranteeId IS NULL
        BEGIN
            INSERT INTO dbo.Guarantee (ProductId, GuaranteePeriod, GuaranteeDetails, GuaranteeStartDate)
            VALUES (@ProductId, @GuaranteePeriod, @GuaranteeDetails, @SaleDate)  

            SET @GuaranteeId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            
            UPDATE dbo.Guarantee
            SET 
                ProductId = ISNULL(@ProductId, ProductId),
                GuaranteePeriod = ISNULL(@GuaranteePeriod, GuaranteePeriod),
                GuaranteeDetails = ISNULL(@GuaranteeDetails, GuaranteeDetails),
                GuaranteeStartDate = ISNULL(@SaleDate, GuaranteeStartDate)  -- Оновлення дати початку гарантії
            WHERE GuaranteeId = @GuaranteeId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
