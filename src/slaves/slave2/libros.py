import Pyro5.api
from connect_db import conectar_db


@Pyro5.api.expose
class Libro:
    def __init__(self):
        pass

    def libro(self):
        return "Hola mundo desde el esclavo 2"

    def hello(self):
        return "Hola desde el servidor PDF!"
