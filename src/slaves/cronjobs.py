from crontab import CronTab

def main():
	cron = CronTab(user=True)

	# Scripts to move the logs into one centralized log
	pdfjob = cron.new(command = "slave1/pdfcronlog.sh") 
	pdfjob.setall("0 * * * *") # It executes every hour on the minute 0

	pdfjob = cron.new(command = "slave2/libroscronlog.sh") 
	pdfjob.setall("5 * * * *") # It executes every hour on the minute 5

	pdfjob = cron.new(command = "slave3/videoscronlog.sh") 
	pdfjob.setall("10 * * * *") # It executes every hour on the minute 10

	pdfjob = cron.new(command = "slave4/imagenescronlog.sh") 
	pdfjob.setall("15 * * * *") # It executes every hour on the minute 15

	cron.write()

if __name__ == "__main__":
	main()