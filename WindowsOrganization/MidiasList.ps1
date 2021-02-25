# Cria uma lista em um TXT com todos seus filmes, series e documentarios (MP4, MKV e AVI)

$midias = ""
$qtdeMidias = 0

#Caminho raiz do script
$local = "$(Get-Location)\"

Get-ChildItem -Recurse *.mp4,*.mkv,*.avi | 
	ForEach-Object{
		$midia = $_.FullName -replace [regex]::Escape($local), "" #Tem que usar [regex]::Escape, senao ocorrera o erro: "The regular expression pattern is not valid."
		$midias += $midia + "`r`n" #Quebra a linha

		Clear-Host
		$qtdeMidias++
		"$qtdeMidias midias processadas!"

		#$midias #Printa no console, para dar um feedback simples, pois pode demorar algum tempo!
	}

$local = $local + "Lista de midias.txt"
$midias | Out-File -FilePath $local