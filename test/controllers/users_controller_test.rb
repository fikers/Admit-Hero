require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
		@base_title="AdmitHero"
	end

  	test "should get new" do
    	get :new
    	assert_response :success
    	assert_select "title", "Sign up | #{@base_title}"
  	end

  	test "index action redirect without login" do
  		get :index
  		assert_redirected_to login_url
  	end

end
