CREATE OR ALTER PROCEDURE dbo.sp_SetProduct
    @ProductId INT = NULL OUTPUT,
    @MarkaId INT = NULL,
    @ModelId INT = NULL,
    @CarTypeId INT = NULL,
    @ColorId INT = NULL,
    @EngineTypeId INT = NULL,
    @TransmissionId INT = NULL,
    @GuaranteeId INT = NULL,
    @AvailabilityId INT = NULL,
    @ProductName NVARCHAR(100) = NULL
AS
BEGIN
    IF @ProductId IS NULL
    BEGIN
	IF @ProductName IS NULL
        PRINT 'Invalid value of: ProductName'
        RETURN
    END
    IF @MarkaId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Marka
        WHERE MarkaId = @MarkaId
    )
    BEGIN
        PRINT 'Invalid MarkaId'
        RETURN
    END
    IF @ModelId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Model
        WHERE ModelId = @ModelId
    )
    BEGIN
        PRINT 'Invalid ModelId'
        RETURN
    END
    IF @CarTypeId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.CarTypes
        WHERE CarTypeId = @CarTypeId
    )
    BEGIN
        PRINT 'Invalid CarTypeId'
        RETURN
    END
    IF @ColorId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Color
        WHERE ColorId = @ColorId
    )
    BEGIN
        PRINT 'Invalid ColorId'
        RETURN
    END
    IF @EngineTypeId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.EngineType
        WHERE EngineTypeId = @EngineTypeId
    )
    BEGIN
        PRINT 'Invalid EngineTypeId'
        RETURN
    END
    IF @TransmissionId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Transmissions
        WHERE TransmissionId = @TransmissionId
    )
    BEGIN
        PRINT 'Invalid TransmissionId'
        RETURN
    END
	

    IF @GuaranteeId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Guarantee
        WHERE GuaranteeId = @GuaranteeId
    )
    BEGIN
        PRINT 'Invalid GuaranteeId'
        RETURN
    END

    IF @AvailabilityId IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM dbo.Availability
        WHERE AvailabilityId = @AvailabilityId
    )
    BEGIN
        PRINT 'Invalid AvailabilityId'
        RETURN
    END

    BEGIN TRY
        IF @ProductId IS NULL
        BEGIN
            INSERT INTO dbo.Product (MarkaId, ModelId, CarTypeId, ColorId, EngineTypeId, TransmissionId, GuaranteeId, AvailabilityId, ProductName)
            VALUES (@MarkaId, @ModelId, @CarTypeId, @ColorId, @EngineTypeId, @TransmissionId, @GuaranteeId, @AvailabilityId, @ProductName)

            SET @ProductId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            UPDATE dbo.Product
            SET MarkaId = ISNULL(@MarkaId, MarkaId),
                ModelId = ISNULL(@ModelId, ModelId),
                CarTypeId = ISNULL(@CarTypeId, CarTypeId),
                ColorId = ISNULL(@ColorId, ColorId),
                EngineTypeId = ISNULL(@EngineTypeId, EngineTypeId),
                TransmissionId = ISNULL(@TransmissionId, TransmissionId),
                GuaranteeId = ISNULL(@GuaranteeId, GuaranteeId),
                AvailabilityId = ISNULL(@AvailabilityId, AvailabilityId),
                ProductName = ISNULL(@ProductName, ProductName)
            WHERE ProductId = @ProductId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
