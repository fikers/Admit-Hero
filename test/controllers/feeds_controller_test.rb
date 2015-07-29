require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  test "should get scholarships" do
    get :scholarships
    assert_response :success
  end

end
