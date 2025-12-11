-- Ejercicio 2
SELECT P.DNI, P.nombre, P.apellido, P.fnac, L.nombreL
FROM PODADOR P
INNER JOIN Localidad L ON P.codigoPostalVive = L.codigoPostal
WHERE P.DNI IN (
	SELECT DNI 
	FROM Poda
	WHERE fecha >= '2023-1-1' AND fecha < '2024-1-1'
);