//Raspa somente URLs de mensagens do seu próprio chat, sem as categorias. Não é necessário fazer o parseamento

var elements = document.querySelectorAll("a._1VzZY")
    for (i in elements) {
        console.log(elements[i].href)
    }

//Raspagem que deve ser feito o parseamento depois, pois virá muita informação redundante. Serve para trazer todos os textos das categorias, juntamente com as URLs das mensagens do seu próprio chat. Assim permitindo categorizar as URLs com os Regex posteriores do parseamento

var elements = document.querySelectorAll("span._1VzZY")
    for (i in elements) {
        console.log(elements[i].innerText)
    }