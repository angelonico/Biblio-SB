import Pyro5.api
from flask import Flask, jsonify

app = Flask(__name__)


def consultar_esclavo(nombre_esclavo):
    ns = Pyro5.api.locate_ns(host="localhost", port=9090)
    uri = ns.lookup(nombre_esclavo)
    esclavo = Pyro5.api.Proxy(uri)
    return esclavo.obtener_informacion()


def listar_esclavos():
    ns = Pyro5.api.locate_ns(host="localhost", port=9090)
    return ns.list(prefix="esclavo.")


@app.route("/esclavos", methods=["GET"])
def endpoint_listar_esclavos():
    try:
        esclavos = listar_esclavos()
        esclavos_dict = {nombre: uri for nombre, uri in esclavos.items()}
        return jsonify(esclavos_dict), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/esclavos/<nombre_esclavo>", methods=["GET"])
def endpoint_consultar_esclavo(nombre_esclavo):
    try:
        info = consultar_esclavo(nombre_esclavo)
        return jsonify({"nombre": nombre_esclavo, "informacion": info}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=4000)
