require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'selenium/webdriver'

RSpec.describe 'INSS discount calculation', type: :system, js: true do
  let(:user) { create(:user) }

  setup do
    Capybara.default_driver = :selenium_chrome
    Capybara.javascript_driver = :selenium_chrome
  end

  it 'updates the INSS discount in real time' do
    visit root_path

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Entrar'

    expect(page).to have_content('Sair')

    visit new_preponent_path

    # fill_in 'preponent_salary', with: '3000'

    expect(page).to have_content('281,62', wait: 20)
  end
end
