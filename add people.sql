USE [AutoStoreDB]
GO

INSERT INTO [dbo].[People] 
           ([FirstName], 
            [LastName], 
            [Phone], 
            [Email])
VALUES 
           ('John', 'Doe', '123456789', 'john.doe@example.com'),
           ('Jane', 'Smith', '987654321', 'jane.smith@example.com'),
           ('Michael', 'Johnson', '555123456', 'm.johnson@example.com'),
           ('Emily', 'Davis', '111222333', 'e.davis@example.com');
GO
