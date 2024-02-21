#language: pt

Funcionalidade: Catalogo de cafés
    Como um usuario do site, eu quero ver o catálago na pagina principal
    Para que eu possa escolher e saber mais sobre os produtos disponiveis

Cenario: Acessar o catalogo de cafés na pragina principal

    Quando acesso a página principal do Starbugs
    Então eu devo ver uma lista de cafés disponiveis

Cenario: Iniciar a compra de um café

    #Dado é uma pré condição
    Dado que estou na pagina principal da Starbugs
        E que desejo comprar o café "Expresso Gelado"
        E que esse produto custa "R$ 9,99"
        E que o custo de entrega é de "R$ 10,00"
    Quando inico a compra desse item
    Então devo ver a pagina de checkout com os detalhes do produto
        E o total da compra deve ser de "R$ 19,99"
@temp
Cenario: Café Indisponivel

    #Dado é uma pré condição
    Dado que estou na pagina principal da Starbugs
        E que desejo comprar o café "Expresso Cremoso"
    Quando inico a compra desse item
    Então devo ver uma popup informando que o produto está Indisponivel