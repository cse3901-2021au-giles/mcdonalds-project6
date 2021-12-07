require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_home_path
    assert_response :success
  end


 # test "should get create_proj" do
  #  get admin_create_proj_url
   # assert_response :success
  #end
end
