import Pyro5.api
from connect_db import conectar_db


@Pyro5.api.expose
class Video:
    def __init__(self):
        pass

    def Video(self):

        return "Hola mundo desde el esclavo 3"

    def hello(self):
        return "Hola desde el servidor PDF!"
