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
    resultados_generales = []
    for esclavo_nombre in lista_esclavos:
        if esclavo_nombre.startswith(ESCLAVO_PREFIX):
            ns = Pyro5.api.locate_ns(host=NAME_SERVER_HOST, port=NAME_SERVER_PORT)
            uri = ns.lookup(esclavo_nombre)
            esclavo = Pyro5.api.Proxy(uri)
            try:
                resultado = esclavo.buscar_por_titulo(palabras)
                if resultado:
                    resultados_generales.extend(resultado)
            except Exception as e:
                print(f"Error al consultar el esclavo {esclavo_nombre}: {e}")

    if not resultados_generales:
        return "No se encontraron resultados"

    # Aplicar ranking por coincidencias
    resultados_rankeados = sorted(
        resultados_generales,
        key=lambda resultado: rank_por_coincidencias(resultado, palabras),
        reverse=True,  # Ordenar de mayor a menor puntaje
    )

    return resultados_rankeados


def query_type(tipos):
    resultados_generales = []
    for tipo in tipos:
        esclavo_nombre = f"{ESCLAVO_PREFIX}{tipo}"
        ns = Pyro5.api.locate_ns(host=NAME_SERVER_HOST, port=NAME_SERVER_PORT)
        try:
            uri = ns.lookup(esclavo_nombre)
            esclavo = Pyro5.api.Proxy(uri)
            resultado = esclavo.buscar_por_tipo()
            if resultado:
                resultados_generales.extend(resultado)
        except Exception as e:
            print(f"Error al consultar el esclavo {esclavo_nombre}: {e}")

    if not resultados_generales:
        return "No se encontraron resultados"

    return resultados_generales


def rank_por_coincidencias(resultado, palabras):
    texto = resultado[0].lower()
    puntaje = sum(1 for palabra in palabras if palabra.lower() in texto)
    return puntaje
