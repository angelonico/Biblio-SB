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