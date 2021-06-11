require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_path
    assert_response :success
  end

  test "should get about" do
    get pages_about_path
    assert_response :success
  end
end
