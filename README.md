# Biblio-SB

Biblioteca digital distribuida. Sistema realizado para asigantura INFO288.

#### Nombres de los tipos disponibles

- video
- pdf
- libro
- image

## Construcción .env

Se debe construir un .env con los siguientes valores, se agrega un ejemplo:

    NAME_SERVER_HOST = "localhost"
    NAME_SERVER_PORT = 9090
    ESCLAVO_PREFIX = "esclavo."
    FLASK_PORT=4000

## Startup

Primero se debe crear la base de datos con postgress, dejamos un comando de ejemplo donde usamos el usuario postgress y la base de datos de postgres, para cargar los schemas:

```bash
psql -U postgres -d postgres -f script.sql
```

Luego dejamos dos opciones para **levantar** el sistema, mediante un archivo .bat o con un script de Python, ambas opciones levantan el DNS, los esclavos, y el maestro.

```bash
python start_system.py
```

```bash
start_system.bat
```

## Endpoints

El sistema funciona mediante endpoints:

#### Listar esclavos

    http://localhost:4000/tipos

Obtiene todos los esclavos que el maestro tiene disponible.

#### Consultar esclavo

    http://localhost:4000/tipos/<tipo>

Consulta por algun tipo especifico, es decir, por un esclavo especifico. Entradas disponibles: pdf; libro; video; image

### Busqueda por titulo

    http://localhost:4000/query?titulo=Python+Cocina

Realiza una busqueda por titulo de documento a todos los esclavos disponibles. Devuelve los resultados en un orden, segun ranking de coincidencia.

### Busqueda por tipo

    http://localhost:4000/query?tipo_doc=pdf+videos

Devuelve todos los docuemntos que sean de alguno de los tipos consultados.
