require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get create_user" do
    get admin_create_user_url
    assert_response :success
  end

  test "should get create_group" do
    get admin_create_group_url
    assert_response :success
  end

  test "should get create_proj" do
    get admin_create_proj_url
    assert_response :success
  end
end
