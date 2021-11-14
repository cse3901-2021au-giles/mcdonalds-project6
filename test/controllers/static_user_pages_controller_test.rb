require 'test_helper'

class StaticUserPagesControllerTest < ActionDispatch::IntegrationTest
  test "get login page" do
    get root_url
    assert_response :success
    assert_select "title", "Peer Evaluation Tool | Login"
  end

  test "get group page" do
    get static_user_pages_group_url
    assert_response :success
    assert_select "title", "Peer Evaluation Tool | Group"
  end

  test "get project" do
    get static_user_pages_project_url
    assert_response :success
    assert_select "title", "Peer Evaluation Tool | Project"
  end

  test "get evaluation" do
    get static_user_pages_evaluation_url
    assert_response :success
    assert_select "title", "Peer Evaluation Tool | Evaluation"
  end
end