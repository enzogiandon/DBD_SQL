-- Punto 9
SELECT 
    L.codigoPostal, 
    L.nombreL, 
    L.descripcion
FROM Localidad L
LEFT JOIN Arbol A ON L.codigoPostal = A.codigoPostal
GROUP BY 
    L.codigoPostal, 
    L.nombreL, 
    L.descripcion
	
HAVING 
    COUNT(A.nroArbol) < 5;
	
	
-- Otra alternativa
SELECT 
    codigoPostal, 
    nombreL, 
    descripcion
FROM Localidad L
WHERE (
    SELECT COUNT(*) 
    FROM Arbol A 
    WHERE A.codigoPostal = L.codigoPostal
) < 5;