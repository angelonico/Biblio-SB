-- Crea las bases de datos
DROP DATABASE IF EXISTS pdf;
CREATE DATABASE pdf;
DROP DATABASE IF EXISTS libros;
CREATE DATABASE libros;
DROP DATABASE IF EXISTS videos;
CREATE DATABASE videos;
DROP DATABASE IF EXISTS imagenes;
CREATE DATABASE imagenes;

drop database if EXISTS users;
create database users;

-- Crea los usuarios con contraseñas
DROP USER IF EXISTS user_pdf;
CREATE USER user_pdf WITH PASSWORD 'pass_pdf';
DROP USER IF EXISTS user_libros;
CREATE USER user_libros WITH PASSWORD 'pass_libros';
DROP USER IF EXISTS user_videos;
CREATE USER user_videos WITH PASSWORD 'pass_videos';
DROP USER IF EXISTS user_imagenes;
CREATE USER user_imagenes WITH PASSWORD 'pass_imagenes';

-- Otorgar permisos a cada usuario para su respectiva base de datos
GRANT CONNECT ON DATABASE pdf TO user_pdf;
GRANT ALL PRIVILEGES ON DATABASE pdf TO user_pdf;
GRANT CONNECT ON DATABASE libros TO user_libros;
GRANT ALL PRIVILEGES ON DATABASE libros TO user_libros;
GRANT CONNECT ON DATABASE videos TO user_videos;
GRANT ALL PRIVILEGES ON DATABASE videos TO user_videos;
GRANT CONNECT ON DATABASE imagenes TO user_imagenes;
GRANT ALL PRIVILEGES ON DATABASE imagenes TO user_imagenes;

\c users
create table users (
    id SERIAL PRIMARY KEY,
    name varchar(15),
    edad int
);

\c pdf
CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    title TEXT,
    type_doc TEXT,
    category TEXT
);

GRANT ALL PRIVILEGES ON TABLE documentos TO user_pdf;
INSERT INTO documentos (title, type_doc, category) VALUES
('Python Basico', 'PDF', 'Programacion'),
('Python Avanzado', 'PDF', 'Programacion'),
('Guia de Ciencia de Datos', 'PDF', 'Ciencia de Datos'),
('Libro de Cocina de Python', 'PDF', 'Programacion'),
('Aprendiendo Python', 'PDF', 'Programacion'),
('Python para Analisis de Datos', 'PDF', 'Ciencia de Datos'),
('Dominando Python', 'PDF', 'Programacion'),
('Introduccion a la Ciencia de Datos', 'PDF', 'Ciencia de Datos'),
('Aprendizaje Automatico con Python', 'PDF', 'IA'),
('Aprendizaje Profundo con Python', 'PDF', 'IA'),
('Probando Python con pytest', 'PDF', 'Programacion'),
('Python Eficaz', 'PDF', 'Programacion'),
('Python Fluido', 'PDF', 'Programacion'),
('Python de Alto Rendimiento', 'PDF', 'Programacion'),
('Python Destilado', 'PDF', 'Programacion'),
('Procesamiento del Lenguaje Natural con Python', 'PDF', 'IA'),
('Programacion Probabilistica con Python', 'PDF', 'IA'),
('¡La Guia del Autoestopista de Python!', 'PDF', 'Programacion'),
('Automatiza las Tareas Aburridas con Python', 'PDF', 'Programacion'),
('Desarrollo Web con Python y Flask', 'PDF', 'Desarrollo Web'),
('Django para Principiantes', 'PDF', 'Desarrollo Web'),
('Desarrollo de Pruebas Dirigido por Comportamiento con Python', 'PDF', 'Programacion'),
('Construyendo APIs con Flask', 'PDF', 'Desarrollo Web'),
('Recetario de la Biblioteca Estandar de Python Moderna', 'PDF', 'Programacion'),
('Programacion en Python para el Principiante Absoluto', 'PDF', 'Programacion'),
('Haciendo Matematicas con Python', 'PDF', 'Matematicas'),
('Piensa en Python', 'PDF', 'Programacion'),
('Python en Pocas Palabras', 'PDF', 'Programacion'),
('Programando Python', 'PDF', 'Programacion'),
('Programacion Central de Python', 'PDF', 'Programacion'),
('Fundamentos de la Programacion de Redes con Python', 'PDF', 'Redes'),
('Fundamentos de Estructuras de Datos en Python', 'PDF', 'Programacion'),
('Desarrollo de Aplicaciones Web con Django', 'PDF', 'Desarrollo Web'),
('Creacion de Interfaces Graficas con Tkinter', 'PDF', 'Programacion'),
('Analisis de Datos con Pandas', 'PDF', 'Ciencia de Datos'),
('Visualizacion de Datos con Matplotlib', 'PDF', 'Ciencia de Datos'),
('Introduccion al Aprendizaje Profundo con Keras', 'PDF', 'IA'),
('Desarrollo de Juegos con Pygame', 'PDF', 'Programacion'),
('Raspberry Pi con Python', 'PDF', 'Electronica'),
('Programacion de Microcontroladores con MicroPython', 'PDF', 'Electronica'),
('Desarrollo de Extensiones para Chrome con JavaScript, Python y Flask', 'PDF', 'Desarrollo Web');

