-- Punto 6
SELECT e.nombre_escenario ,e.ubicación,e.descripción 
FROM Escenario e
where e.nroEscenario in(
	SELECT  e2.nroEscenario 
	FROM Escenario e2 
	INNER JOIN Recital r2 on e2.nroEscenario = r2.nroEscenario
	INNER JOIN BANDA B2 ON B2.codigoB= R2.codigoB
	WHERE B2.genero_musical= 'rock and roll')
and e.nroEscenario not in (
	SELECT  e3.nroEscenario 
	FROM Escenario e3 
	INNER JOIN Recital r3 on e3.nroEscenario = r3.nroEscenario
	INNER JOIN BANDA B3 ON B3.codigoB= R3.codigoB
	WHERE B3.genero_musical<> 'rock and roll')
ORDER BY e.nombre_escenario