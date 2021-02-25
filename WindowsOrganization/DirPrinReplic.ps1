# Vasculha recursivamente todos os arquivos dentro de um diretorio com uma estrutura semelhante as Pastas Principais e os move para uma nova estrutura atualizada (Pasta Modelo).

# 1-Criar a pasta modelo Principais na Desktop com o script JSON2Dir
# 2-Copiar este script para dentro da outra pasta de migração, que contém os arquivos que serão migrados para a pasta modelo Principais.
# 3-Depois de executado este script, executar o script ExDirVazios para apagar as subpastas da pasta de migração que não possuem mais arquivos. Assim restando somente as pastas que não foram localizadas e ainda possuem arquivos.

$pastaModelo = "C:\Users\Werther\Desktop\Principais"

#Caminho raiz do script
$local = "$(Get-Location)"

Get-ChildItem -Recurse *.* |
	ForEach-Object {
		$pastaMigracao = $_.FullName
		$pastaMigracao = $pastaMigracao -replace [regex]::Escape($local), $pastaModelo #Tem que usar [regex]::Escape, pois senao ocorrera o erro: "The regular expression pattern is not valid."

		$caminhoArquivo = $pastaMigracao -replace [regex]::Escape($_.Name), "" #Utilizando [regex]::Escape a busca fica mais precisa, senão alguns arquivos, como os que possuem parenteses no nome podem não ser encontrados!
		$pastaExiste = Test-Path -Path $caminhoArquivo
		
		if ($pastaExiste) {
			Move-Item -Path $_.FullName -Destination $pastaMigracao
		}
		else {
			"Pasta Inexistente: $caminhoArquivo"
		}
	}