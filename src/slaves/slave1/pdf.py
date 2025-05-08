import Pyro5.api


@Pyro5.api.expose
class Pdf:
    def __init__(self):
        pass

    def pdf(self):

        return "Hola mundo desde el esclavo 1"
