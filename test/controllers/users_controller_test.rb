require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get users_new_url
    assert_response :redirect
  end

  test "should post create" do
    post users_create_url, params: { user: { name: "Exemplo", email: "user@example.com", password: "password123" } }

    assert_response :success
  end
end
