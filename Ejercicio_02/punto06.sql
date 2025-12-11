-- punto 6
SELECT P.DNI, P.apellido, P.fnac
FROM PODADOR P
WHERE P.DNI IN (
-- Podadores que hayan podado coniferas
	SELECT DNI 
	FROM Poda
	INNER JOIN Arbol a on Poda.nroArbol = A.nroArbol
	WHERE a.especie = 'Coníferas'
)
AND P.DNI NOT IN (
-- Podadores que hayan podado otra cosa que no sea coniferas
	SELECT DNI 
	FROM Poda
	INNER JOIN Arbol a on Poda.nroArbol = A.nroArbol
	WHERE a.especie <> 'Coníferas'
)
;