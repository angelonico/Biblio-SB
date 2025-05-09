# Biblio-SB

Biblioteca digital distribuida. Sistema realizado para asigantura INFO288.

## Ejecucion

Primero se debe crear la base de datos con pstgress, dejamos un comando de ejemplo donde usamos el usuario postgress y la base de datos de postgres, para cargar los schemas:

```bash
psql -U postgres -d postgres -f script.sql
```

## Endpoints

Una vez cumplidos los requisitos, basta con ejecutar "start_system.py" para iniciar esclavos, maestro y DNS. El sistema funciona mediante endpoints:

#### Consultar esclavos

    http://localhost:4000/esclavos

Obtiene todos los esclavos que el maestro puede consultar.
