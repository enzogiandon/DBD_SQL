-- punto 5
SELECT B.nombreBanda, B.genero_musical, B.anio_creacion
FROM BANDA B 	
INNER JOIN Integrante I ON I.codigoB = B.codigoB
-- Agrupamos para poder contar cuántos integrantes hay por cada banda
GROUP BY 
    B.codigoB, 
    B.nombreBanda, 
    B.genero_musical, 
    B.anio_creacion
HAVING COUNT(I.DNI) >= 5;