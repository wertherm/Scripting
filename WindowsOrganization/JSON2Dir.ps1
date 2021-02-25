# Le um arquivo JSON e monta recursivamente uma estrutura de pastas, pelas chaves e não pelos valores do Json

# 1-Retirar a primeira chave vazia ("": "",) do json, senão ocorrerá erro.
# 2-A pasta Principais será gerada automaticamente na Desktop

$pastRaiz = "C:\Users\Werther\Desktop\Principais\"
$json = Get-Content -Raw -Path principais.json | ConvertFrom-Json

Function Show-Object ($Object, $Depth = 0, $Name, $Parent) {
    if ($Object -is [PSCustomObject]) {
        if ($Name) {
            if ($Parent){
                $Parent = "$Parent\$Name"

                $pasta = "$pastRaiz$Parent"
                New-Item $pasta -ItemType Directory
            }
            else{
                $Parent = "$Name"
            }
        }

        foreach ($Name in $Object.PSObject.Properties.Name) {
            Show-Object $Object.$Name $Depth $Name $Parent
        }
    }
    else {
        if ($Name) {
            $pasta = "$pastRaiz$Parent\$Name"
            New-Item $pasta -ItemType Directory
        }
    }
}

#As chamadas devem ficar sempre abaixo da funcao
Show-Object $json