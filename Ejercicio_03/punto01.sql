-- Punto 1
SELECT I.DNI, I.NOMBRE, I.apellido, I.dirección, I.email
FROM Integrante I
WHERE (I.fecha_nacimiento >= '1980-1-1') 
AND (I.fecha_nacimiento < '1990-1-1')
AND I.codigoB IN (
	SELECT R.codigoB 
	FROM RECITAL R
	WHERE (R.fecha >= '2023-1-1')
	AND (R.fecha < '2024-1-1')
)