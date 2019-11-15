DECLARE @query nvarchar(MAX);

SET @query = '';

SELECT 
	@query += 'SELECT COUNT(*) AS [Rows], ''' + TABLE_NAME + ''' AS [TABLE] 
	FROM [' + TABLE_NAME + '] 
	UNION '
FROM INFORMATION_SCHEMA.TABLES

SET @query = SUBSTRING(@query, 0, LEN(@query) - 5);

SELECT @query AS 'Query'

EXEC sp_executesql @query
