-- punto 7

SELECT especie
FROM ARBOL a
WHERE EXISTS (
	-- Arboles en La Plata
	SELECT * FROM Localidad
	WHERE A.codigoPostal = Localidad.codigoPostal 
	AND (Localidad.nombreL = 'La Plata' OR Localidad.nombreL = 'Salta')

)