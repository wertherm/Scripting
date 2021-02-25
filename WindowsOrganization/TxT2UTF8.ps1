# Converte uma pasta repleta de TXTs com encodings de outros sistemas para UTF8.
# E util para quando precisar fazer migracoes inteiras do iCloud para o Windows e vice-versa

Get-ChildItem -recurse *.txt | ForEach-Object {
	$outputEncoding = [System.Text.Encoding]::GetEncoding(1252)

	$content = [System.IO.File]::ReadAllText($_.Fullname)
	[System.IO.File]::WriteAllText($_.Fullname, $content, $outputEncoding)

	$content = $_ | Get-Content
	Set-Content -PassThru $_.Fullname $content -Encoding UTF8 -Force
}