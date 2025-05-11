import Pyro5.api
from videos import Video
from dotenv import load_dotenv
import os

load_dotenv()


def main():
    name_server_host = os.getenv("NAME_SERVER_HOST", "localhost")
    name_server_port = int(os.getenv("NAME_SERVER_PORT", 9090))
    esclavo_nombre = os.getenv("ESCLAVO_PREFIX", "esclavo.") + "video"

    daemon = Pyro5.api.Daemon()
    uri = daemon.register(Video())
    print("URI del esclavo:", uri)

    ns = Pyro5.api.locate_ns(host=name_server_host, port=name_server_port)
    ns.register(esclavo_nombre, uri)

    print("Esclavo registrado con URI:", uri)
    print("Esperando solicitudes...")
    daemon.requestLoop()


if __name__ == "__main__":
    main()