@echo off
start python -m Pyro5.nameserver
start python src\slaves\slave1\slave1.py
start python src\slaves\slave2\slave2.py
start python src\slaves\slave3\slave3.py
start python src\slaves\slave4\slave4.py
start python src\master\app.py
pause