-- Punto 8
SELECT E.nombre_escenario, COUNT(R.FECHA) AS CANTIDAD_RECITALES
FROM Escenario E
INNER JOIN RECITAL R ON E.nroEscenario = R.nroEscenario
WHERE (R.fecha BETWEEN '2024-01-01' AND '2024-12-31')
GROUP BY
	E.nroEscenario,
	E.nombre_escenario
