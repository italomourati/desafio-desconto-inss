# frozen_string_literal: true

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

    find('#preponent_salary').tap do |field|
      '3000'.chars.each do |char|
        field.send_keys(char)
        sleep 0.5
      end
    end

    expect(find('#preponent_inss_discount').value).to eq('281.64')
  end
end
