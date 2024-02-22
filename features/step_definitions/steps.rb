Quando('acesso a página principal do Starbugs') do
    visit 'https://starbugs.vercel.app'
end
  
Então('eu devo ver uma lista de cafés disponiveis') do
    # find() Funcão que recebe uma chave seletora para encontrar elementos no html
    # all()  Funcão que recebe uma chave seletora para encontrar elementos no html passando a posição
    products = all('.coffee-item');
    expect(products.size).to be > 0;
end

Dado('que estou na pagina principal da Starbugs') do
    visit 'https://starbugs.vercel.app'
end

Dado('que desejo comprar o seguinte produto:') do |table|
    # table is a Cucumber::MultilineArgument::DataTable
    @product_name = table.hashes[0][:product] #puts é o comando para imprimir no console
    @product_price = table.hashes[0][:price]
    @delivery_price = table.hashes[0][:delivery]
end
  
Quando('inico a compra desse item') do
    product = find('.coffee-item', text: @product_name)
    product.find('.buy-coffee').click
end
  
Então('devo ver a pagina de checkout com os detalhes do produto') do
    product_titel = find('.item-details h1')
    expect(product_titel.text).to eql @product_name

    product_price = find('.subtotal .sub-price')
    expect(product_price.text).to eql @product_price

    delivery = find('.delivery-price')
    expect(delivery.text).to eql @delivery_price
end

Então('o total da compra deve ser de {string}') do |total_price|
    price = find('.total-price')
    expect(price.text).to eql total_price
end

Então('devo ver uma popup informando que o produto está Indisponivel') do
    popup = find('.swal2-html-container')
    expect(popup.text).to eql 'Produto indisponível'
end