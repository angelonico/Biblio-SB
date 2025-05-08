-- Crea las bases de datos
DROP DATABASE IF EXISTS pdf;
CREATE DATABASE pdf;
DROP DATABASE IF EXISTS libros;
CREATE DATABASE libros;
DROP DATABASE IF EXISTS videos;
CREATE DATABASE videos;
DROP DATABASE IF EXISTS imagenes;
CREATE DATABASE imagenes;

CREATE DATABASE pdf;
CREATE DATABASE libros;
CREATE DATABASE videos;
CREATE DATABASE imagenes;

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

\c pdf
INSERT INTO documentos (title, type_doc, category) VALUES
('Python Básico', 'PDF', 'Programación'),
('Python Avanzado', 'PDF', 'Programación'),
('Guía de Ciencia de Datos', 'PDF', 'Ciencia de Datos'),
('Libro de Cocina de Python', 'PDF', 'Programación'),
('Aprendiendo Python', 'PDF', 'Programación'),
('Python para Análisis de Datos', 'PDF', 'Ciencia de Datos'),
('Dominando Python', 'PDF', 'Programación'),
('Introducción a la Ciencia de Datos', 'PDF', 'Ciencia de Datos'),
('Aprendizaje Automático con Python', 'PDF', 'IA'),
('Aprendizaje Profundo con Python', 'PDF', 'IA'),
('Probando Python con pytest', 'PDF', 'Programación'),
('Python Eficaz', 'PDF', 'Programación'),
('Python Fluido', 'PDF', 'Programación'),
('Python de Alto Rendimiento', 'PDF', 'Programación'),
('Python Destilado', 'PDF', 'Programación'),
('Procesamiento del Lenguaje Natural con Python', 'PDF', 'IA'),
('Programación Probabilística con Python', 'PDF', 'IA'),
('¡La Guía del Autoestopista de Python!', 'PDF', 'Programación'),
('Automatiza las Tareas Aburridas con Python', 'PDF', 'Programación'),
('Desarrollo Web con Python y Flask', 'PDF', 'Desarrollo Web'),
('Django para Principiantes', 'PDF', 'Desarrollo Web'),
('Desarrollo de Pruebas Dirigido por Comportamiento con Python', 'PDF', 'Programación'),
('Construyendo APIs con Flask', 'PDF', 'Desarrollo Web'),
('Recetario de la Biblioteca Estándar de Python Moderna', 'PDF', 'Programación'),
('Programación en Python para el Principiante Absoluto', 'PDF', 'Programación'),
('Haciendo Matemáticas con Python', 'PDF', 'Matemáticas'),
('Piensa en Python', 'PDF', 'Programación'),
('Python en Pocas Palabras', 'PDF', 'Programación'),
('Programando Python', 'PDF', 'Programación'),
('Programación Central de Python', 'PDF', 'Programación'),
('Fundamentos de la Programación de Redes con Python', 'PDF', 'Redes'),
('Fundamentos de Estructuras de Datos en Python', 'PDF', 'Programación'),
('Desarrollo de Aplicaciones Web con Django', 'PDF', 'Desarrollo Web'),
('Creación de Interfaces Gráficas con Tkinter', 'PDF', 'Programación'),
('Análisis de Datos con Pandas', 'PDF', 'Ciencia de Datos'),
('Visualización de Datos con Matplotlib', 'PDF', 'Ciencia de Datos'),
('Introducción al Aprendizaje Profundo con Keras', 'PDF', 'IA'),
('Desarrollo de Juegos con Pygame', 'PDF', 'Programación'),
('Raspberry Pi con Python', 'PDF', 'Electrónica'),
('Programación de Microcontroladores con MicroPython', 'PDF', 'Electrónica'),
('Desarrollo de Extensiones para Chrome con JavaScript, Python y Flask', 'PDF', 'Desarrollo Web');


