require 'test_helper'

class StaticUserPagesControllerTest < ActionDispatch::IntegrationTest
  test "get login page" do
    get static_user_pages_login_url
    assert_response :success
  end

  test "get group page" do
    get static_user_pages_group_url
    assert_response :success
  end

  test "get project" do
    get static_user_pages_project_url
    assert_response :success
  end

  test "get evaluation" do
    get static_user_pages_evaluation_url
    assert_response :success
  end
end