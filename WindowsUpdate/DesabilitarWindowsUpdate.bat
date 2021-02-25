@ECHO OFF
ECHO "Desabilitando o Servico Windows Update"

:: Execute primeiro o arquivo WindowsUpdate.reg, depois reinicie o computador. Depois e so executar este BAT como administrador.

net stop wuauserv
sc stop wuauserv
sc config wuauserv start= disabled

pause