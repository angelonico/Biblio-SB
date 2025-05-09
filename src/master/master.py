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
    ns = Pyro5.api.locate_ns(host=NAME_SERVER_HOST, port=NAME_SERVER_PORT)
    uri = ns.lookup("esclavo.pdf")
    esclavo = Pyro5.api.Proxy(uri)
    return esclavo.buscar_por_titulo(palabras)
