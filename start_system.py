import subprocess
import signal
import os

procesos = []


def iniciar_programa(comando):
    proceso = subprocess.Popen(comando, shell=True)
    procesos.append(proceso)


def detener_programas():
    print("Deteniendo todos los procesos...")
    for proceso in procesos:
        if proceso.poll() is None:  # Verifica si el proceso sigue en ejecución
            os.kill(proceso.pid, signal.SIGTERM)  # Enviar señal para detener el proceso
    print("Todos los procesos han sido detenidos.")


def main():
    try:
        # Iniciar el servidor de nombres (DNS)
        iniciar_programa("python -m Pyro5.nameserver")

        # Iniciar sistema maestro y esclavos
        print("Iniciando esclavos...")
        iniciar_programa("python src/slaves/slave1/slave1.py")
        iniciar_programa("python src/slaves/slave2/slave2.py")
        iniciar_programa("python src/slaves/slave3/slave3.py")
        iniciar_programa("python src/slaves/slave4/slave4.py")
        iniciar_programa("python src/master/app.py")

        # Mantener el script en ejecución
        input("Presiona Enter para detener el sistema...\n")
    finally:
        detener_programas()


if __name__ == "__main__":
    main()
