-- =============================================
-- INSERTAR BANDAS
-- =============================================
-- Banda 1: Rock and Roll. Tocará en dos escenarios clave.
INSERT INTO Banda VALUES (10, 'Los Rocanroles', 'rock and roll', 1990);

-- Banda 2: Pop. Para probar filtros de género.
INSERT INTO Banda VALUES (20, 'Pop Stars', 'pop', 2005);

-- Banda 3: Caso de éxito para fechas (tocó 2023, NO 2022).
INSERT INTO Banda VALUES (30, 'La Nueva Ola', 'indie', 2015);

-- Banda 4: Caso de fallo para fechas (tocó 2023 Y TAMBIÉN 2022).
INSERT INTO Banda VALUES (40, 'Los Clásicos', 'jazz', 1980);

-- Banda 5: Para el punto 9 (Corregir nombre).
INSERT INTO Banda VALUES (50, 'Mempis la Blusera', 'blues', 1978);

-- Banda 6: Banda numerosa (Para el punto 5, > 5 integrantes).
INSERT INTO Banda VALUES (60, 'La Orquesta Gigante', 'clasica', 2000);


-- =============================================
-- INSERTAR ESCENARIOS
-- =============================================
-- Escenarios específicos pedidos en el punto 4.
INSERT INTO Escenario VALUES (1, 'Gustavo Cerati', 'Zona Norte', 1, 500.00, 'Escenario principal techado');
INSERT INTO Escenario VALUES (2, 'Carlos Gardel', 'Zona Sur', 0, 300.00, 'Escenario al aire libre');

-- Otros escenarios para pruebas
INSERT INTO Escenario VALUES (3, 'Teatro Opera', 'Centro', 1, 200.00, 'Teatro antiguo');
INSERT INTO Escenario VALUES (4, 'Plaza Central', 'Centro', 0, 1000.00, 'Plaza pública'); 
-- El escenario 4 solo tendrá Rock and Roll para probar el punto 6.


-- =============================================
-- INSERTAR INTEGRANTES
-- =============================================
-- Integrantes de 'Los Rocanroles' (Banda 10)
-- Juan: Nació en 1985 (Rango 1980-1990 OK). Toca en 2023. -> DEBE SALIR EN PUNTO 1.
INSERT INTO Integrante VALUES (11111111, 'Juan', 'Perez', 'Calle 1', 'juan@mail.com', '1985-05-20', 10);
-- Pedro: Nació en 1970 (Fuera de rango). -> NO DEBE SALIR EN PUNTO 1.
INSERT INTO Integrante VALUES (22222222, 'Pedro', 'Lopez', 'Calle 2', 'pedro@mail.com', '1970-08-15', 10);

-- Integrantes de 'La Nueva Ola' (Banda 30 - Tocó 2023, No 2022)
INSERT INTO Integrante VALUES (33333333, 'Maria', 'Becerra', 'Calle 3', 'maria@mail.com', '1990-12-01', 30);

-- Integrantes de 'La Orquesta Gigante' (Banda 60 - Necesitamos 6 para el punto 5)
INSERT INTO Integrante VALUES (601, 'Músico', 'Uno', 'Calle X', 'm1@mail.com', '1990-01-01', 60);
INSERT INTO Integrante VALUES (602, 'Músico', 'Dos', 'Calle X', 'm2@mail.com', '1990-01-01', 60);
INSERT INTO Integrante VALUES (603, 'Músico', 'Tres', 'Calle X', 'm3@mail.com', '1990-01-01', 60);
INSERT INTO Integrante VALUES (604, 'Músico', 'Cuatro', 'Calle X', 'm4@mail.com', '1990-01-01', 60);
INSERT INTO Integrante VALUES (605, 'Músico', 'Cinco', 'Calle X', 'm5@mail.com', '1990-01-01', 60);
INSERT INTO Integrante VALUES (606, 'Músico', 'Seis', 'Calle X', 'm6@mail.com', '1990-01-01', 60);


-- =============================================
-- INSERTAR RECITALES
-- =============================================

-- CASO: Banda 10 ('Los Rocanroles') toca en AMBOS escenarios clave (Para punto 4)
-- Y toca en 2023 (Para punto 1)
INSERT INTO Recital VALUES (100, '2023-05-10', '20:00:00', 1, 10); -- En Gustavo Cerati
INSERT INTO Recital VALUES (101, '2023-06-15', '21:00:00', 2, 10); -- En Carlos Gardel
INSERT INTO Recital VALUES (102, '2023-07-20', '22:00:00', 4, 10); -- En Plaza Central (Solo Rock)

-- CASO: Banda 30 ('La Nueva Ola') toca en 2023 pero NO en 2022 (Para punto 2)
INSERT INTO Recital VALUES (200, '2023-02-14', '19:00:00', 3, 30);

-- CASO: Banda 40 ('Los Clásicos') toca en 2023 Y en 2022 (Debe ser excluida en punto 2)
INSERT INTO Recital VALUES (300, '2023-01-10', '20:00:00', 3, 40);
INSERT INTO Recital VALUES (301, '2022-12-25', '23:00:00', 3, 40); -- Recital en 2022

-- CASO: Recital específico para fecha 04/12/2023 (Para punto 3)
INSERT INTO Recital VALUES (400, '2023-12-04', '18:30:00', 2, 20); -- Banda Pop en Carlos Gardel

-- CASO: Recitales en 2024 (Para punto 8)
INSERT INTO Recital VALUES (500, '2024-01-15', '20:00:00', 1, 10);
INSERT INTO Recital VALUES (501, '2024-03-20', '21:00:00', 1, 20);

-- CASO: Banda 20 toca en Plaza Central (Esto "ensucia" el escenario 4 para el punto 6?)
-- NO lo agrego para dejar el Escenario 4 (Plaza Central) puro de Rock and Roll.
-- Pero agrego Banda 20 en Escenario 1 para que Escenario 1 NO sea solo Rock.
INSERT INTO Recital VALUES (600, '2023-08-01', '20:00:00', 1, 20);