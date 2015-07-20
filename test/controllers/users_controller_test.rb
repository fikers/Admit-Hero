require 'test_helper'

class UsersControllerTest < ActionController::TestCase

	def setup
		@base_title="AdmitHero"
		@user       = users(:michael)
    	@other_user = users(:archer)
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

  	test "should redirect destroy when not logged in" do
	    assert_no_difference 'User.count' do
	      	delete :destroy, id: @user
	    end
	    assert_redirected_to login_url
	end

  	test "should redirect destroy when logged in as a non-admin" do
	    log_in_as(@other_user)
	    assert_no_difference 'User.count' do
	      	delete :destroy, id: @user
	    end
	    assert_redirected_to root_url
  	end

end
