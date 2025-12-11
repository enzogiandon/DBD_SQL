-- Punto 3
SELECT A.especie, A.anios, A.calle, A.nro, L.nombreL
FROM ARBOL A 
INNER JOIN Localidad L ON A.codigoPostal = L.codigoPostal
WHERE A.nroArbol NOT IN (
	SELECT A2.nroArbol 
	FROM ARBOL A2 
	INNER JOIN Poda ON A2.nroArbol = PODA.nroArbol
)