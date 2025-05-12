from crontab import CronTab

def main():
	cron = CronTab(user=True)

	# Scripts to move the logs into one centralized log
	pdfjob = cron.new(command = "/home/moreno/Desktop/Biblio-SB/src/slaves/slave1/pdfcronlog.sh") 
	pdfjob.setall("0 * * * *") # It executes every hour on the minute 0

	librosjob = cron.new(command = "/home/moreno/Desktop/Biblio-SB/src/slaves/slave2/libroscronlog.sh") 
	librosjob.setall("5 * * * *") # It executes every hour on the minute 5

	videosjob = cron.new(command = "/home/moreno/Desktop/Biblio-SB/src/slaves/slave3/videoscronlog.sh") 
	videosjob.setall("10 * * * *") # It executes every hour on the minute 10

	imagenesjob = cron.new(command = "/home/moreno/Desktop/Biblio-SB/src/slaves/slave4/imagenescronlog.sh") 
	imagenesjob.setall("15 * * * *") # It executes every hour on the minute 15

	cron.write()

if __name__ == "__main__":
	main()