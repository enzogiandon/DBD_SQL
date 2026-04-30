SELECT p.apellido, p.nombre, p.email
FROM PROFESOR P 
INNER JOIN CURSO C on P.idProfesor = c.idProfesor
INNER JOIN Area A on C.idArea = A.idArea
WHERE
	A.nombre = 'Datos'


UNION

select e.apellido, e.nombre, e.email
from Estudiante e
INNER JOIN Inscripcion I on e.idEstudiante = I.idEstudiante
INNER JOIN CURSO C on i.idCurso = C.idCurso
INNER JOIN Area A on C.idArea = A.idArea
WHERE 
	A.nombre = 'Datos'
AND
	I.resultado > 3
AND
	I.anio > 2023