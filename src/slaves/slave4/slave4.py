import Pyro5.api
from imagenes import Image


def main():
    daemon = Pyro5.api.Daemon()
    uri = daemon.register(Image)
    print("URI del esclavo:", uri)

    ns = Pyro5.api.locate_ns(host="localhost", port=9090)
    ns.register("esclavo.image", uri)

    print("Esclavo registrado con URI:", uri)
    print("Esperando solicitudes...")
    daemon.requestLoop()


if __name__ == "__main__":
    main()
