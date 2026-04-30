SELECT E.apellido, E.nombre, E.email

-- todos los cursos del estudiante
FROM Estudiante E
INNER JOIN Inscripcion I ON E.idEstudiante = I.idEstudiante
INNER JOIN Curso C ON I.idCurso = C.idCurso
INNER JOIN Area A ON C.idArea = A.idArea

 -- que sean de programacion y esten aprobados
WHERE A.nombre = 'Programacion'
  AND I.resultado > 3
  
  
-- donde la cuenta total de cursos de programacion...
GROUP BY E.idEstudiante, E.apellido, E.nombre, E.email


-- sea igual a la cuenta de total de cursos de programacion
HAVING COUNT(DISTINCT C.idCurso) = (
    SELECT COUNT(*)
    FROM Curso C2
    JOIN Area A2 ON C2.idArea = A2.idArea
    WHERE A2.nombre = 'Programacion'
);
