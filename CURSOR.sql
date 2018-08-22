-- Declaracion de variables para el cursor
DECLARE @USU_ID int,
	@USU_NOMBRE varchar(50),
	@USU_ESTADO int

-- Declaración del cursor
DECLARE MY_CURSOR CURSOR FOR

SELECT [USU_ID]
      ,[USU_NOMBRE]
      ,[USU_ESTADO]
  FROM [BDD_LITKAN].[dbo].[TBL_USUARIO]

-- Apertura del cursor
OPEN MY_CURSOR
-- Lectura de la primera fila del cursor
FETCH MY_CURSOR INTO @USU_ID, @USU_NOMBRE, @USU_ESTADO
WHILE (@@FETCH_STATUS = 0 )
BEGIN
    
	UPDATE TBL_USUARIO SET
	USU_ESTADO=2
	WHERE USU_ID=@USU_ID AND USU_ESTADO=0
	
	PRINT CONVERT(VARCHAR(10),@USU_ID) + ' ' + CONVERT(VARCHAR(50),@USU_NOMBRE) + ' ' + CONVERT(VARCHAR(10),@USU_ESTADO)
	-- Lectura de la siguiente fila del cursor
	FETCH MY_CURSOR INTO @USU_ID, @USU_NOMBRE, @USU_ESTADO
	
END
-- Cierre del cursor
CLOSE MY_CURSOR
-- Liberar los recursos
DEALLOCATE MY_CURSOR


