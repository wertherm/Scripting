@ECHO OFF
ECHO "Adiando Ativacao do Windows por mais 30 dias!"

:: Comando que "rearma", reseta o tempo de ativacao do Windows para 30 dias novamente. So pode ser executado 4 vezes, totalizando 120 dias de adiamento da ativacao.

slmgr -rearm

pause