require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'User Registration', type: :system, js: true do
  it 'allows users to register' do
    visit new_user_registration_path

    fill_in 'user_email', with: 'newuser@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Criar Conta'

    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
