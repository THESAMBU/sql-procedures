DECLARE @query nvarchar(MAX);
DECLARE @column varchar(MAX);
DECLARE @filter varchar(MAX);

SET @query = '';
SET @column = 'id';
SET @filter = '1';

SELECT 
	@query += 'SELECT [' + @column + '], ''' + TABLE_NAME + ''' AS [TABLE] 
	FROM [' + TABLE_NAME + '] 
	WHERE [' + @column + '] LIKE ''' +  @filter + ''' 
	UNION '
FROM INFORMATION_SCHEMA.COLUMNS
WHERE COLUMN_NAME = @column

SET @query = SUBSTRING(@query, 0, LEN(@query) - 5);

SELECT @query AS 'Query'

EXEC sp_executesql @query
