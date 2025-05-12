# Biblio-SB

Biblioteca digital distribuida. Sistema realizado para asigantura INFO288.

#### Nombres de los tipos disponibles

- video
- pdf
- libro
- image

#### Tipos de usuario y rango etario

- niño: 0 - 12
- adolescente:13 - 17
- adulto joven: 18 - 25
- adulto: 26 - 64
- adulto mayor: 65 - 120

## Construcción .env

Se debe construir un .env con los siguientes valores, se agrega un ejemplo:

    NAME_SERVER_HOST = "localhost"
    NAME_SERVER_PORT = 9090
    ESCLAVO_PREFIX = "esclavo."
    FLASK_PORT=4000

*Notar que se puede copiar perfectamente a modo de ejemplo.*

## Startup

### 1. Se debe crear la base de datos con postgres, dejamos un comando de ejemplo donde usamos el usuario postgress y la base de datos de postgres, para cargar los schemas:

```bash
psql -U postgres -d postgres -f script.sql
```

### 2. Instalar crontab o cronie para ejecutar las tareas en tiempo periodoco

Para ubuntu:
```bash
sudo apt install crontab
```

Para Arch:
```bash
sudo pacman -S cronie
```

### 3. Levantar el servicio cron

Arch:
```bash
sudo systemctl start cronie
sudo systemctl enable cronie
```

### 4. Dar permisos de ejecucion para los script sh encargados de mover los logs:
```bash
chmod +x grantpermissions.sh
./grantpermissions.sh
```
### 5. Ejecutar el script en python que dejara las tareas cron corriendo:
```zsh
python3 src/slaves/cronjobs.py
``` 

### 6. Luego dejamos dos opciones para **levantar** el sistema, mediante un archivo .bat o con un script de Python, ambas opciones levantan el DNS, los esclavos, y el maestro.

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


### Tipo de usuario

Se debe enviar la consulta por POST con el siguiente json:

```json
{
    "tipo_usuario": "adolescente"
}
```
