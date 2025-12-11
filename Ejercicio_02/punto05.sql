-- Punto 5
SELECT P.DNI, P.nombre, P.apellido, P.fnac, L.nombreL
FROM PODADOR P 
INNER JOIN LOCALIDAD L ON P.codigoPostalVive = L.codigoPostal
WHERE 
	P.apellido LIKE '%ata'
AND P.DNI IN (
	SELECT DNI
	FROM PODA
	WHERE PODA.fecha >= '2024-01-01' AND PODA.FECHA < '2025-01-01'
)
ORDER BY
	P.apellido,
	P.nombre
;

