# frozen_string_literal: true

require 'rails_helper'
require 'capybara/rails'

RSpec.describe 'Authentication Redirection', type: :system, js: true do
  let(:user) { create(:user) }

  it 'redirects to the login page if the user is not logged in' do
    visit root_path

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_content('Para continuar, efetue login ou registre-se.')
  end
end
