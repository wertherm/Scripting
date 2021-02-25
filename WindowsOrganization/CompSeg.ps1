# Compara a diferenca entre dois arquivos TXTs, util para ver quem voce segue que nao te segue no Instagram, LinkedIn e Twitter. Antes tem que fazer o scraper JS na rede-social alvo, para gerar o TXT.

$Seguindo = Get-Content -Path Seguindo.txt
$Seguidores = Get-Content -Path Seguidores.txt

Compare $Seguindo $Seguidores