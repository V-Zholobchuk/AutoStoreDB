USE [AutoStoreDB]
GO

INSERT INTO [dbo].[Transmissions] 
           ([TransmissionType], 
            [DriveType], 
            [Description])
VALUES 
           ('Automatic', 'All-Wheel Drive', 'A transmission that automatically changes gear ratios as the vehicle moves.'),
           ('Manual', 'Front-Wheel Drive', 'A transmission that requires the driver to manually change gears.'),
           ('CVT', 'Rear-Wheel Drive', 'Continuously Variable Transmission that provides smooth acceleration.'),
           ('Dual-Clutch', 'All-Wheel Drive', 'A type of automatic transmission that uses two separate clutches for odd and even gear sets.');
GO
