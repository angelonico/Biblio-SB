import Pyro5.api


@Pyro5.api.expose
class Libro:
    def __init__(self):
        pass

    def libro(self):
        return "Hola mundo desde el esclavo 2"
