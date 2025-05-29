# PROYECTO-BD
 info de la materia: BASE DE DATOS S2561-0701
 Estudiantes: Mariana Sanchez Araque - msancheza8@eafit.edu.co y Samuel Moncada Mejia  - smoncadam@eafit.edu.co
 Profesor: EDWIN NELSON MONTOYA MUNERA - emontoya@eafit.brightspace.com

# Proyecto Final – Sistema de Gestión de Datos
# 1. Descripción
Este proyecto consiste en el diseño, implementación y despliegue de una base de datos relacional para un sistema de gestión de cursos, inspirado en la plataforma NODO de la Universidad EAFIT. La solución incluye diagrama ER, modelo lógico, normalización, creación de tablas en MySQL, inserción de datos, consultas SQL y una aplicación tipo consola (Python) con funcionalidades diferenciadas por roles (administrador, profesor, estudiante).

## 1.1. Que aspectos cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)
Aspectos desarrollados
- Diagrama ER en Lucidchart.
- Modelo relacional y normalización (1FN, 2FN, 3FN).
- Implementación completa del modelo físico en MySQL (proyecto_ddl.sql).
- Poblado inicial de datos (script.sql).
- Consultas SQL requeridas (proyecto_query.sql).
- Aplicación de consola en Python (`appi.py`) con funcionalidades por rol: autenticación, matrícula, gestión de cursos, materiales, tareas, foros y reportes.

## 1.2. Que aspectos NO cumplió o desarrolló de la actividad propuesta por el profesor (requerimientos funcionales y no funcionales)
Despliegue en la nube: No hay evidencia de despliegue en AWS u otro servicio en la nube.
Gestión completa de archivos: La subida de materiales y tareas es simulada, no maneja archivos reales.


# 2. información general de diseño de alto nivel, arquitectura, patrones, mejores prácticas utilizadas.
Arquitectura:
-Aplicación cliente-servidor con conexión directa a MySQL
-Patrón MVC implícito (Modelo en la base de datos, Vista en la consola, Controlador en las funciones Python)
-Separación de responsabilidades por roles (admin, profesor, estudiante)

Patrones aplicados:
- Separación de responsabilidades.  
- Uso de relaciones fuertes con claves foráneas.  
- Menús estructurados y validaciones de entrada.

Mejores prácticas:
-Normalización de base de datos hasta 3FN
-Uso de transacciones en operaciones críticas
-Validación de entradas básica
-Manejo de errores en conexiones a BD
-Separación de credenciales en constante DB_CONFIG

# 3. Descripción del ambiente de desarrollo y técnico: lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.
- Lenguaje principal:Python 3.11  
- Base de datos: MySQL 8.0  
- Librerías utilizadas: pymysql==1.1.0 (para conexión a MySQL) y datetime (manejo de fechas)

## como se compila y ejecuta:
Instalar dependencias (si no se tiene pymysql):
pip install pymysql

Crear la base de datos en MySQL usando los archivos proporcionados:
mysql -u root -p < proyecto_ddl.sql  (Crear base de datos)
mysql -u root -p < script.sql      (Poblar datos iniciales )

Ejecutar la aplicación por consola:
python app.py  

## detalles del desarrollo
Lenguaje: Python 3.11
Base de datos: MySQL 8.0
Editor sugerido: Visual Studio Code
Tipo de interfaz: Interfaz por consola con menús diferenciados por rol (administrador, profesor, estudiante)
Estilo modular: Funciones separadas por rol y funcionalidad (login, matrícula, reportes, materiales, tareas, foros...)

## detalles técnicos
La base de datos se llama normalizacion
Las credenciales están en el archivo app.py, sección DB_CONFIG:
DB_CONFIG = {
    'host': 'localhost',
    'database': 'eafit',
    'user': 'root',
    'password': 'Fazelan20'
}
Si se despliega en nube, se deben modificar host, user, password y database para que coincidan con el servidor remoto.

## descripción y como se configura los parámetros del proyecto (ej: ip, puertos, conexión a bases de datos, variables de ambiente, parámetros, etc)
El proyecto requiere una conexión a una base de datos MySQL y se configura mediante el diccionario DB_CONFIG en el archivo app.py. Estos son los parámetros que se deben definir:
DB_CONFIG = {
    'host': 'localhost',        # Dirección IP o nombre del servidor MySQL (puede ser '127.0.0.1' o una IP remota)
    'database': 'eafit',        # Nombre de la base de datos. Se puede cambiar según el script DDL ejecutado 
    'user': 'root',             # Usuario con permisos sobre la base de datos
    'password': 'Fazelan20'     # Contraseña del usuario de la base de datos
}

# 4. Descripción del ambiente de EJECUCIÓN (en producción) lenguaje de programación, librerias, paquetes, etc, con sus numeros de versiones.
Entorno: Localhost
Lenguaje: Python 3.11
Base de datos: MySQL 8.0
Librerías: pymysql, datetime
IP/Nombres de servidor
Por defecto localhost, aunque puede adaptarse a AWS o cualquier nube si se configura correctamente en app.py.

Guía de uso del software:
Ingresar con usuario y contraseña (definidos en el script de prueba).
Admin: ana.admin@example.com / adminpass
Profesor: laurag@example.com / abcd1234
Estudiante: juanp@example.com / 1234pass

Navegar según tipo de usuario:
Administrador: puede asignar profesores, matricular estudiantes, generar reportes.
Profesor: puede gestionar tareas, materiales, foros, calificar entregas.
Estudiante: puede consultar materiales, entregar tareas, participar en foros.


# 5. otra información que considere relevante para esta actividad.
-La aplicación está diseñada para entorno educativo
-Las contraseñas se manejan en texto plano (no recomendado para producción)
-Se asume conexión directa y segura a MySQL

# referencias:
https://pymysql.readthedocs.io/ 
https://lucidchart.com/
https://youtu.be/RgLzqIFZg8s?si=24U59cJ7sOyCWUhu 
https://www.tutorialesprogramacionya.com/pythonya/detalleconcepto.php?punto=81&codigo=81&inicio=75#google_vignette
