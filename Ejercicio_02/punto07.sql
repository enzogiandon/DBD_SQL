SELECT especie 
FROM Arbol A 
INNER JOIN Localidad L ON A.codigoPostal = L.codigoPostal 
WHERE L.nombreL = 'La Plata'

INTERSECT

SELECT especie 
FROM Arbol A 
INNER JOIN Localidad L ON A.codigoPostal = L.codigoPostal 
WHERE L.nombreL = 'Salta';


-- Otra solución sin INTERSECT

SELECT DISTINCT especie 
FROM Arbol A
INNER JOIN Localidad L ON A.codigoPostal = L.codigoPostal
WHERE L.nombreL = 'La Plata'
AND A.especie IN (
    SELECT especie 
    FROM Arbol A2
    INNER JOIN Localidad L2 ON A2.codigoPostal = L2.codigoPostal
    WHERE L2.nombreL = 'Salta'
);
);