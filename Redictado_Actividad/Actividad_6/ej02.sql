SELECT P.idProfesor, P.nombre, P.apellido, COUNT(DISTINCT C.IDArea) AS CANT_AREAS
FROM Profesor P
LEFT JOIN CURSO C ON P.idProfesor = C.idProfesor
GROUP BY P.idProfesor, P.nombre, P.apellido
