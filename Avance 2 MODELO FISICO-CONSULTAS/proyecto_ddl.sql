-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS normalizacion;

-- Seleccionar la base de datos
USE normalizacion;

CREATE TABLE USUARIO (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(100),
    documento VARCHAR(50),
    genero VARCHAR(20),
    email VARCHAR(100),
    contrasena VARCHAR(100),
    tipo_usuario VARCHAR(20) -- estudiante, profesor, administrador
);

CREATE TABLE ESTUDIANTE (
    id_usuario INT PRIMARY KEY,
    especializacion VARCHAR(100),
    id_nodo INT,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE PROFESOR (
    id_usuario INT PRIMARY KEY,
    telefono VARCHAR(20),
    area_principal_conocimiento VARCHAR(100),
    area_alternativa_conocimiento VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE ADMINISTRADOR (
    id_usuario INT PRIMARY KEY,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE CURSO (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre_curso VARCHAR(100),
    categoria VARCHAR(50),
    ruta VARCHAR(100),
    precio DECIMAL(10,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    semestre VARCHAR(20),
    año INT
);

CREATE TABLE TAREA (
    id_tarea INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tarea VARCHAR(100),
    descripcion_tarea TEXT,
    fecha_creacion DATE,
    fecha_entrega DATE,
    puntaje DECIMAL(5,2)
);

CREATE TABLE ENTREGA (
    id_usuario INT,
    id_tarea INT,
    archivo_estudiante TEXT,
    fecha_entrega DATE,
    puntaje DECIMAL(5,2),
    PRIMARY KEY (id_usuario, id_tarea),
    FOREIGN KEY (id_usuario) REFERENCES ESTUDIANTE(id_usuario),
    FOREIGN KEY (id_tarea) REFERENCES TAREA(id_tarea)
);

CREATE TABLE MATERIAL (
    id_material INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    descripcion TEXT
);

CREATE TABLE FORO (
    id_foro INT AUTO_INCREMENT PRIMARY KEY,
    nombre_foro VARCHAR(100),
    descripcion_foro TEXT,
    fecha_creacion DATE,
    fecha_terminacion DATE
);


CREATE TABLE MENSAJE_FORO (
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    id_foro INT,
    id_usuario_emisor INT,
    id_mensaje_respuesta INT,
    contenido TEXT,
    FOREIGN KEY (id_foro) REFERENCES FORO(id_foro),
    FOREIGN KEY (id_usuario_emisor) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_mensaje_respuesta) REFERENCES MENSAJE_FORO(id_mensaje)
);

CREATE TABLE MATRICULA (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    nombre_matricula VARCHAR(100),
    contrasena VARCHAR(100)
);

-- RELACIONES

CREATE TABLE DICTA (
    id_usuario INT,
    id_curso INT,
    PRIMARY KEY (id_usuario, id_curso),
    FOREIGN KEY (id_usuario) REFERENCES PROFESOR(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);

CREATE TABLE INTERESADO (
    id_usuario INT,
    id_curso INT,
    PRIMARY KEY (id_usuario, id_curso),
    FOREIGN KEY (id_usuario) REFERENCES ESTUDIANTE(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);

CREATE TABLE CREA (
    id_curso INT,
    id_material INT,
    PRIMARY KEY (id_curso, id_material),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso),
    FOREIGN KEY (id_material) REFERENCES MATERIAL(id_material)
);

CREATE TABLE PARTICIPA (
    id_usuario INT,
    id_foro INT,
    PRIMARY KEY (id_usuario, id_foro),
    FOREIGN KEY (id_usuario) REFERENCES ESTUDIANTE(id_usuario),
    FOREIGN KEY (id_foro) REFERENCES FORO(id_foro)
);

CREATE TABLE REALIZA_MATRICULA (
    id_usuario INT,
    id_matricula INT,
    PRIMARY KEY (id_usuario, id_matricula),
    FOREIGN KEY (id_usuario) REFERENCES ESTUDIANTE(id_usuario),
    FOREIGN KEY (id_matricula) REFERENCES MATRICULA(id_matricula)
);

CREATE TABLE PAGA (
    id_usuario INT,
    id_matricula INT,
    comprobante_pago VARCHAR(100),
    PRIMARY KEY (id_usuario, id_matricula),
    FOREIGN KEY (id_usuario) REFERENCES ESTUDIANTE(id_usuario),
    FOREIGN KEY (id_matricula) REFERENCES MATRICULA(id_matricula)
);

CREATE TABLE ENVIA (
    id_usuario_emisor INT,
    id_usuario_receptor INT,
    PRIMARY KEY (id_usuario_emisor, id_usuario_receptor),
    FOREIGN KEY (id_usuario_emisor) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_usuario_receptor) REFERENCES USUARIO(id_usuario)
);

CREATE TABLE ASIGNA (
    id_usuario INT,
    id_curso INT,
    PRIMARY KEY (id_usuario, id_curso),
    FOREIGN KEY (id_usuario) REFERENCES ADMINISTRADOR(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES CURSO(id_curso)
);
