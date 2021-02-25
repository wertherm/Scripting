# Converte recursivamente todos os Gifs em Mp4, dentro de diretorios aninhados.

Get-ChildItem -r *.gif |
	foreach-object {
		$novoArquivo = $_.FullName.Remove($_.FullName.Length - $_.Extension.Length) + ".mp4"
		ffmpeg -i "$_" $novoArquivo
	}