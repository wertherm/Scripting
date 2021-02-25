@ECHO OFF
ECHO "Habilitando o Servico Windows Update"

sc config wuauserv start= auto
net start wuauserv
sc start wuauserv

pause