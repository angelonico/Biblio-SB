import Pyro5.api


@Pyro5.api.expose
class Image:
    def __init__(self):
        pass

    def Image(self):
        return "Hola mundo desde el esclavo 4"
