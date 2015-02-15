require 'test_helper'

class CheckControllerTest < ActionController::TestCase
  test "should get checkers" do
    get :checkers
    assert_response :success
  end

  test "should get dashboard" do
    get :dashboard
    assert_response :success
  end

end
