require 'test_helper'

class TagTest < ActiveSupport::TestCase
	def setup 
		@user = users(:michael)
		@tag = @user.build_tag(summer_programs: true)
	end

	test "should be valid" do
		assert @tag.valid?
	end

	test "user id should be presence" do
		@tag.user_id = nil
		assert_not @tag.valid?
	end

	test "associative tag should be destroy" do
		@user.save
		@user.create_tag(summer_programs: true)
		assert_difference 'Tag.count', -1 do
			@user.destroy
		end
	end
end
