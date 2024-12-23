CREATE TABLE Transmissions (
    TransmissionId INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    TransmissionType NVARCHAR(50) NOT NULL, 
    DriveType NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(150) NULL
)
