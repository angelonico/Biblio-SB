import Pyro5.api
from connect_db import conectar_db
import logging
import datetime
import os

# Definir logger
logger = logging.getLogger("pdf_logger")
logger.setLevel(logging.INFO)

# Definir ruta absoluta al log en la misma carpeta que este script
current_dir = os.path.dirname(os.path.abspath(__file__))
log_path = os.path.join(current_dir, "imageneslog.log")

file_handler = logging.FileHandler(log_path, encoding="utf-8")
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)


@Pyro5.api.expose
class Image:
	def __init__(self):
		self.conn = conectar_db("imagenes")
		if not self.conn:
			raise Exception("No se pudo establecer conexión con la base de datos")

	def buscar_por_titulo(self, palabras):
		try:
			initial_datetime = datetime.datetime.now()

			cursor = self.conn.cursor()
			query = (
				"SELECT title, type_doc, category FROM documentos WHERE "
				+ " OR ".join([f"title ILIKE %s" for _ in palabras])
			)
			cursor.execute(query, [f"%{palabra}%" for palabra in palabras])
			resultados = cursor.fetchall()
			cursor.close()

			final_datetime = datetime.datetime.now()
			self.logger.info(f"{initial_datetime}, {final_datetime}, esclavo-2, esclavo, {query}, {resultados}")

			return resultados if resultados else None

		except Exception as e:
			return {"error": f"Error al realizar la búsqueda: {str(e)}"}

	def buscar_por_tipo(self):
		try:
			initial_datetime = datetime.datetime.now()
			cursor = self.conn.cursor()
			query = "SELECT title, type_doc, category FROM documentos"
			cursor.execute(query)
			resultados = cursor.fetchall()
			cursor.close()
			
			final_datetime = datetime.datetime.now()
			self.logger.info(f"{initial_datetime}, {final_datetime}, esclavo-4, esclavo, {query}, {resultados}")
			
			return resultados if resultados else None
		except Exception as e:
			return {"error": f"Error al realizar la búsqueda: {str(e)}"}

	def hello(self):
		return "Hola desde el esclavo Image!"