\c libros
INSERT INTO documentos (title, type_doc, category) VALUES
('El gran Gatsby', 'Libro', 'Ficción'),
('1984', 'Libro', 'Distopía'),
('Código limpio', 'Libro', 'Programación'),
('Orgullo y prejuicio', 'Libro', 'Romance'),
('Matar a un ruiseñor', 'Libro', 'Ficción'),
('El guardián entre el centeno', 'Libro', 'Ficción'),
('El Señor de los Anillos', 'Libro', 'Fantasía'),
('Harry Potter y la piedra filosofal', 'Libro', 'Fantasía'),
('El Hobbit', 'Libro', 'Fantasía'),
('Jane Eyre', 'Libro', 'Romance'),
('Cumbres borrascosas', 'Libro', 'Gótico'),
('El retrato de Dorian Gray', 'Libro', 'Gótico'),
('Rebelión en la granja', 'Libro', 'Distopía'),
('Un mundo feliz', 'Libro', 'Distopía'),
('Fahrenheit 451', 'Libro', 'Distopía'),
('El cuento de la criada', 'Libro', 'Distopía'),
('La carretera', 'Libro', 'Distopía'),
('El marciano', 'Libro', 'Ciencia ficción'),
('Dune', 'Libro', 'Ciencia ficción'),
('Fundación', 'Libro', 'Ciencia ficción'),
('Neuromante', 'Libro', 'Ciencia ficción'),
('Snow Crash', 'Libro', 'Ciencia ficción'),
'Cryptonomicon', 'Libro', 'Ficción Histórica'),
('El nombre del viento', 'Libro', 'Fantasía'),
('Las mentiras de Locke Lamora', 'Libro', 'Fantasía'),
('Dioses americanos', 'Libro', 'Fantasía'),
('Buenos presagios', 'Libro', 'Fantasía'),
('Neverwhere', 'Libro', 'Fantasía'),
('Jonathan Strange y el señor Norrell', 'Libro', 'Fantasía'),
('El océano al final del camino', 'Libro', 'Fantasía'),
('Stardust', 'Libro', 'Fantasía'),
('Cien años de soledad', 'Libro', 'Realismo mágico'),
('Rayuela', 'Libro', 'Ficción experimental'),
('La casa de los espíritus', 'Libro', 'Realismo mágico'),
('Aura', 'Libro', 'Gótico'),
('Los detectives salvajes', 'Libro', 'Literatura contemporánea'),
('El Aleph', 'Libro', 'Cuento'),
('Las aventuras de Sherlock Holmes', 'Libro', 'Misterio'),
('Crimen y castigo', 'Libro', 'Novela psicológica'),
('Orgullo y prejuicio', 'Libro', 'Romance'),
('Matar a un ruiseñor', 'Libro', 'Ficción social');


\c videos
INSERT INTO documentos (title, type_doc, category) VALUES
('Tutorial de Python', 'Video', 'Programación'),
('Curso intensivo de Ciencia de Datos', 'Video', 'Ciencia de Datos'),
('Fundamentos de Aprendizaje Automático', 'Video', 'IA'),
('Desarrollo Web Full Stack', 'Video', 'Desarrollo Web'),
('JavaScript para Principiantes', 'Video', 'Desarrollo Web'),
('React Explicado', 'Video', 'Desarrollo Web'),
('Angular Masterclass', 'Video', 'Desarrollo Web'),
('Fundamentos de Vue.js', 'Video', 'Desarrollo Web'),
('Node.js Esencial', 'Video', 'Desarrollo Web'),
('Diseño de Bases de Datos', 'Video', 'Bases de Datos'),
('Fundamentos de SQL', 'Video', 'Bases de Datos'),
('Administración de PostgreSQL', 'Video', 'Bases de Datos'),
('Bases de Datos NoSQL', 'Video', 'Bases de Datos'),
('Almacenamiento de Datos', 'Video', 'Bases de Datos'),
('Big Data Explicado', 'Video', 'Ciencia de Datos'),
('Tutorial de Hadoop', 'Video', 'Ciencia de Datos'),
('Spark para Principiantes', 'Video', 'Ciencia de Datos'),
('Aprendizaje Profundo con TensorFlow', 'Video', 'IA'),
('PyTorch para Aprendizaje Profundo', 'Video', 'IA'),
('Procesamiento del Lenguaje Natural', 'Video', 'IA'),
('Fundamentos de Visión por Computadora', 'Video', 'IA'),
('Aprendizaje por Refuerzo', 'Video', 'IA'),
('Curso de Hacking Ético', 'Video', 'Seguridad'),
('Fundamentos de Ciberseguridad', 'Video', 'Seguridad'),
('Seguridad de Redes', 'Video', 'Seguridad'),
('Conceptos de Sistemas Operativos', 'Video', 'Ciencia de la Computación'),
('Algoritmos y Estructuras de Datos', 'Video', 'Ciencia de la Computación'),
('Principios de Ingeniería de Software', 'Video', 'Ciencia de la Computación'),
('Arquitectura Limpia', 'Video', 'Desarrollo de Software'),
('Diseño Dirigido por Dominios', 'Video', 'Desarrollo de Software'),
('Arquitectura de Microservicios', 'Video', 'Desarrollo de Software'),
('Introducción a Docker', 'Video', 'DevOps'),
('Orquestación de Contenedores con Kubernetes', 'Video', 'DevOps'),
('Despliegue Continuo con Jenkins', 'Video', 'DevOps'),
('Git para el Control de Versiones', 'Video', 'DevOps'),
('Desarrollo de Aplicaciones Móviles con React Native', 'Video', 'Desarrollo Móvil'),
('Desarrollo de Aplicaciones Android con Kotlin', 'Video', 'Desarrollo Móvil'),
('Desarrollo de Aplicaciones iOS con Swift', 'Video', 'Desarrollo Móvil'),
('Diseño de Experiencia de Usuario (UX)', 'Video', 'Diseño'),
('Diseño de Interfaz de Usuario (UI)', 'Video', 'Diseño');


