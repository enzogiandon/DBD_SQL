
-- --- DATOS PARA PERSONA ---
-- Profesores
INSERT INTO Persona VALUES (1010, 'Garcia', 'Juan', '1980-05-20', 'Casado', 'M'); -- Para Ej 4
INSERT INTO Persona VALUES (1020, 'Lopez', 'Ana', '1975-08-15', 'Soltera', 'F'); -- Para Ej 5
INSERT INTO Persona VALUES (1030, 'Martinez', 'Pedro', '1982-12-01', 'Casado', 'M');

-- Alumnos
INSERT INTO Persona VALUES (30568989, 'Perez', 'Luis', '1995-03-10', 'Soltero', 'M'); -- Para Ej 11
INSERT INTO Persona VALUES (4010, 'Gomez', 'Maria', '2000-07-25', 'Soltera', 'F'); -- Para Ej 3, 8
INSERT INTO Persona VALUES (4020, 'Diaz', 'Carlos', '1990-11-11', 'Casado', 'M'); -- Para Ej 1
INSERT INTO Persona VALUES (4030, 'Ruiz', 'Sofia', '2001-01-30', 'Soltera', 'F'); -- Para Ej 10 (Legajo 2020/09)
INSERT INTO Persona VALUES (4040, 'Torres', 'Jorge', '1998-05-05', 'Soltero', 'M');

-- --- DATOS PARA ALUMNO ---
INSERT INTO Alumno VALUES (30568989, '2015/01', 2015);
INSERT INTO Alumno VALUES (4010, '2019/05', 2019);
INSERT INTO Alumno VALUES (4020, '2010/01', 2010); -- Ingreso < 2014 (Para Ej 1)
INSERT INTO Alumno VALUES (4030, '2020/09', 2020); -- Legajo '2020/09' (Para Ej 10)
INSERT INTO Alumno VALUES (4040, '2018/02', 2018);

-- --- DATOS PARA PROFESOR ---
INSERT INTO Profesor VALUES (1010, 'M100', 'EXP-001');
INSERT INTO Profesor VALUES (1020, 'M200', 'EXP-002');
INSERT INTO Profesor VALUES (1030, 'M300', 'EXP-003');

-- --- DATOS PARA TITULO ---
INSERT INTO Titulo VALUES (1, 'Ingeniero en Sistemas', 'Grado');
INSERT INTO Titulo VALUES (2, 'Master en Datos', 'Posgrado');
INSERT INTO Titulo VALUES (3, 'Doctor en CS', 'Doctorado');
INSERT INTO Titulo VALUES (4, 'Especialista en IA', 'Posgrado');
INSERT INTO Titulo VALUES (25, 'Docente Universitario', 'Pedagogía'); -- Para Ej 9

-- --- DATOS PARA TITULO_PROFESOR ---
INSERT INTO Titulo_Profesor VALUES (1, 1010, '2005-12-01');
-- Profesora Ana (1020) con más de 3 títulos (Para Ej 5)
INSERT INTO Titulo_Profesor VALUES (1, 1020, '2000-12-01');
INSERT INTO Titulo_Profesor VALUES (2, 1020, '2005-12-01');
INSERT INTO Titulo_Profesor VALUES (3, 1020, '2010-12-01');
INSERT INTO Titulo_Profesor VALUES (4, 1020, '2015-12-01');

-- --- DATOS PARA CURSO ---
INSERT INTO Curso VALUES (500, 'Diseño de Bases de Datos', 'Fundamentos SQL', '2010-01-01', 120); -- >100hs (Ej 2, 3)
INSERT INTO Curso VALUES (501, 'Programación Java', 'Básico', '2015-01-01', 80);
INSERT INTO Curso VALUES (502, 'Arquitectura BD', 'Avanzado', '2018-01-01', 150); -- 'BD' en nombre (Ej 8)
INSERT INTO Curso VALUES (503, 'Inglés Técnico', 'Idiomas', '2020-01-01', 60);

-- --- DATOS PARA PROFESOR_CURSO ---
INSERT INTO Profesor_Curso VALUES (1010, 500, '2020-01-01', NULL); -- Juan Garcia dicta BD (Ej 4)
INSERT INTO Profesor_Curso VALUES (1020, 502, '2021-01-01', NULL);
INSERT INTO Profesor_Curso VALUES (1030, 501, '2022-01-01', NULL);

-- --- DATOS PARA ALUMNO_CURSO ---
-- Maria (4010) en BD (500) año 2023 (Para Ej 3)
INSERT INTO Alumno_Curso VALUES (4010, 500, 2023, 'Bueno', 7.50);

-- Jorge (4040) con Juan Garcia (1010 en curso 500) con nota > 8 (Para Ej 4)
INSERT INTO Alumno_Curso VALUES (4040, 500, 2023, 'Excelente', 9.00);

-- Luis (30568989) hizo curso con 'BD' en 2022 (Para Ej 8) pero nada en 2023
INSERT INTO Alumno_Curso VALUES (30568989, 502, 2022, 'Regular', 6.00);

-- Datos para Ejercicio 7 (Más/Menos inscriptos en 2024)
INSERT INTO Alumno_Curso VALUES (4010, 503, 2024, 'En curso', NULL);
INSERT INTO Alumno_Curso VALUES (4020, 503, 2024, 'En curso', NULL); -- Curso 503 tiene 2 alumnos
INSERT INTO Alumno_Curso VALUES (4030, 501, 2024, 'En curso', NULL); -- Curso 501 tiene 1 alumno