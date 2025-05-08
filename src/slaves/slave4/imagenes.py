import Pyro5.api
from connect_db import conectar_db


@Pyro5.api.expose
class Image:
    def __init__(self):
        pass

    def Image(self):
        return "Hola mundo desde el esclavo 4"

    def hello(self):
        return "Hola desde el servidor PDF!"