\c imagenes
INSERT INTO documentos (title, type_doc, category) VALUES
('Logo de Python', 'Imagen', 'Programación'),
('Visualización de Datos', 'Imagen', 'Ciencia de Datos'),
('Diagrama de IA', 'Imagen', 'IA'),
('Hoja de Ruta de Desarrollo Web', 'Imagen', 'Desarrollo Web'),
('Marcos de Trabajo de JavaScript', 'Imagen', 'Desarrollo Web'),
('Diseño de Esquema de Base de Datos', 'Imagen', 'Bases de Datos'),
('Diagrama de Uniones SQL', 'Imagen', 'Bases de Datos'),
('Ecosistema de Big Data', 'Imagen', 'Ciencia de Datos'),
('Algoritmos de Aprendizaje Automático', 'Imagen', 'IA'),
('Red Neuronal de Aprendizaje Profundo', 'Imagen', 'IA'),
('Amenazas de Ciberseguridad', 'Imagen', 'Seguridad'),
('Topología de Red', 'Imagen', 'Redes'),
('Ciclo de Vida del Desarrollo de Software', 'Imagen', 'Desarrollo de Software'),
('Diagrama de Clases UML', 'Imagen', 'Desarrollo de Software'),
('Diagrama ER', 'Imagen', 'Bases de Datos'),
('Diagrama de Flujo de Datos', 'Imagen', 'Ciencia de la Computación'),
('Diagrama de Arquitectura del Sistema', 'Imagen', 'Ciencia de la Computación'),
('Arquitectura de Computación en la Nube', 'Imagen', 'Computación en la Nube'),
('Flujo de Trabajo de DevOps', 'Imagen', 'DevOps'),
('Proceso de Desarrollo Ágil', 'Imagen', 'Gestión de Proyectos'),
('Marco de Trabajo Scrum', 'Imagen', 'Gestión de Proyectos'),
('Ejemplo de Tablero Kanban', 'Imagen', 'Gestión de Proyectos'),
('Tablero de Inteligencia Empresarial', 'Imagen', 'Inteligencia de Negocios'),
('Proceso de Minería de Datos', 'Imagen', 'Minería de Datos'),
('Flujo de Trabajo de Modelado Predictivo', 'Imagen', 'Ciencia de Datos'),
('Sistema de Información Geográfica (SIG)', 'Imagen', 'SIG'),
('Técnicas de Imagenología Médica', 'Imagen', 'Médico'),
('Planos Arquitectónicos', 'Imagen', 'Arquitectura'),
('Conceptos de Diseño de Interiores', 'Imagen', 'Diseño de Interiores'),
('Bocetos de Diseño de Modas', 'Imagen', 'Diseño de Modas'),
('Principios de Diseño Gráfico', 'Imagen', 'Diseño Gráfico'),
('Ilustración Digital', 'Imagen', 'Diseño Gráfico'),
('Fotografía de Paisaje', 'Imagen', 'Fotografía'),
('Retrato Fotográfico', 'Imagen', 'Fotografía'),
('Diseño de Logotipos', 'Imagen', 'Diseño Gráfico'),
('Branding Corporativo', 'Imagen', 'Diseño Gráfico'),
('Animación 2D', 'Imagen', 'Animación'),
('Animación 3D', 'Imagen', 'Animación'),
('Diseño de Personajes', 'Imagen', 'Diseño');
