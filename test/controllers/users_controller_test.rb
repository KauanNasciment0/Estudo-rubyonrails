require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url

    assert_response :success
  end

  test "should post create" do
    post users_create_url, params: { user: { name: "Teste", email: "teste@email.com", password: "password", password_confirmation: "password" } }

    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