\c libros
CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    title TEXT,
    type_doc TEXT,
    category TEXT
);
GRANT ALL PRIVILEGES ON TABLE documentos TO user_libros;
INSERT INTO documentos (title, type_doc, category) VALUES
('El gran Gatsby', 'Libro', 'Ficcion'),
('1984', 'Libro', 'Distopia'),
('Codigo limpio', 'Libro', 'Programacion'),
('Orgullo y prejuicio', 'Libro', 'Romance'),
('Matar a un ruiseñor', 'Libro', 'Ficcion'),
('El guardian entre el centeno', 'Libro', 'Ficcion'),
('El Senor de los Anillos', 'Libro', 'Fantasia'),
('Harry Potter y la piedra filosofal', 'Libro', 'Fantasia'),
('El Hobbit', 'Libro', 'Fantasia'),
('Jane Eyre', 'Libro', 'Romance'),
('Cumbres borrascosas', 'Libro', 'Gotico'),
('El retrato de Dorian Gray', 'Libro', 'Gotico'),
('Rebelion en la granja', 'Libro', 'Distopia'),
('Un mundo feliz', 'Libro', 'Distopia'),
('Fahrenheit 451', 'Libro', 'Distopia'),
('El cuento de la criada', 'Libro', 'Distopia'),
('La carretera', 'Libro', 'Distopia'),
('El marciano', 'Libro', 'Ciencia ficcion'),
('Dune', 'Libro', 'Ciencia ficcion'),
('Fundacion', 'Libro', 'Ciencia ficcion'),
('Neuromante', 'Libro', 'Ciencia ficcion'),
('Snow Crash', 'Libro', 'Ciencia ficcion'),
('Cryptonomicon', 'Libro', 'Ficcion Historica'),
('El nombre del viento', 'Libro', 'Fantasia'),
('Las mentiras de Locke Lamora', 'Libro', 'Fantasia'),
('Dioses americanos', 'Libro', 'Fantasia'),
('Buenos presagios', 'Libro', 'Fantasia'),
('Neverwhere', 'Libro', 'Fantasia'),
('Jonathan Strange y el senor Norrell', 'Libro', 'Fantasia'),
('El oceano al final del camino', 'Libro', 'Fantasia'),
('Stardust', 'Libro', 'Fantasia'),
('Cien anos de soledad', 'Libro', 'Realismo magico'),
('Rayuela', 'Libro', 'Ficcion experimental'),
('La casa de los espiritus', 'Libro', 'Realismo magico'),
('Aura', 'Libro', 'Gotico'),
('Los detectives salvajes', 'Libro', 'Literatura contemporanea'),
('El Aleph', 'Libro', 'Cuento'),
('Las aventuras de Sherlock Holmes', 'Libro', 'Misterio'),
('Crimen y castigo', 'Libro', 'Novela psicologica'),
('Orgullo y prejuicio', 'Libro', 'Romance'),
('Matar a un ruiseñor', 'Libro', 'Ficcion social');


\c videos
CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    title TEXT,
    type_doc TEXT,
    category TEXT
);
GRANT ALL PRIVILEGES ON TABLE documentos TO user_videos;
INSERT INTO documentos (title, type_doc, category) VALUES
('Tutorial de Python', 'Video', 'Programacion'),
('Curso intensivo de Ciencia de Datos', 'Video', 'Ciencia de Datos'),
('Fundamentos de Aprendizaje Automatico', 'Video', 'IA'),
('Desarrollo Web Full Stack', 'Video', 'Desarrollo Web'),
('JavaScript para Principiantes', 'Video', 'Desarrollo Web'),
('React Explicado', 'Video', 'Desarrollo Web'),
('Angular Masterclass', 'Video', 'Desarrollo Web'),
('Fundamentos de Vue.js', 'Video', 'Desarrollo Web'),
('Node.js Esencial', 'Video', 'Desarrollo Web'),
('Diseno de Bases de Datos', 'Video', 'Bases de Datos'),
('Fundamentos de SQL', 'Video', 'Bases de Datos'),
('Administracion de PostgreSQL', 'Video', 'Bases de Datos'),
('Bases de Datos NoSQL', 'Video', 'Bases de Datos'),
('Almacenamiento de Datos', 'Video', 'Bases de Datos'),
('Big Data Explicado', 'Video', 'Ciencia de Datos'),
('Tutorial de Hadoop', 'Video', 'Ciencia de Datos'),
('Spark para Principiantes', 'Video', 'Ciencia de Datos'),
('Aprendizaje Profundo con TensorFlow', 'Video', 'IA'),
('PyTorch para Aprendizaje Profundo', 'Video', 'IA'),
('Procesamiento del Lenguaje Natural', 'Video', 'IA'),
('Fundamentos de Vision por Computadora', 'Video', 'IA'),
('Aprendizaje por Refuerzo', 'Video', 'IA'),
('Curso de Hacking Etico', 'Video', 'Seguridad'),
('Fundamentos de Ciberseguridad', 'Video', 'Seguridad'),
('Seguridad de Redes', 'Video', 'Seguridad'),
('Conceptos de Sistemas Operativos', 'Video', 'Ciencia de la Computacion'),
('Algoritmos y Estructuras de Datos', 'Video', 'Ciencia de la Computacion'),
('Principios de Ingenieria de Software', 'Video', 'Ciencia de la Computacion'),
('Arquitectura Limpia', 'Video', 'Desarrollo de Software'),
('Diseno Dirigido por Dominios', 'Video', 'Desarrollo de Software'),
('Arquitectura de Microservicios', 'Video', 'Desarrollo de Software'),
('Introduccion a Docker', 'Video', 'DevOps'),
('Orquestacion de Contenedores con Kubernetes', 'Video', 'DevOps'),
('Despliegue Continuo con Jenkins', 'Video', 'DevOps'),
('Git para el Control de Versiones', 'Video', 'DevOps'),
('Desarrollo de Aplicaciones Moviles con React Native', 'Video', 'Desarrollo Movil'),
('Desarrollo de Aplicaciones Android con Kotlin', 'Video', 'Desarrollo Movil'),
('Desarrollo de Aplicaciones iOS con Swift', 'Video', 'Desarrollo Movil'),
('Diseno de Experiencia de Usuario (UX)', 'Video', 'Diseno'),
('Diseno de Interfaz de Usuario (UI)', 'Video', 'Diseno');


