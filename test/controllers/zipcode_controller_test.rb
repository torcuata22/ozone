require "test_helper"

class ZipcodeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get zipcode_home_url
    assert_response :success
  end
end
