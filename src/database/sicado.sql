--
-- File generated with SQLiteStudio v3.0.6 on dom jul 12 02:12:16 2015
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Inasistencia
CREATE TABLE Inasistencia (codInasistencia VARCHAR (100) PRIMARY KEY UNIQUE NOT NULL, fecha DATE NOT NULL, profesor_materia VARCHAR (100) REFERENCES Profesor_Materia (codProf_Mat) NOT NULL);

-- Table: Horario
CREATE TABLE Horario (codHorario VARCHAR (10) PRIMARY KEY NOT NULL UNIQUE, hora_inicio DATE NOT NULL, hora_fin NOT NULL);

-- Table: Periodo
CREATE TABLE Periodo (codPeriodo VARCHAR (10) PRIMARY KEY UNIQUE NOT NULL, fecha_inicio DATE NOT NULL UNIQUE, fehca_fin DATE NOT NULL UNIQUE);

-- Table: Materia
CREATE TABLE Materia (codMateria VARCHAR (10) PRIMARY KEY UNIQUE NOT NULL, nombre STRING (50) NOT NULL UNIQUE, creditos INT (10) NOT NULL, trayecto VARCHAR (50) NOT NULL, horasAcademicas INT (10) NOT NULL);

-- Table: Persona
CREATE TABLE Persona (
    cedula     VARCHAR (8)  PRIMARY KEY
                            UNIQUE
                            NOT NULL,
    nombre1    STRING (25)  NOT NULL,
    nombre2    STRING (25),
    apellido1  STRING (25)  NOT NULL,
    apellido2  STRING (25)  NOT NULL,
    tlfCasa    STRING (13),
    tlfCelular STRING (13),
    correo     STRING (100),
    tipo       VARCHAR (10) REFERENCES Profesor (codProfesor) ON DELETE CASCADE
                                                              ON UPDATE CASCADE 
                                                              
                            REFERENCES Usuario (codUsuario) ON DELETE CASCADE
                                                            ON UPDATE CASCADE
);

-- Table: Usuario
CREATE TABLE Usuario (codUsuario VARCHAR (10) PRIMARY KEY UNIQUE NOT NULL, contraseña VARCHAR (16) NOT NULL, preguntaSecreta TEXT (100) NOT NULL, respuestaSecreta TEXT (50) NOT NULL);

-- Table: Profesor
CREATE TABLE Profesor (codProfesor VARCHAR (10) PRIMARY KEY UNIQUE NOT NULL, direccion TEXT (150), gradoAcademico STRING (25) NOT NULL, dedicacion STRING (50) NOT NULL);

-- Table: Profesor_Materia
CREATE TABLE Profesor_Materia (codProf_Mat VARCHAR (10) PRIMARY KEY UNIQUE NOT NULL, profesor VARCHAR (10) REFERENCES Profesor (codProfesor) NOT NULL, materia VARCHAR (10) REFERENCES Materia (codMateria) NOT NULL, periodo VARCHAR (10) NOT NULL REFERENCES Periodo (codPeriodo) ON DELETE CASCADE ON UPDATE CASCADE, horario VARCHAR (10) REFERENCES Horario (codHorario) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL, dia STRING (10) NOT NULL, turno CHAR (1) NOT NULL);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
