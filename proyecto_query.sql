-- 1. Listar estudiantes (nombre completo, matrícula) ordenados alfabéticamente por año y semestre
SELECT u.nombre_usuario, m.nombre_matricula, c.año, c.semestre
FROM USUARIO u
JOIN ESTUDIANTE e ON u.id_usuario = e.id_usuario
JOIN REALIZA_MATRICULA rm ON e.id_usuario = rm.id_usuario
JOIN MATRICULA m ON rm.id_matricula = m.id_matricula
JOIN CURSO c ON c.año IS NOT NULL
ORDER BY c.año, c.semestre, u.nombre_usuario;

-- 2. Estudiantes por año y semestre concretos (ejemplo: año = 2025, semestre = '1')
SELECT u.nombre_usuario
FROM USUARIO u
JOIN ESTUDIANTE e ON u.id_usuario = e.id_usuario
JOIN INTERESADO i ON e.id_usuario = i.id_usuario
JOIN CURSO c ON i.id_curso = c.id_curso
WHERE c.año = 2025 AND c.semestre = '1';

-- 3. Cursos entre dos fechas
SELECT nombre_curso, fecha_inicio, fecha_fin
FROM CURSO
WHERE fecha_inicio BETWEEN '2025-03-01' AND '2025-09-01';

-- 4. Profesores (nombre + usuarios activos)
SELECT u.nombre_usuario, u.documento
FROM USUARIO u
JOIN PROFESOR p ON u.id_usuario = p.id_usuario;

-- 5. Cursos ordenados por categoría
SELECT nombre_curso, categoria
FROM CURSO
ORDER BY categoria;

-- 6. Cursos entre un rango de precio
SELECT nombre_curso, precio
FROM CURSO
WHERE precio BETWEEN 100.00 AND 900.00;

-- 7. Usuarios registrados pero no matriculados en cursos
SELECT u.nombre_usuario
FROM USUARIO u
LEFT JOIN ESTUDIANTE e ON u.id_usuario = e.id_usuario
LEFT JOIN REALIZA_MATRICULA rm ON u.id_usuario = rm.id_usuario
WHERE rm.id_usuario IS NULL AND u.tipo_usuario = 'estudiante';

-- 8. Cursos por categoría (ejemplo: Computación)
SELECT nombre_curso
FROM CURSO
WHERE categoria = 'Computación';

-- 9. Estudiantes que se han inscrito en un curso (ejemplo: id_curso = 1)
SELECT u.nombre_usuario
FROM USUARIO u
JOIN ESTUDIANTE e ON u.id_usuario = e.id_usuario
JOIN INTERESADO i ON e.id_usuario = i.id_usuario
WHERE i.id_curso = 1;

-- 10. Materiales creados por el profesor para un curso (ejemplo: curso id = 1)
SELECT m.titulo, m.descripcion
FROM MATERIAL m
JOIN CREA cr ON m.id_material = cr.id_material
JOIN CURSO c ON cr.id_curso = c.id_curso
WHERE c.id_curso = 1;

-- 11. Mensajes en un foro (ejemplo foro id = 1)
SELECT mf.contenido, u.nombre_usuario
FROM MENSAJE_FORO mf
JOIN USUARIO u ON mf.id_usuario_emisor = u.id_usuario
WHERE mf.id_foro = 1;

-- 12. Consulta adicional: Cantidad de tareas entregadas por cada estudiante
SELECT u.nombre_usuario, COUNT(e.id_tarea) AS tareas_entregadas
FROM USUARIO u
JOIN ESTUDIANTE s ON u.id_usuario = s.id_usuario
JOIN ENTREGA e ON s.id_usuario = e.id_usuario
GROUP BY u.nombre_usuario;
