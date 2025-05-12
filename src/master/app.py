# Servidor Flask (recibe peticiones HTTP)
from flask import Flask, jsonify
from master import consultar_esclavo, listar_esclavos, query, query_type
from dotenv import load_dotenv
import os

# Carga variables de entorno desde el archivo .env
load_dotenv()
FLASK_PORT = int(os.getenv("FLASK_PORT", 5000))

app = Flask(__name__)


@app.route("/tipos", methods=["GET"])
def endpoint_listar_esclavos():
	"""Endpoint para listar todos los esclavos registrados."""
	try:
		esclavos = listar_esclavos()
		esclavos_dict = list(esclavos.keys())
		return jsonify(esclavos_dict), 200
	except Exception as e:
		return jsonify({"error": str(e)}), 500


@app.route("/tipos/<nombre_esclavo>", methods=["GET"])
def endpoint_consultar_esclavo(nombre_esclavo):
	"""Endpoint para consultar un esclavo específico."""
	try:
		nombre_completo = f"esclavo.{nombre_esclavo}"
		info = consultar_esclavo(nombre_completo)
		return jsonify({"nombre": nombre_esclavo, "informacion": info}), 200
	except Exception as e:
		return jsonify({"error": str(e)}), 500


@app.route("/query", methods=["POST", "GET"])
def endpoint_query():
	"""Endpoint para buscar documentos por título en todos los esclavos."""
	from flask import request

	try:
		if request.method == "POST":
			data = request.get_json()
			if not data:
				return (
					jsonify({"error": "Debe proporcionar un cuerpo JSON válido."}),
					400,
				)

			titulo = request.args.get("titulo", "")
			tipo_doc = request.args.get("tipo_doc", "")
			tipo_usuario = data.get("tipo_usuario", "")

			if titulo:
				palabras = titulo.split()
				resultados = query(palabras, tipo_usuario)
				return jsonify({"criterio": "titulo", "resultados": resultados}), 200

			if tipo_doc:
				tipos = tipo_doc.split()
				resultados = query_type(tipos, tipo_usuario)
				return jsonify({"criterio": "tipo_doc", "resultados": resultados}), 200

			return (
				jsonify(
					{"error": "Debe proporcionar 'titulo' o 'tipo_doc' para buscar."}
				),
				400,
			)
		elif request.method == "GET":
			titulo = request.args.get("titulo", "")
			tipo_doc = request.args.get("tipo_doc", "")

			if titulo:
				palabras = titulo.split()
				resultados = query(palabras)
				return jsonify({"criterio": "titulo", "resultados": resultados}), 200

			if tipo_doc:
				tipos = tipo_doc.split()
				resultados = query_type(tipos)
				return jsonify({"criterio": "tipo_doc", "resultados": resultados}), 200

			return (
				jsonify(
					{"error": "Debe proporcionar 'titulo' o 'tipo_doc' para buscar."}
				),
				400,
			)
	except Exception as e:
		return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
	app.run(host="0.0.0.0", port=FLASK_PORT)
