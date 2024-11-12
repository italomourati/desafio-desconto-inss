require "application_system_test_case"

class PreponentsTest < ApplicationSystemTestCase
  setup do
    @preponent = preponents(:one)
  end

  test "visiting the index" do
    visit preponents_url
    assert_selector "h1", text: "Preponents"
  end

  test "should create preponent" do
    visit preponents_url
    click_on "New preponent"

    fill_in "Address", with: @preponent.address
    fill_in "Birth date", with: @preponent.birth_date
    fill_in "City", with: @preponent.city
    fill_in "Cpf", with: @preponent.cpf
    fill_in "Inss discount", with: @preponent.inss_discount
    fill_in "Name", with: @preponent.name
    fill_in "Neighborhood", with: @preponent.neighborhood
    fill_in "Number", with: @preponent.number
    fill_in "Personal phone", with: @preponent.personal_phone
    fill_in "Postal code", with: @preponent.postal_code
    fill_in "Reference phone", with: @preponent.reference_phone
    fill_in "Salary", with: @preponent.salary
    fill_in "State", with: @preponent.state
    click_on "Create Preponent"

    assert_text "Preponent was successfully created"
    click_on "Back"
  end

  test "should update Preponent" do
    visit preponent_url(@preponent)
    click_on "Edit this preponent", match: :first

    fill_in "Address", with: @preponent.address
    fill_in "Birth date", with: @preponent.birth_date
    fill_in "City", with: @preponent.city
    fill_in "Cpf", with: @preponent.cpf
    fill_in "Inss discount", with: @preponent.inss_discount
    fill_in "Name", with: @preponent.name
    fill_in "Neighborhood", with: @preponent.neighborhood
    fill_in "Number", with: @preponent.number
    fill_in "Personal phone", with: @preponent.personal_phone
    fill_in "Postal code", with: @preponent.postal_code
    fill_in "Reference phone", with: @preponent.reference_phone
    fill_in "Salary", with: @preponent.salary
    fill_in "State", with: @preponent.state
    click_on "Update Preponent"

    assert_text "Preponent was successfully updated"
    click_on "Back"
  end

  test "should destroy Preponent" do
    visit preponent_url(@preponent)
    click_on "Destroy this preponent", match: :first

    assert_text "Preponent was successfully destroyed"
  end
end
