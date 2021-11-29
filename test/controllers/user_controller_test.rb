require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get group" do
    get user_group_url
    assert_response :success
  end

  test "should get proj" do
    get user_proj_url
    assert_response :success
  end

  test "should get eval" do
    get user_eval_url
    assert_response :success
  end
end
