-- punto 3
SELECT A.DNI, Pe.Apellido, Pe.Nombre, Pe.Genero, Pe.Fecha_Nacimiento, AC.Calificacion
FROM Alumno A
INNER JOIN Persona Pe ON A.DNI = Pe.DNI
INNER JOIN Alumno_Curso AC ON A.DNI = AC.DNI
INNER JOIN Curso C ON AC.Cod_Curso = C.Cod_Curso
WHERE C.Nombre = 'Diseño de Bases de Datos'
AND AC.Anio = 2023;
