SELECT C.idCurso, C.titulo, COUNT(I.idAlumno) AS CANT_INSCRIPTOS
FROM CURSO C
LEFT JOIN Inscripcion I 
ON C.idCurso = I.idCurso
AND I.ANIO = 2026 
AND semestre = 1
GROUP BY
C.idCurso, C.titulo
HAVING
COUNT (I.IDALUMNO) < 30