require 'test_helper'

class ChoolControllerTest < ActionController::TestCase
  test "should get pin" do
    get :pin
    assert_response :success
  end

end
