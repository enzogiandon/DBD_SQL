-- punto 2
SELECT DISTINCT P.DNI, P.Matricula, Pe.Apellido, Pe.Nombre
FROM Profesor P 
INNER JOIN Persona Pe ON p.DNI = pe.DNI
INNER JOIN Profesor_Curso PC ON P.DNI = PC.DNI
INNER JOIN Curso C ON PC.Cod_Curso = C.Cod_Curso
WHERE (C.Duracion > 100)
ORDER BY
	P.DNI