require 'rails_helper'

feature 'User favorite recipe' do
  scenario 'successfully' do
    #cria os dados necessários
    user = User.create(email: 'joao@campus.com', password: '123456')

    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    appetizer_type = RecipeType.create(name: 'Entrada')
    main_type = RecipeType.create(name: 'Prato Principal')
    dessert_type = RecipeType.create(name: 'Sobremesa')

    recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type: main_type,
                            cuisine: arabian_cuisine, difficulty: 'Médio',
                            cook_time: 50,
                            user: user,
                            ingredients: 'Farinha, açucar, cenoura',
                            method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

    other_recipe = Recipe.create(title: 'Bolo de banana', recipe_type: dessert_type,
                                                    cuisine: brazilian_cuisine, difficulty: 'Médio',
                                                    cook_time: 30,
                                                    user: user,
                                                    ingredients: 'Farinha, açucar, banana',
                                                    method: 'Cozinhe a banana, corte em pedaços pequenos, misture com o restante dos ingredientes')

    # simula a ação do usuário
    login_as(user)

    visit root_path
    click_on 'Bolo de cenoura'
    click_on 'Favoritar'

    click_on 'Receitas favoritas'

    expect(page).to have_css('h1', text: 'Minhas receitas favoritas')
    expect(page).to have_css('h1', text: 'Bolo de cenoura')
    expect(page).not_to have_css('h1', text: 'Bolo de banana')
  end

end
