require 'rails_helper'

feature 'Admin edit cuisine' do
  scenario 'successfully' do
    #Cria os dados necessarios
    arabian_cuisine = Cuisine.create(name: 'Arabee')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    #simula a ação
    visit root_path
    click_on 'Arabee'
    click_on 'Editar'

    fill_in 'Nome', with: 'Arabe'

    click_on 'Enviar'

    expect(page).to have_css('h1', text: 'Arabe')
  end

  scenario 'and all fields must be filled' do
    #Cria os dados necessarios
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileiraa')

    #simula a acao do usuario
    visit root_path
    click_on 'Brasileiraa'
    click_on 'Editar'

    fill_in 'Nome', with: ''

    click_on 'Enviar'

    expect(page).to have_content('Você deve informar o nome da cozinha')
  end

  scenario 'and cannot have duplicated' do
    #Criando os dados necessarios
    arabian_cuisine = Cuisine.create(name: 'Arabe')
    brazilian_cuisine = Cuisine.create(name: 'Brasileira')

    #simula acao do usuario
    visit root_path
    click_on 'Brasileira'
    click_on 'Editar'

    fill_in 'Nome', with: 'Arabe'

    click_on 'Enviar'

    expect(page).to have_content('Não pode existir cozinhas duplicadas')
  end
end
