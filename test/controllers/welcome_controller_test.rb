require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get in" do
    get welcome_in_url
    assert_response :success
  end

end
