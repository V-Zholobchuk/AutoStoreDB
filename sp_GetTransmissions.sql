CREATE OR ALTER PROCEDURE dbo.sp_GetTransmissions
    @TransmissionId INT = NULL,
    @TransmissionType NVARCHAR(50) = NULL
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM dbo.Transmissions WHERE TransmissionId = @TransmissionId)
    BEGIN
        PRINT 'Запису з індитифікатором не існує'
        RETURN
    END
    SELECT *
    FROM dbo.Transmissions
    WHERE TransmissionId = @TransmissionId
       OR @TransmissionId IS NULL
      AND TransmissionType LIKE @TransmissionType + '%'
       OR @TransmissionType IS NULL
END
