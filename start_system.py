import subprocess


def iniciar_programa(comando):
    subprocess.Popen(comando, shell=True)


def main():
    # Iniciar el servidor de nombres (DNS)
    iniciar_programa("python -m Pyro5.nameserver")

    # Iniciar sistema maestro y esclavos
    print("Iniciando esclavos...")
    iniciar_programa("python src/slaves/slave1/slave1.py")
    iniciar_programa("python src/slaves/slave2/slave2.py")
    iniciar_programa("python src/slaves/slave3/slave3.py")
    iniciar_programa("python src/slaves/slave4/slave4.py")
    iniciar_programa("python src/master/main.py")


if __name__ == "__main__":
    main()
