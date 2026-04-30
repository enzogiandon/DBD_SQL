SELECT E.apellido, E.nombre, E.email 
FROM Estudiante E
WHERE EXISTS
(
	SELECT * 
	FROM Inscripcion I
	INNER JOIN Curso C ON I.idCurso = C.idCurso
	INNER JOIN Area A ON C.idArea = A.idArea
	WHERE I.idEstudiante = E.idEstudiante 
	AND A.nombre = 'Datos'
	AND I.anio = 2026 AND I.semestre = 2
)
AND EXISTS
(
	SELECT * 
	FROM Inscripcion I
	INNER JOIN Curso C ON I.idCurso = C.idCurso
	INNER JOIN Area A ON C.idArea = A.idArea
	WHERE I.idEstudiante = E.idEstudiante 
	AND A.nombre = 'Ing. de Software'
	AND I.anio = 2026 AND I.semestre = 2  
)
AND NOT EXISTS
(
	SELECT * 
	FROM Inscripcion I
	INNER JOIN Curso C ON I.idCurso = C.idCurso
	INNER JOIN Area A ON C.idArea = A.idArea
	WHERE I.idEstudiante = E.idEstudiante 
	AND A.nombre = 'Programacion'
	AND I.anio = 2026 AND I.semestre = 2  
)