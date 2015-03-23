require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get retreive" do
    get :retreive
    assert_response :success
  end

end
