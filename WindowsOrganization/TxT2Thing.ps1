# Extrai todos os padroes abaixo, de dentro de todas suas anotacoes TXT, mostrando o caminho daquelas que foram localizadas.

#Da match em uma tabulacao, para encontrar anotacoes estruturadas. Facilitando a extracao de anotacoes simples ou avulsas.
#$regex = "\t{1}"
#Da match em todas as URLs
$regex = "\b((?:[a-z][\w-]+:(?:/{1,3}|[a-z0-9%])|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:]))"

Get-ChildItem -r *.txt |
	Foreach-Object {
		$arquivoTXT = Get-Content -Path $_

		#Tem que usar a classe "regex", pois ela possui a flag global (/g) com o metodo "Matches"
		$thing = ([regex]::Matches($arquivoTXT, $regex))
		
		if ($thing.Success) {
			$_.FullName
			$thing.Value
			
			Write-Host
		}
	}