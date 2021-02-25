# Serve para apagar as subpastas de pastas de migracao que nao possuem mais arquivos. Assim restando somente as pastas que nao foram localizadas e ainda possuem arquivos.

$Empty = Get-ChildItem $Folder -Directory -Recurse | Where-Object {
	(Get-ChildItem $_.FullName -File -Recurse -Force).Count -eq 0
}

Foreach ($Dir in $Empty) {
	if (test-path $Dir.FullName) {
		Remove-Item -LiteralPath $Dir.FullName -recurse -force
	}
}