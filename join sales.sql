SELECT * FROM Sales
FOR SYSTEM_TIME BETWEEN '2023-01-01' AND '2024-12-31'
WHERE ClientId = 1;