-- punto 2
SELECT B.nombreBanda, B.genero_musical, B.anio_creacion
FROM BANDA B
WHERE B.codigoB IN (
	-- Recitales de 2023
	SELECT R1.codigoB
	FROM RECITAL R1
	WHERE (R1.fecha >= '2023-1-1')
	AND (R1.fecha < '2024-1-1')

	EXCEPT

	SELECT R2.codigoB
	FROM Recital R2
	WHERE (R2.fecha >= '2022-1-1')
	AND (R2.fecha < '2023-1-1')
);
