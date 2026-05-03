-- 1. Tabla PERSONA
CREATE TABLE Persona (
    DNI INT PRIMARY KEY,
    Apellido VARCHAR(100),
    Nombre VARCHAR(100),
    Fecha_Nacimiento DATE,
    Estado_Civil VARCHAR(20),
    Genero VARCHAR(20)
);

-- 2. Tabla ALUMNO (Herencia de Persona)
CREATE TABLE Alumno (
    DNI INT PRIMARY KEY,
    Legajo VARCHAR(20),
    Anio_Ingreso INT,
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

-- 3. Tabla PROFESOR (Herencia de Persona)
CREATE TABLE Profesor (
    DNI INT PRIMARY KEY,
    Matricula VARCHAR(20),
    Nro_Expediente VARCHAR(20),
    FOREIGN KEY (DNI) REFERENCES Persona(DNI)
);

-- 4. Tabla TITULO
CREATE TABLE Titulo (
    Cod_Titulo INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(255)
);

-- 5. Tabla TITULO_PROFESOR (Relación N:M)
CREATE TABLE Titulo_Profesor (
    Cod_Titulo INT,
    DNI INT,
    Fecha DATE,
    PRIMARY KEY (Cod_Titulo, DNI),
    FOREIGN KEY (Cod_Titulo) REFERENCES Titulo(Cod_Titulo),
    FOREIGN KEY (DNI) REFERENCES Profesor(DNI)
);

-- 6. Tabla CURSO
CREATE TABLE Curso (
    Cod_Curso INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(255),
    Fecha_Creacion DATE,
    Duracion INT -- Duración en horas
);

-- 7. Tabla ALUMNO_CURSO (Inscripciones)
CREATE TABLE Alumno_Curso (
    DNI INT,
    Cod_Curso INT,
    Anio INT,
    Desempenio VARCHAR(100),
    Calificacion DECIMAL(4, 2),
    PRIMARY KEY (DNI, Cod_Curso, Anio),
    FOREIGN KEY (DNI) REFERENCES Alumno(DNI),
    FOREIGN KEY (Cod_Curso) REFERENCES Curso(Cod_Curso)
);

-- 8. Tabla PROFESOR_CURSO (Asignaciones)
CREATE TABLE Profesor_Curso (
    DNI INT,
    Cod_Curso INT,
    Fecha_Desde DATE,
    Fecha_Hasta DATE NULL, -- Puede ser NULL si sigue activo
    PRIMARY KEY (DNI, Cod_Curso, Fecha_Desde), -- PK compuesta ajustada para permitir reasignaciones
    FOREIGN KEY (DNI) REFERENCES Profesor(DNI),
    FOREIGN KEY (Cod_Curso) REFERENCES Curso(Cod_Curso)
);