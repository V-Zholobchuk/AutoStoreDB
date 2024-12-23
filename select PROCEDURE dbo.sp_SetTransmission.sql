EXEC dbo.sp_SetTransmission
@TransmissionType = 'Dual-Clutch',
@DriveType ='Rear-Wheel Drive',
@Description ='Uses two clutches for faster gear shifts.'
SELECT * FROM dbo.Transmissions

EXEC dbo.sp_SetTransmission
@TransmissionId = 5,
@DriveType ='All-Wheel Drive'
SELECT * FROM dbo.Transmissions

