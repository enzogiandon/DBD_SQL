SELECT E.apellido, E.nombre, E.email
FROM Estudiante E

-- cursos de Programación que el estudiante NO aprobó:
WHERE NOT EXISTS (
	
	-- listo todos los cursos de programacion:
    SELECT 1
    FROM Curso C
    INNER JOIN Area A ON C.idArea = A.idArea
    WHERE A.nombre = 'Programacion'
	
	  -- busco alguno que no esté aprobado:
      AND NOT EXISTS (
          SELECT 1
          FROM Inscripcion I
          WHERE I.idCurso = C.idCurso
            AND I.idEstudiante = E.idEstudiante
            AND I.resultado > 3
      )
);