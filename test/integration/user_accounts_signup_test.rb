require 'test_helper'

class UserAccountsSignupTest < ActionDispatch::IntegrationTest

	test "Valid singup information" do
		get signup_path
		assert_difference 'UserAccount.count', 1 do
			post user_accounts_path, user_account: { email: "example@email.com",
													password: "foobar",
													password_confirmation: "foobar"}
		end	
		# assert_template 'user_accounts/show'	
		assert is_logged_in?
	end


	test "Invalid singup information" do
		get signup_path
		assert_no_difference 'user_accounts.count' do
			post user_accounts_path, user_account: { email: "",
													password: "foo",
													password_confirmation: "bar"}
		end	
		assert_template 'user_accounts/new'	
	end
end
