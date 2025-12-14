-- PUNTO 7
SELECT B.nombreBanda, B.genero_musical, B.anio_creacion
FROM BANDA B
INNER JOIN Recital R ON R.codigoB = B.codigoB
INNER JOIN Escenario E ON E.nroEscenario = R.nroEscenario
WHERE (R.fecha BETWEEN '2023-01-01' AND '2023-12-31')
AND (E.cubierto = true)