\c imagenes
CREATE TABLE documentos (
    id SERIAL PRIMARY KEY,
    title TEXT,
    type_doc TEXT,
    category TEXT
);
GRANT ALL PRIVILEGES ON TABLE documentos TO user_imagenes;
INSERT INTO documentos (title, type_doc, category) VALUES
('Logo de Python', 'Imagen', 'Programacion'),
('Visualizacion de Datos', 'Imagen', 'Ciencia de Datos'),
('Diagrama de IA', 'Imagen', 'IA'),
('Hoja de Ruta de Desarrollo Web', 'Imagen', 'Desarrollo Web'),
('Marcos de Trabajo de JavaScript', 'Imagen', 'Desarrollo Web'),
('Diseno de Esquema de Base de Datos', 'Imagen', 'Bases de Datos'),
('Diagrama de Uniones SQL', 'Imagen', 'Bases de Datos'),
('Ecosistema de Big Data', 'Imagen', 'Ciencia de Datos'),
('Algoritmos de Aprendizaje Automatico', 'Imagen', 'IA'),
('Red Neuronal de Aprendizaje Profundo', 'Imagen', 'IA'),
('Amenazas de Ciberseguridad', 'Imagen', 'Seguridad'),
('Topologia de Red', 'Imagen', 'Redes'),
('Ciclo de Vida del Desarrollo de Software', 'Imagen', 'Desarrollo de Software'),
('Diagrama de Clases UML', 'Imagen', 'Desarrollo de Software'),
('Diagrama ER', 'Imagen', 'Bases de Datos'),
('Diagrama de Flujo de Datos', 'Imagen', 'Ciencia de la Computacion'),
('Diagrama de Arquitectura del Sistema', 'Imagen', 'Ciencia de la Computacion'),
('Arquitectura de Computacion en la Nube', 'Imagen', 'Computacion en la Nube'),
('Flujo de Trabajo de DevOps', 'Imagen', 'DevOps'),
('Proceso de Desarrollo Agil', 'Imagen', 'Gestion de Proyectos'),
('Marco de Trabajo Scrum', 'Imagen', 'Gestion de Proyectos'),
('Ejemplo de Tablero Kanban', 'Imagen', 'Gestion de Proyectos'),
('Tablero de Inteligencia Empresarial', 'Imagen', 'Inteligencia de Negocios'),
('Proceso de Mineria de Datos', 'Imagen', 'Mineria de Datos'),
('Flujo de Trabajo de Modelado Predictivo', 'Imagen', 'Ciencia de Datos'),
('Sistema de Informacion Geografica (SIG)', 'Imagen', 'SIG'),
('Tecnicas de Imagenologia Medica', 'Imagen', 'Medico'),
('Planos Arquitectonicos', 'Imagen', 'Arquitectura'),
('Conceptos de Diseno de Interiores', 'Imagen', 'Diseno de Interiores'),
('Bocetos de Diseno de Modas', 'Imagen', 'Diseno de Modas'),
('Principios de Diseno Grafico', 'Imagen', 'Diseno Grafico'),
('Ilustracion Digital', 'Imagen', 'Diseno Grafico'),
('Fotografia de Paisaje', 'Imagen', 'Fotografia'),
('Retrato Fotografico', 'Imagen', 'Fotografia'),
('Diseno de Logotipos', 'Imagen', 'Diseno Grafico'),
('Branding Corporativo', 'Imagen', 'Diseno Grafico'),
('Animacion 2D', 'Imagen', 'Animacion'),
('Animacion 3D', 'Imagen', 'Animacion'),
('Diseno de Personajes', 'Imagen', 'Diseno');
