//Raspa mensagens do chat aberto

var elements = document.querySelectorAll("div.im_message_text")
    for (i in elements) {
        console.log(elements[i].innerText)
    }