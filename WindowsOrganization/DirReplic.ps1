# Gera uma replica da estrutura de subdiretorios de uma pasta. E util para replicar a mesma estrutura das pastas principais (Biologicas, Exatas, Humanas)

$pastaModelo = "C:\Users\Werther\Desktop\Principais"

#Caminho raiz do script
$local = "$(Get-Location)"

Get-ChildItem -Recurse -Directory |
	ForEach-Object {
		$pasta = $_.FullName
		$pasta = $pasta -replace [regex]::Escape($local), $pastaModelo #Tem que usar [regex]::Escape, pois senao ocorrera o erro: "The regular expression pattern is not valid."
		
		New-Item $pasta -ItemType Directory
	}