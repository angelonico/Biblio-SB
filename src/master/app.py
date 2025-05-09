# Servidor Flask (recibe peticiones HTTP)
from flask import Flask, jsonify
from master import consultar_esclavo, listar_esclavos
from dotenv import load_dotenv
import os

# Carga variables de entorno desde el archivo .env
load_dotenv()
FLASK_PORT = int(os.getenv("FLASK_PORT", 5000))

app = Flask(__name__)


@app.route("/esclavos", methods=["GET"])
def endpoint_listar_esclavos():
    """Endpoint para listar todos los esclavos registrados."""
    try:
        esclavos = listar_esclavos()
        esclavos_dict = {nombre: uri for nombre, uri in esclavos.items()}
        return jsonify(esclavos_dict), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/esclavos/<nombre_esclavo>", methods=["GET"])
def endpoint_consultar_esclavo(nombre_esclavo):
    """Endpoint para consultar un esclavo específico."""
    try:
        nombre_completo = f"esclavo.{nombre_esclavo}"
        info = consultar_esclavo(nombre_completo)
        return jsonify({"nombre": nombre_esclavo, "informacion": info}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=FLASK_PORT)
