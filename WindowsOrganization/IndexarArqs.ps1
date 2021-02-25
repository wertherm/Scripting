# Indexa videos baixados do Youtube. E util para quando baixa-se playlists de outros canais com dezenas de videos. Como o caso de cursos, assim esse script coloca um indice em cada video de acordo com a data em que ele foi criado. Pois normalmente quando o Youtube-dl baixa uma playlist inteira, ele baixa na mesma ordem da playlist publica do Youtube.

$count = 1
Get-ChildItem *.* | Sort CreationTime |
	Rename-Item -NewName { '{0:D3} - {1}' -f $script:count++, $_.Name }