UPDATE Curso
SET idProfesor = (
    SELECT idProfesor
    FROM Curso
    WHERE titulo = 'Fundamentos de Organizacion de Datos'
)
WHERE titulo = 'Diseño de Bases de Datos';

