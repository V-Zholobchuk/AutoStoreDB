CREATE TABLE EngineType (
    EngineTypeId int IDENTITY(1,1) PRIMARY KEY NOT NULL ,
    EngineTypeName NVARCHAR(50) NOT NULL, 
	Enginevolume DECIMAL(5,2) NOT NULL,
    [Description] NVARCHAR(200) NULL 
)
