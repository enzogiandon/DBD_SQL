-- punto 3
SELECT B.nombreBanda, R.fecha, R.hora, E.nombre_escenario, E.ubicación
FROM RECITAL R
INNER JOIN BANDA B ON R.codigoB = B.codigoB
INNER JOIN Escenario E ON R.nroEscenario = E.nroEscenario
WHERE (R.FECHA = '2023-12-04');