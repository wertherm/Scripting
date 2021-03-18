//Raspa githubers com mais de 100 repositórios do seu feed e já cria uma estrutura html.
//Não é necessário expandir cada feed de quem você segue.

var elements = document.querySelectorAll(".mr-3 > .Link--muted"); //Seleciona o "span" com a classe "mr-3" e seu elemento interno "a" com a classe "Link--muted"
    for (i in elements) {
        //https://www.regular-expressions.info/numericranges.html
        //https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch06s07.html
        const regex = /1\d[1-9]|[2-9]\d{2,}|\d{4,}/g

        if (elements[i].innerText.match(regex) >= 100)
            console.log('<a href="' + elements[i].href + '">Githuber ' + i + '</a><br />')
    }