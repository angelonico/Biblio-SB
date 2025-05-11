import subprocess
import signal
import os

procesos = []

# def options():
# 	option = -1
# 	while(option != 0):
# 		print("\n[*] Opciones: \n")
# 		print("	0. Salir\n	1. Buscar por titulo\n	2. Buscar por tipo de documento\n")
# 		option = int(input("Selecciona la opcion: "))

# 		if option == 1:
# 			title = input("Cual titulo deseas buscar?: ")
# 		if option == 2:
# 			document = input("	[+] Tipos de documentos disponibles: pdf, libros, videos, imagenes\n	Que tipo de documento deseas buscar?:")
# 			while document != "pdf" or document != "libros" or document != "videos" or document != "imagenes":
# 				document = input("	[!] Tipo de documento no valido\n	[+] Tipos de documentos disponibles: pdf, libros, videos, imagenes\n	Que tipo de documento deseas buscar?:")


# 		print(option)

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

		# options()
		input("Presiona Enter para detener el sistema...\n")
	finally:
		detener_programas()


if __name__ == "__main__":
	main()
