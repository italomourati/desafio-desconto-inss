# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'User Authentication', type: :system, js: true do
  let(:user) { create(:user) }

  it 'allows the user to login and logout' do
    visit new_user_session_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Entrar'

    expect(page).to have_content('Você entrou com sucesso.')

    click_button 'Sair'

    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end
end
