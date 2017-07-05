require 'rails_helper'

  feature 'User see his recipes' do
     scenario 'successfully' do
       user = User.create(email: 'joao@campus.com', password: '123456')

       other_user = User.create(email: 'teste@teste.com', password: '123456')

       arabian_cuisine = Cuisine.create(name: 'Arabe')

       main_type = RecipeType.create(name: 'Prato Principal')

       recipe = Recipe.create(title: 'Bolodecenoura', recipe_type: main_type,
                             cuisine: arabian_cuisine, difficulty: 'Médio',
                             cook_time: 50,
                             user: user,
                             ingredients: 'Farinha, açucar, cenoura',
                             method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')

      other_recipe = Recipe.create(title: 'Bolo de Banana', recipe_type: main_type,
                            cuisine: arabian_cuisine, difficulty: 'Médio',
                            cook_time: 40,
                            user: other_user,
                            ingredients: 'Farinha, açucar, banana',
                            method: 'Cozinhe a banana, corte em pedaços pequenos, misture com o restante dos ingredientes')

       visit root_path
       click_on 'Login'
       fill_in 'Email', with: 'joao@campus.com'
       fill_in 'Senha', with: '123456'
       click_on 'Enviar'

       click_on 'Minhas receitas'

       expect(page).to have_css('h1', text: recipe.title)

       expect(page).not_to have_css('h1', text: other_recipe.title)
  end
end
