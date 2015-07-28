require 'test_helper'

class BasicInfoTest < ActiveSupport::TestCase

	def setup 
		@user = users(:michael)
		@basic_info = @user.build_basic_info(birthday:"19911129")
	end

	test "should be valid" do
		assert @basic_info.valid?
	end

	test "user id should be presence" do
		@basic_info.user_id = nil
		assert_not @basic_info.valid?
	end

	test "birthday should has length 8" do
		@basic_info.birthday = "911129"
		assert_not @basic_info.valid?
	end

	test "associative basic_info should be destroy" do
		@user.save
		@user.create_basic_info(birthday: "19911129")
		assert_difference 'BasicInfo.count', -1 do
			@user.destroy
		end
	end

end
