import Pyro5.api


@Pyro5.api.expose
class Video:
    def __init__(self):
        pass

    def Video(self):

        return "Hola mundo desde el esclavo 3"
