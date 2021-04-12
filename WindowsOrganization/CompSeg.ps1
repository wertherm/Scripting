# Compare the difference between two TXT files, useful to see who follows you who doesn't follow you on Instagram, LinkedIn. Before you have to do the JS scraper on the target social network, to generate the TXTs

#Scrapers
#https://github.com/wertherm/Scripting/blob/master/Scraping/instagram.js
#https://github.com/wertherm/Scripting/blob/master/Scraping/linkedin.js

$Seguindo = Get-Content -Path Seguindo.txt
$Seguidores = Get-Content -Path Seguidores.txt

Compare $Seguindo $Seguidores
