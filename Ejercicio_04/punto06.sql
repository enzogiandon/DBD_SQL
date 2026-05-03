-- punto 6
SELECT Pe.DNI, Pe.Apellido, Pe.Nombre, SUM(C.DURACION) AS Total_horas, AVG(C.Duracion) AS Promedio_horas
FROM Persona Pe
INNER JOIN Profesor_Curso PC ON Pe.DNI = PC.DNI
INNER JOIN Curso C ON PC.Cod_Curso = C.Cod_Curso
GROUP BY
	Pe.DNI,
	Pe.Apellido,
	Pe.Nombre