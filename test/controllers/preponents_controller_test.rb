require "test_helper"

class PreponentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preponent = preponents(:one)
  end

  test "should get index" do
    get preponents_url
    assert_response :success
  end

  test "should get new" do
    get new_preponent_url
    assert_response :success
  end

  test "should create preponent" do
    assert_difference("Preponent.count") do
      post preponents_url, params: { preponent: { address: @preponent.address, birth_date: @preponent.birth_date, city: @preponent.city, cpf: @preponent.cpf, inss_discount: @preponent.inss_discount, name: @preponent.name, neighborhood: @preponent.neighborhood, number: @preponent.number, personal_phone: @preponent.personal_phone, postal_code: @preponent.postal_code, reference_phone: @preponent.reference_phone, salary: @preponent.salary, state: @preponent.state } }
    end

    assert_redirected_to preponent_url(Preponent.last)
  end

  test "should show preponent" do
    get preponent_url(@preponent)
    assert_response :success
  end

  test "should get edit" do
    get edit_preponent_url(@preponent)
    assert_response :success
  end

  test "should update preponent" do
    patch preponent_url(@preponent), params: { preponent: { address: @preponent.address, birth_date: @preponent.birth_date, city: @preponent.city, cpf: @preponent.cpf, inss_discount: @preponent.inss_discount, name: @preponent.name, neighborhood: @preponent.neighborhood, number: @preponent.number, personal_phone: @preponent.personal_phone, postal_code: @preponent.postal_code, reference_phone: @preponent.reference_phone, salary: @preponent.salary, state: @preponent.state } }
    assert_redirected_to preponent_url(@preponent)
  end

  test "should destroy preponent" do
    assert_difference("Preponent.count", -1) do
      delete preponent_url(@preponent)
    end

    assert_redirected_to preponents_url
  end
end
