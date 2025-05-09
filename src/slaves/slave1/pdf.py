import Pyro5.api
from connect_db import conectar_db


@Pyro5.api.expose
class Pdf:
    def __init__(self):
        self.conn = conectar_db("pdf")
        if not self.conn:
            raise Exception("No se pudo establecer conexión con la base de datos")

    def buscar_por_titulo(self, palabras):
        try:
            cursor = self.conn.cursor()
            query = (
                "SELECT title, type_doc, category FROM documentos WHERE "
                + " OR ".join([f"title ILIKE %s" for _ in palabras])
            )
            cursor.execute(query, [f"%{palabra}%" for palabra in palabras])
            resultados = cursor.fetchall()
            cursor.close()
            return resultados if resultados else None
        except Exception as e:
            return {"error": f"Error al realizar la búsqueda: {str(e)}"}

    def hello(self):
        return "Hola desde el servidor PDF!"
