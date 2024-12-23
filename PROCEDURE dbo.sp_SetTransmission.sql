CREATE OR ALTER PROCEDURE dbo.sp_SetTransmission
    @TransmissionId INT = NULL OUTPUT,
    @TransmissionType NVARCHAR(50) = NULL,
    @DriveType NVARCHAR(50) = NULL,
    @Description NVARCHAR(150) = NULL
AS
BEGIN
    IF @TransmissionId IS NULL
    BEGIN
        IF @TransmissionType IS NULL
        BEGIN
            PRINT 'Invalid value of: TransmissionType'
            
        END

        IF @DriveType IS NULL
        BEGIN
            PRINT 'Invalid value of: DriveType'
            RETURN
        END
    END
    
    BEGIN TRY
        IF @TransmissionId IS NULL
        BEGIN
          
            INSERT INTO dbo.Transmissions (TransmissionType, DriveType, Description)
            VALUES (@TransmissionType, @DriveType, @Description)

            SET @TransmissionId = SCOPE_IDENTITY()
        END
        ELSE
        BEGIN
            
            UPDATE dbo.Transmissions
            SET TransmissionType = ISNULL(@TransmissionType, TransmissionType),
                DriveType = ISNULL(@DriveType, DriveType),
                Description = ISNULL(@Description, Description)
            WHERE TransmissionId = @TransmissionId
        END
    END TRY
    BEGIN CATCH
        PRINT ERROR_MESSAGE()
    END CATCH
END
