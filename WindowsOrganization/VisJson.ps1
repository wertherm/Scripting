# Visualiza a estrutura de arvore de um Json. Pelas chaves e nao pelos valores do Json

# 1-Retirar a primeira chave vazia ("": "",) do json, senao ocorrera erro.

$json = Get-Content -Raw -Path principais.json | ConvertFrom-Json

Function Show-Object ($Object, $Depth = 0, $Name) {
    $Indent = if ($Depth++) { "    " * ($Depth - 2) }
    if ($Object -is [Array]) {
        If ($Name) { "$Indent$Name =" }
        foreach ($Item in $Object) {
            Show-Object $Item $Depth
        }
    }
    elseif ($Object -is [PSCustomObject]) {
        If ($Name) { "$Indent$Name =" }
        foreach ($Name in $Object.PSObject.Properties.Name) {
            Show-Object $Object.$Name $Depth $Name
        }
    }
    else {
        if ($Name) { "$Indent$Name = $Object" } else { "$Indent$Object" }
    }
}

#As chamadas devem ficar sempre abaixo da funcao
Show-Object $json