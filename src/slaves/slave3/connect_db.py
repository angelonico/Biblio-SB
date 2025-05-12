# Configuración DB para este esclavo
import psycopg
import json
import os


# Cargar configuración desde un archivo JSON
def cargar_configuracion():
    ruta_config = os.path.join(os.path.dirname(__file__), "../../../db_config.json")
    try:
        with open(ruta_config, "r") as archivo:
            return json.load(archivo)
    except FileNotFoundError:
        print(f"Error: No se encontró el archivo de configuración '{ruta_config}'")
        return None
    except json.JSONDecodeError as e:
        print(f"Error al leer el archivo JSON: {e}")
        return None


# Función para conectar a una base de datos específica
def conectar_db(db_nombre):
    db_config = cargar_configuracion()
    if not db_config:
        return None

    config = db_config.get(db_nombre)
    if not config:
        print(f"Error: Configuración no encontrada para la base de datos '{db_nombre}'")
        return None

    try:
        conn = psycopg.connect(**config)
        print(
            f"Conexión exitosa a la base de datos '{db_nombre}' como usuario '{config['user']}'"
        )
        return conn
    except psycopg.Error as e:
        print(f"Error al conectar a la base de datos '{db_nombre}': {e}")
        return None


# Ejemplo de uso: conectar a cada base de datos
if __name__ == "__main__":
    conn_pdf = conectar_db("videos")
    if conn_pdf:
        conn_pdf.close()
