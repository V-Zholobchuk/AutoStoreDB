CREATE TABLE [Product] (
ProductId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
MarkaId int NULL,
ModelId int NULL,
CarTypeId int NULL,
ColorId int NULL,
EngineTypeId int NULL,
TransmissionId int NULL,
GuaranteeId int NULL,
AvailabilityId int NULL,
ProductName NVARCHAR(100) NOT NULL
)