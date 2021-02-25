# Script para limpar arquivos temporarios, quando voce copia sua fototeca do iPhone atraves do PenDrive iXpand.

Get-ChildItem *.heic,*.plist,*.jpg | 
    ForEach-Object{
	$fname = $_.Name
	$ext = $_.Extension
	$posNomeImgRecort = $fname.Indexof("full") #Posicao que identifica a imagem recortada de um print

	# 1 - Faz um parse atras de prints e exclui os arquivos redundantes, como a imagem original (photo.png) e caso exista a live photo (video-paired.mov) e a Live Photo Recortada (video-paired-full.mov), mantendo somente a imagem recortada (photo-full.jpg)
	if ($posNomeImgRecort -ne -1){ #Se for diferente de -1 e porque foi encontrado "full" no nome do arquivo analisado, portanto foi encontrada uma imagem recortada
		#Esta linha deve ficar dentro desse if, pois se ficar acima dele irao passar nomes de arquivos sem "full", resultando -1 e ocorrendo erro
		$nomeImgOrig = $fname.SubString(0, $posNomeImgRecort - 1) #$posNomeImgRecort tem a posicao de onde inicia "full", tem que subtrair 1, para retirar o hifen do nome tambem
		$nomeLivePhoto = $nomeImgOrig.Replace("photo", "video") #Troca o nome da imagem original de "photo" para "video", pois esse e o padrao do nome de Lives Photos
		$nomeLivePhotoRecort = $nomeLivePhoto #Atribui o mesmo nome da Live Photo, para localizar a Live Photo recortada tambem

		#Finaliza a renomeacao dos arquivos redundantes com suas extensoes
		$nomeImgOrig += ".jpg"
		$nomeImgOrigPNG += ".png"
		$nomeLivePhoto += "-paired.mov"
		$nomeLivePhotoRecort += "-paired-full.mov"

		#Verifica se os arquivos redundantes existem e os exclui
		$camComplImgOrig = [string](Get-Location) + "\$nomeImgOrig"
		if (Test-Path -path $camComplImgOrig){
			#Esta ocorrendo o erro: "Get-ChildItem : Could not find item", pois o looping Get-ChildItem busca "jpg", mas nao "png". Por isso nao ocorre este erro ao deletar os arquivos "png"
			Remove-Item -Path $nomeImgOrig
		}
		$camComplImgOrigPNG = [string](Get-Location) + "\$nomeImgOrigPNG"
		if (Test-Path -path $camComplImgOrigPNG){
			Remove-Item -Path $nomeImgOrigPNG
		}
		$camComplLivePhoto = [string](Get-Location) + "\$nomeLivePhoto"
		if (Test-Path -path $camComplLivePhoto){
			Remove-Item -Path $nomeLivePhoto
		}
		$camComplLivePhotoRecort = [string](Get-Location) + "\$nomeLivePhotoRecort"
		if (Test-Path -path $camComplLivePhotoRecort){
			Remove-Item -Path $nomeLivePhotoRecort
		}
	}

	# 2 - Exclui arquivos temporarios .heic e .plist
	if ($ext -eq ".heic" -or $ext -eq ".plist"){
		Remove-Item $_
	}
}