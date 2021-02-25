# Faz um parse (analise sintatica) dentro de um diretorio, em lote no nome dos videos baixados de diversas playlists pelo yt-dl, atraves do seguinte comando:
#   youtube-dl -o "C:/Users/Werther/Desktop/Canal/%(playlist)s - %(title)s - %(uploader)s - %(upload_date)s.%(ext)s" --write-srt --sub-lang pt --convert-subs srt https://www.youtube.com/user/wertherm/playlists

# O nome da playlist, e um padrao que representa o nome dos diretorios. Para onde o video devera ser movido posteriormente, por exemplo:
#	Exatas-Fisica - Titulo do video - Canal - Data de Postagem do Video.mp4

Get-ChildItem *.mp4,*.mkv,*.webm,*.srt | 
    ForEach-Object{
        $arq = $_.Name
        $local = "$(Get-Location)"

        $split = New-Object System.Collections.Generic.List[string] #Usa generics para poder manipular os dados de forma mais inteligivel
        $split.AddRange($arq.Split('-')) #Separa o titulo do arquivo pelo caracter '-' e adiciona na lista
        
        #OBS: As seguinte linhas nao podem ficar abaixo de $split.RemoveRange(0, 2), senao o nome correto dos diretorios, nao sao atribuidos
        $dir1 = $split[0].Trim() #Atribui o nome do primeiro diretorio, retirando espacos
        $dir2 = $split[1].Trim() #Atribui o nome do segundo diretorio, retirando espacos

        $split.RemoveRange(0, 2) #Remove os dois nomes dos diretorios do titulo, a partir do indice 0 e removendo 2 itens
        $tituloArq = [string]::Join("-", $split).Trim() #Atribui o restante do titulo, sem os nomes dos diretorios, inserindo '-' entra cada item da lista e retira os espacos. Tambem da para usar: $tituloArq = -join $split
        $tituloArq = $tituloArq -replace '[^\w\s-.()]', '' #Troca todos caracteres diferentes de alfanumericos ([\w] ou [a-zA-Z0-9_]), seguidos com espacos [\s], hifen, ponto, parenteses. Mas o colchete aberto e colchete fechado teve que ser retirado, pois ocorre erro de interpretacao de metacaracter, assim '[^\w\s-.()\[\]]' foi alterado para '[^\w\s-.()]'.

        #No PowerShell nao existe a flag global (/g) das expressoes regulares, como no Perl. Isso acaba afetando as buscas, pois as regex do PowerShell so dao match na primeira ocorrencia.
        #Tem que usar a classe "regex", pois ela possui a flag global (/g) com o metodo "Matches"
        $resultTit = ([regex]::Matches($tituloArq, "\B[A-Z]+") | % {$_.value}) #Atribui cada match em $tituloArq, atraves de $_.value para o array $resultTit
        ForEach ($tit in $resultTit){$tituloArq = $tituloArq -ireplace $tit, $tit.ToLower()} #Depois para cada match e feita a substituicao dentro de $tituloArq dos matches em maiusculos para minusculos
        #Nao pode usar $tituloArq.replace(), como na linha abaixo, mas sim $tituloArq -ireplace. Pois se nao for insensitive, o algoritimo pode mudar apenas um caracter em um match inteiro e depois nao fara um segundo parse, por exemplo "OU QUANDO", ira alterar para "Ou QuANDO" na primeira passagem e na segunda continuara "Ou QuANDO". Com -ireplace na segunda passagem ficara "Ou Quando".
        #ForEach ($tit in $resultTit){$tituloArq = $tituloArq.replace($tit, $tit.ToLower())}
        
        Rename-Item -LiteralPath $_ -NewName $tituloArq #-LiteralPath serve para alguns casos que nao pode haver certos caracteres no titulo, como '['. Pois caso ocorra, o caracter e interpretrado como metacaracter e o arquivo nao e encontrado.
        
        $caminho = "$local\$dir1"
        if (-not (Test-Path $caminho)){
            New-Item "$caminho" -ItemType Directory
        }

        $subcaminho = "$caminho\$dir2"
        if (-not (Test-Path $subcaminho)){
            New-Item "$subcaminho" -ItemType Directory
        }

        Move-Item -Path $tituloArq -Destination "$subcaminho"

        "Arquivo ($tituloArq) movido para o diretorio $subcaminho"
    }