//Raspa dados relevantes do seu feed, criando uma estrutura em html.
//Não é necessário expandir cada feed para executar este script.

var elements = document.querySelectorAll(".mr-3 > .Link--muted"); //Seleciona o "span" com a classe "mr-3" e seu elemento interno "a" com a classe "Link--muted"
    for (i in elements) {
        //https://www.regular-expressions.info/numericranges.html
        //https://www.oreilly.com/library/view/regular-expressions-cookbook/9781449327453/ch06s07.html
        const regex = /1\d[1-9]|[2-9]\d{2,}|\d{4,}/g //Regex para raspar Githubers com mais de 100 Repositórios ou repositório com mais de 100 Stargazer
        //const regex = /k/g //Regex para raspar Repositorios acima de 999, pois o padrão muda para 1k, 10k, 100k

        if (elements[i].innerText.match(regex))
            console.log('<a href="' + elements[i].href + '">Resultado: ' + i + '</a><br />')
    }
