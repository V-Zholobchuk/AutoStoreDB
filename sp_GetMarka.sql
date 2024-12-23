CREATE OR ALTER PROCEDURE dbo.sp_GetMarka
@MarkaId INT = NULL,
@MarkaName NVARCHAR(50) = NULL 
AS 
BEGIN 
IF NOT EXISTS 
(SELECT *
  FROM dbo.Marka 
  WHERE MarkaId = @MarkaId)
  BEGIN
  PRINT 'Запису з індитифікатором не існує '
  RETURN
  END 
SELECT *
FROM dbo.Marka 
WHERE MarkaId = @MarkaId
OR @MarkaId IS NULL
AND MarkaName LIKE @MarkaName + '%'
OR @MarkaName IS NULL

END