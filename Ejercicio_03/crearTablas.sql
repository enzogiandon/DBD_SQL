-- ==========================================
-- 1. CREACIÓN DE TABLAS (DDL)
-- ==========================================

CREATE TABLE Banda (
    codigoB INT PRIMARY KEY,
    nombreBanda VARCHAR(100),
    genero_musical VARCHAR(50),
    anio_creacion INT
);

CREATE TABLE Escenario (
    nroEscenario INT PRIMARY KEY,
    nombre_escenario VARCHAR(100),
    ubicación VARCHAR(100),
    cubierto BOOLEAN, -- TRUE si es cubierto, FALSE si es al aire libre
    m2 INT,
    descripción VARCHAR(200)
);

CREATE TABLE Integrante (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    dirección VARCHAR(100),
    email VARCHAR(100),
    fecha_nacimiento DATE,
    codigoB INT,
    FOREIGN KEY (codigoB) REFERENCES Banda(codigoB)
);

CREATE TABLE Recital (
    fecha DATE,
    hora TIME,
    nroEscenario INT,
    codigoB INT,
    PRIMARY KEY (fecha, hora, nroEscenario), -- Clave primaria compuesta asumida
    FOREIGN KEY (nroEscenario) REFERENCES Escenario(nroEscenario),
    FOREIGN KEY (codigoB) REFERENCES Banda(codigoB)
);

-- ==========================================
-- 2. CARGA DE DATOS (DML)
-- ==========================================

-- --- BANDAS ---
-- Banda 1: Toca en 2023 pero NO en 2022 (Para el punto 2)
INSERT INTO Banda VALUES (1, 'Los Piojos', 'Rock', 1988);

-- Banda 2: Toca en 2022 y 2023 (No debería salir en el punto 2)
INSERT INTO Banda VALUES (2, 'Divididos', 'Rock', 1988);

-- Banda 3: Para el UPDATE (Punto 9)
INSERT INTO Banda VALUES (3, 'Mempis la Blusera', 'Blues', 1978);

-- Banda 4: Solo Rock and Roll (Para el punto 6)
INSERT INTO Banda VALUES (4, 'Viejas Locas', 'Rock and Roll', 1990);

-- Banda 5: Banda numerosa (> 5 integrantes para el punto 5)
INSERT INTO Banda VALUES (5, 'La Bersuit', 'Rock', 1988);

-- --- ESCENARIOS ---
-- Escenarios específicos pedidos en el Punto 4
INSERT INTO Escenario VALUES (10, 'Gustavo Cerati', 'La Plata', TRUE, 500, 'Escenario principal techado');
INSERT INTO Escenario VALUES (20, 'Carlos Gardel', 'CABA', FALSE, 300, 'Escenario al aire libre');

-- Otros escenarios
INSERT INTO Escenario VALUES (30, 'Cosquin Rock', 'Cordoba', FALSE, 10000, 'Predio montaña');
INSERT INTO Escenario VALUES (40, 'Teatro Opera', 'La Plata', TRUE, 200, 'Teatro antiguo'); -- Solo tuvo Rock and Roll

-- --- INTEGRANTES ---
-- Integrantes de 'Los Piojos' (Nacidos entre 1980-1990 para punto 1)
INSERT INTO Integrante VALUES ('11111111', 'Andres', 'Ciro', 'Calle 1', 'ciro@mail.com', '1985-05-15', 1);
INSERT INTO Integrante VALUES ('22222222', 'Micky', 'Rodriguez', 'Calle 2', 'micky@mail.com', '1982-10-20', 1);

-- Integrante que tocó en Cerati y Gardel (Punto 4) -> Pertenece a Divididos (Banda 2)
INSERT INTO Integrante VALUES ('33333333', 'Ricardo', 'Mollo', 'Calle 3', 'mollo@mail.com', '1957-08-17', 2);

-- Integrantes de La Bersuit (Para que tenga > 5)
INSERT INTO Integrante VALUES ('501', 'Gustavo', 'Cordera', 'Calle A', 'mail1@b.com', '1970-01-01', 5);
INSERT INTO Integrante VALUES ('502', 'Juan', 'Subira', 'Calle B', 'mail2@b.com', '1975-01-01', 5);
INSERT INTO Integrante VALUES ('503', 'Carlos', 'Martin', 'Calle C', 'mail3@b.com', '1976-01-01', 5);
INSERT INTO Integrante VALUES ('504', 'Pepe', 'Cespedes', 'Calle D', 'mail4@b.com', '1977-01-01', 5);
INSERT INTO Integrante VALUES ('505', 'Dani', 'Suarez', 'Calle E', 'mail5@b.com', '1978-01-01', 5);
INSERT INTO Integrante VALUES ('506', 'Condor', 'Sbarbati', 'Calle F', 'mail6@b.com', '1979-01-01', 5);

-- --- RECITALES ---
-- Caso Punto 1 y 2: Recitales en 2023
INSERT INTO Recital VALUES ('2023-05-10', '21:00', 10, 1); -- Los Piojos en Cerati (2023)
INSERT INTO Recital VALUES ('2023-08-20', '22:00', 30, 1); -- Los Piojos en Cosquin (2023)

-- Caso Punto 2: Recitales en 2022 (Divididos toca en 2022 y 2023)
INSERT INTO Recital VALUES ('2022-02-15', '20:00', 10, 2);
INSERT INTO Recital VALUES ('2023-04-15', '21:00', 20, 2); -- Divididos en Carlos Gardel (2023)
INSERT INTO Recital VALUES ('2023-09-15', '21:00', 10, 2); -- Divididos en Gustavo Cerati (2023) -> Mollo cumple punto 4

-- Caso Punto 3: Cronograma del 04/12/2023
INSERT INTO Recital VALUES ('2023-12-04', '18:00', 10, 3); -- Mempis en Cerati
INSERT INTO Recital VALUES ('2023-12-04', '20:00', 20, 4); -- Viejas Locas en Gardel

-- Caso Punto 6: Escenario que SOLO tuvo Rock and Roll
-- Teatro Opera (40) solo tendrá a Viejas Locas (Rock and Roll)
INSERT INTO Recital VALUES ('2021-01-01', '21:00', 40, 4);

-- Caso Punto 7: Recitales en cubiertos (TRUE) durante 2023
-- Ya tenemos a Los Piojos en Cerati (Cubierto) en 2023

-- Caso Punto 8: Recitales en 2024
INSERT INTO Recital VALUES ('2024-01-10', '20:00', 10, 1);
INSERT INTO Recital VALUES ('2024-01-15', '22:00', 10, 2);