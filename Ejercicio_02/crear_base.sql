-- ==========================================
-- CREACIÓN DE TABLAS (DDL)
-- ==========================================

CREATE TABLE Localidad (
    codigoPostal INT PRIMARY KEY,
    nombreL VARCHAR(100),
    descripcion VARCHAR(200),
    nroHabitantes INT
);

CREATE TABLE Arbol (
    nroArbol INT PRIMARY KEY,
    especie VARCHAR(100),
    anios INT,
    calle VARCHAR(100),
    nro INT,
    codigoPostal INT,
    FOREIGN KEY (codigoPostal) REFERENCES Localidad(codigoPostal)
);

CREATE TABLE Podador (
    DNI VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    telefono VARCHAR(50),
    fnac DATE,
    codigoPostalVive INT,
    FOREIGN KEY (codigoPostalVive) REFERENCES Localidad(codigoPostal)
);

CREATE TABLE Poda (
    codPoda INT PRIMARY KEY,
    fecha DATE,
    DNI VARCHAR(20),
    nroArbol INT,
    FOREIGN KEY (DNI) REFERENCES Podador(DNI),
    FOREIGN KEY (nroArbol) REFERENCES Arbol(nroArbol)
);

-- ==========================================
-- INSERCIÓN DE DATOS DE PRUEBA (DML)
-- ==========================================

-- 1. Localidades (Para probar consultas de La Plata, Salta y habitantes)
INSERT INTO Localidad VALUES (1900, 'La Plata', 'Capital de la provincia', 700000);
INSERT INTO Localidad VALUES (4400, 'Salta', 'La linda', 500000);
INSERT INTO Localidad VALUES (1980, 'Brandsen', 'Ciudad tranquila', 30000);
INSERT INTO Localidad VALUES (7600, 'Mar del Plata', 'Costa atlantica', 600000);

-- 2. Arboles
-- Arboles en La Plata
INSERT INTO Arbol VALUES (101, 'Jacaranda', 10, 'Calle 7', 500, 1900);
INSERT INTO Arbol VALUES (102, 'Tilo', 50, 'Calle 50', 1200, 1900); -- Arbol viejo
INSERT INTO Arbol VALUES (103, 'Coníferas', 5, 'Calle 1', 200, 1900);
INSERT INTO Arbol VALUES (104, 'Coníferas', 8, 'Calle 2', 300, 1900);

-- Arboles en Salta (Para probar especies en común con La Plata)
INSERT INTO Arbol VALUES (201, 'Jacaranda', 12, 'Belgrano', 100, 4400); 
INSERT INTO Arbol VALUES (202, 'Ceibo', 20, 'San Martin', 400, 4400);

-- Arboles en Brandsen (Para probar localidades con menos de 5 árboles)
INSERT INTO Arbol VALUES (301, 'Pino', 15, 'Ruta 29', 55, 1980);
INSERT INTO Arbol VALUES (302, 'Pino', 12, 'Ruta 29', 56, 1980);

-- Arbol para probar "nunca podado"
INSERT INTO Arbol VALUES (999, 'Roble', 100, 'Bosque', 1, 1900);

-- 3. Podadores
-- Datos específicos pedidos en el PDF
INSERT INTO Podador VALUES ('11111111', 'Juan', 'Perez', '221-555001', '1980-05-15', 1900);
INSERT INTO Podador VALUES ('22222222', 'Jose', 'Garcia', '221-555002', '1985-08-20', 1900);
INSERT INTO Podador VALUES ('33333333', 'Mario', 'Zapata', '221-555003', '1990-01-10', 1900); -- Apellido termina en 'ata'
INSERT INTO Podador VALUES ('44444444', 'Luis', 'Sulata', '221-555004', '1992-03-15', 4400); -- Otro 'ata'
INSERT INTO Podador VALUES ('22234566', 'Carlos', 'Borrar', '221-555999', '1975-12-01', 1900); -- DNI Para eliminar (Punto 8)
INSERT INTO Podador VALUES ('55555555', 'Ana', 'Conifera', '221-555005', '1988-07-07', 1900); -- Solo poda coníferas

-- 4. Podas
-- Podas de Juan Perez y Jose Garcia (Punto 1)
INSERT INTO Poda VALUES (1, '2023-01-15', '11111111', 101); -- Juan Perez poda 101
INSERT INTO Poda VALUES (2, '2023-02-20', '22222222', 102); -- Jose Garcia poda 102

-- Podas en 2023 (Punto 2 y 4)
INSERT INTO Poda VALUES (3, '2023-06-10', '33333333', 301);

-- Podas en 2022 pero NO en 2023 (Para el Punto 4)
-- El arbol 201 fue podado en 2022 por Juan Perez
INSERT INTO Poda VALUES (4, '2022-05-05', '11111111', 201); 

-- Podas en 2024 (Punto 5, para apellido 'ata')
INSERT INTO Poda VALUES (5, '2024-01-10', '33333333', 301); -- Zapata poda en 2024

-- Podas para probar "Solo podaron Coníferas" (Punto 6)
-- Ana (55555555) solo poda coníferas (arboles 103 y 104)
INSERT INTO Poda VALUES (6, '2023-08-01', '55555555', 103);
INSERT INTO Poda VALUES (7, '2023-08-05', '55555555', 104);

-- Juan Perez poda una Conífera también, pero ya podó un Jacarandá antes, así que no debería salir en el "solo".
INSERT INTO Poda VALUES (8, '2023-09-01', '11111111', 103);