require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
	def setup
		@user = User.new(name: "Example User", email: "user@exmaple.com")
	end

	test "name should be presence" do
		@user.name = "     "
		assert_not @user.valid?
	end

	test "email should be presence" do
		@user.email = "   "
		assert_not @user.valid?
	end

	test "name should not be too long" do
		@user.name = "hancle" * 100
		assert_not @user.valid?
	end

	test "email should not be too long" do
		@user.email = "gmail" * 100
	end

	test "email format shoud be valid" do
		valid_email = %w[user@example,com USER_foo.COM user.name@example.foo@bar_baz.com
                             foo@bar+baz.com]
        valid_email.each do |email|
        	@user.email = valid_email
        	assert_not @user.valid?, "#{valid_email.inspect} should be valid"
        end
    end

    test "email should be unique regardless up or down case" do
    	dup_user = @user.dup
    	dup_user.email = @user.email.upcase
    	@user.save
    	assert_not dup_user.valid?
    end

    test "password should not be too short" do
    	@user.password = @user.password_confirmation = "12345"
    	assert_not @user.valid?
    end
end
 