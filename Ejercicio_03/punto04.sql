-- Punto 04
SELECT I.DNI, I.nombre, I.apellido, I.email
FROM Integrante I

WHERE EXISTS (
-- Integrantes que tocaron en Carlos Gardel
	SELECT *
	FROM RECITAL R
	INNER JOIN RECITAL R ON I.codigoB = R.codigoB
	INNER JOIN Escenario E ON R.nroEscenario = E.nroEscenario
	WHERE E.nombre_escenario = 'Gustavo Cerati' 
)
AND EXISTS (
-- Integrantes que tocaron en Carlos Gardel
	SELECT *
	FROM RECITAL R
	INNER JOIN RECITAL R ON I.codigoB = R.codigoB
	INNER JOIN Escenario E ON R.nroEscenario = E.nroEscenario
	WHERE E.nombre_escenario = 'Carlos Gardel'
)