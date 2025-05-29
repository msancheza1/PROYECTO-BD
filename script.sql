INSERT INTO USUARIO (nombre_usuario, documento, genero, email, contrasena, tipo_usuario)
VALUES 
('Juan Pérez', '12345678', 'Masculino', 'juanp@example.com', '1234pass', 'estudiante'),
('Laura Gómez', '87654321', 'Femenino', 'laurag@example.com', 'abcd1234', 'profesor'),
('Ana Torres', '11223344', 'Femenino', 'ana.admin@example.com', 'adminpass', 'administrador');


INSERT INTO ESTUDIANTE (id_usuario, especializacion, id_nodo)
VALUES (1, 'Inteligencia Artificial', 101);

INSERT INTO PROFESOR (id_usuario, telefono, area_principal_conocimiento, area_alternativa_conocimiento)
VALUES (2, '555-1234', 'Bases de Datos', 'Redes');

INSERT INTO ADMINISTRADOR (id_usuario)
VALUES (3);

INSERT INTO CURSO (nombre_curso, categoria, ruta, precio, fecha_inicio, fecha_fin, semestre, año)
VALUES 
('Programación I', 'Computación', 'ruta_prog1', 300.00, '2025-03-01', '2025-07-01', '1', 2025),
('Redes de Computadoras', 'Sistemas', 'ruta_redes', 350.00, '2025-03-01', '2025-07-01', '1', 2025);

INSERT INTO MATRICULA (nombre_matricula, contrasena)
VALUES ('Matricula 2025-A', 'mat2025pass');

INSERT INTO TAREA (nombre_tarea, descripcion_tarea, fecha_creacion, fecha_entrega, puntaje)
VALUES 
('Tarea 1', 'Resolver ejercicios de recursividad', '2025-03-05', '2025-03-20', 10.0),
('Tarea 2', 'Diseñar una red LAN', '2025-03-10', '2025-03-25', 15.0);

INSERT INTO ENTREGA (id_usuario, id_tarea, archivo_estudiante, fecha_entrega, puntaje)
VALUES 
(1, 1, 'recursividad.pdf', '2025-03-18', 9.5),
(1, 2, 'redLAN.zip', '2025-03-24', 14.0);

INSERT INTO MATERIAL (titulo, descripcion)
VALUES 
('PDF Recursividad', 'Guía completa sobre recursividad en Python'),
('Presentación Redes', 'Slides sobre topologías de red');

INSERT INTO FORO (nombre_foro, descripcion_foro, fecha_creacion, fecha_terminacion)
VALUES 
('Foro Introducción a la Programación', 'Discusión sobre el curso', '2025-03-01', '2025-07-01');

INSERT INTO MENSAJE_FORO (id_foro, id_usuario_emisor, id_mensaje_respuesta, contenido)
VALUES 
(1, 1, NULL, '¿Alguien entendió el ejercicio 3?');

INSERT INTO MENSAJE_FORO (id_foro, id_usuario_emisor, id_mensaje_respuesta, contenido)
VALUES 
(1, 2, 1, 'Sí, puedo explicártelo mañana.');

-- Profesor dicta cursos
INSERT INTO DICTA (id_usuario, id_curso)
VALUES (2, 1), (2, 2);

-- Estudiante interesado en cursos
INSERT INTO INTERESADO (id_usuario, id_curso)
VALUES (1, 1), (1, 2);

-- Curso crea material
INSERT INTO CREA (id_curso, id_material)
VALUES (1, 1), (2, 2);

-- Estudiante participa en foro
INSERT INTO PARTICIPA (id_usuario, id_foro)
VALUES (1, 1);

-- Estudiante realiza matrícula
INSERT INTO REALIZA_MATRICULA (id_usuario, id_matricula)
VALUES (1, 1);

-- Estudiante paga matrícula
INSERT INTO PAGA (id_usuario, id_matricula, comprobante_pago)
VALUES (1, 1, 'comp123.pdf');

-- Comunicación entre usuarios
INSERT INTO ENVIA (id_usuario_emisor, id_usuario_receptor)
VALUES (1, 2), (2, 1);

-- Administrador asigna curso
INSERT INTO ASIGNA (id_usuario, id_curso)
VALUES (3, 1);
