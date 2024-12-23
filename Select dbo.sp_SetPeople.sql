EXEC dbo.sp_SetPeople 
@FirstName = 'Deiv1',
@LastName = 'Doel',
@Phone = '123-456-788',
@Email = 'john.doe@example.com'

SELECT * FROM dbo.People;

EXEC dbo.sp_SetPeople 

@LastName = 'Doel',
@Phone = '123-456-788',
@Email = 'john.doe@example.com'

SELECT * FROM dbo.People;


EXEC dbo.sp_SetPeople 
@PersonId =13,
@LastName = 'Doel',
@Phone = '123-456-788',
@Email = 'john.doe@example.com'

SELECT * FROM dbo.People;