require 'rails_helper'

feature 'User sign in' do
  scenario 'successfully' do
    user = User.create(email: 'joao@campus.com', password: '123456')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'joao@campus.com'
    fill_in 'Senha', with: '123456'
    click_on 'Enviar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Olá joao@campus.com')
    expect(page).not_to have_link('Login')
  end

  scenario 'and sign out' do
    user = User.create(email: 'joao@campus.com', password: '123456')

    visit root_path
    click_on 'Login'
    fill_in 'Email', with: 'joao@campus.com'
    fill_in 'Senha', with: '123456'
    click_on 'Enviar'
    click_on 'Logout'

    expect(current_path).to eq root_path
    expect(page).not_to have_link('Logout')
    expect(page).to have_link('Login')
  end
end
