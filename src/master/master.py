# Cliente Pyro5 que coordina con los esclavos
import Pyro5.api
from dotenv import load_dotenv
import os

load_dotenv()
NAME_SERVER_HOST = os.getenv("NAME_SERVER_HOST", "localhost")
NAME_SERVER_PORT = int(os.getenv("NAME_SERVER_PORT", 9091))
ESCLAVO_PREFIX = os.getenv("ESCLAVO_PREFIX", "esclavo.")


def consultar_esclavo(nombre_esclavo):
    ns = Pyro5.api.locate_ns(host=NAME_SERVER_HOST, port=NAME_SERVER_PORT)
    uri = ns.lookup(nombre_esclavo)
    esclavo = Pyro5.api.Proxy(uri)
    return esclavo.hello()


def listar_esclavos():
    ns = Pyro5.api.locate_ns(host=NAME_SERVER_HOST, port=NAME_SERVER_PORT)
    return ns.list(prefix=ESCLAVO_PREFIX)


def query(palabras):
    lista_esclavos = listar_esclavos()
    resultados = []
    for esclavo_nombre in lista_esclavos:
        if esclavo_nombre.startswith(ESCLAVO_PREFIX):
            ns = Pyro5.api.locate_ns(host=NAME_SERVER_HOST, port=NAME_SERVER_PORT)
            uri = ns.lookup(esclavo_nombre)
            esclavo = Pyro5.api.Proxy(uri)
            try:
                resultado = esclavo.buscar_por_titulo(palabras)
                resultados.append({esclavo_nombre: resultado})
            except Exception as e:
                print(f"Error al consultar el esclavo {esclavo_nombre}: {e}")

    return resultados
