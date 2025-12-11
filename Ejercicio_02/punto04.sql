-- Punto 4
SELECT A.ESPECIE, A.anios, A.CALLE, A.nro, L.nombreL
FROM ARBOL A 
INNER JOIN LOCALIDAD L ON A.codigoPostal = l.codigoPostal
WHERE A.NROARBOL IN (
-- arboles podados en 2022
	SELECT NROARBOL 
	FROM PODA
	WHERE PODA.fecha >= '2022-1-1' AND PODA.fecha < '2023-1-1'
)
AND A.NROARBOL NOT IN (
-- arboles podados en 2023
	SELECT nroArbol
	FROM Poda
	WHERE PODA.FECHA >= '2023-1-1' AND PODA.fecha < '2024-1-1'	
);


/*
	Si hago la sub consulta con EXCEPT:
	...
	
WHERE A.NROARBOL IN (

    -- Conjunto A: Árboles podados en 2023
	SELECT nroArbol 
    FROM Poda 
    WHERE fecha >= '2022-01-01' AND fecha < '2023-01-01'
    
    EXCEPT
    
    -- Conjunto B: Árboles podados en 2023
    SELECT nroArbol 
    FROM Poda 
    WHERE fecha >= '2023-01-01' AND fecha < '2024-01-01'
);	
*/ 