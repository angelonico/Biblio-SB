# Cliente Pyro5 que coordina con los esclavos
import Pyro5.api
from dotenv import load_dotenv
import os
from connect_db import conectar_db

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


def query(palabras, tipo_usuario=None):
	lista_esclavos = listar_esclavos()
	resultados_generales = []
	categorias_interes = (
		obtener_categorias_interes(tipo_usuario) if tipo_usuario else []
	)
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

	# Aplicar ranking por coincidencias y priorizar categorías de interés
	resultados_rankeados = sorted(
		resultados_generales,
		key=lambda resultado: (
			rank_por_coincidencias(resultado, palabras),
			1 if resultado[2] in categorias_interes else 0,
		),
		reverse=True,
	)

	# Aplicar ranking por coincidencias
	resultados_rankeados = sorted(
		resultados_generales,
		key=lambda resultado: rank_por_coincidencias(resultado, palabras),
		reverse=True,  # Ordenar de mayor a menor puntaje
	)

	return resultados_rankeados


def query_type(tipos, tipo_usuario=None):
	resultados_generales = []
	categorias_interes = (
		obtener_categorias_interes(tipo_usuario) if tipo_usuario else []
	)
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

	# Priorizar categorías de interés
	resultados_priorizados = sorted(
		resultados_generales,
		key=lambda resultado: (1 if resultado[2] in categorias_interes else 0),
		reverse=True,
	)

	return resultados_priorizados


def rank_por_coincidencias(resultado, palabras):
	texto = resultado[0].lower()
	puntaje = sum(1 for palabra in palabras if palabra.lower() in texto)
	return puntaje


def obtener_categorias_interes(tipo_usuario):
	conn = conectar_db("users")
	if not conn:
		print("No se pudo conectar a la base de datos 'users'")
		return []

	try:
		cursor = conn.cursor()
		query = """
			SELECT c.name
			FROM users u
			JOIN user_categories uc ON u.id = uc.user_id
			JOIN categories c ON uc.category_id = c.id
			WHERE u.name = %s
		"""
		cursor.execute(query, ("ninio" if tipo_usuario == "niño" else tipo_usuario,))
		categorias = [fila[0] for fila in cursor.fetchall()]
		cursor.close()
		print(f"Categorías de interés para el usuario '{tipo_usuario}': {categorias}")
		return categorias
	except Exception as e:
		print(
			f"Error al obtener categorías de interés para el usuario '{tipo_usuario}': {e}"
		)
		return []
	finally:
		conn.close()
