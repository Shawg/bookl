require 'test_helper'

# L	def setup
# 		@user_account = UserAccount.first		
# 	end

	class UserAccountsLoginTest < ActionDispatch::IntegrationTest
		test "login with incorrect info" do
			get login_path
			assert_template 'sessions/new'
			post login_path, session: { email: "", password: ""}
			assert_template 'sessions/new'
			assert_not flash.empty?
			get root_path
			# assert flash.empty?
		end
		
		test "Login with correct info" do
			@user_account = user_accounts(:Han)
			get login_path
			puts @user_account.class
	    post login_path, session: { email: @user_account.email, password: 'chewie' }
	    assert_redirected_to @user_account
	    follow_redirect!
	    assert_template 'user_accounts/show'
	    assert_select "a[href=?]", login_path, count: 0
	    assert_select "a[href=?]", logout_path
	    # assert_select "a[href=?]", user_account_path(@user_account)
  	end

		test "login and logoutwith correct info" do
			@user_account = user_accounts(:Han)
			get login_path
	    post login_path, session: { email: @user_account.email, password: 'chewie' }
	    assert is_logged_in?
	    assert_redirected_to @user_account
	    follow_redirect!
	    assert_template 'user_accounts/show'
	    assert_select "a[href=?]", login_path, count: 0
	    assert_select "a[href=?]", logout_path
	    # assert_select "a[href=?]", user_account_path(@user_account)
	    delete logout_path
	    assert_not is_logged_in?
	    assert_redirected_to root_url
	    follow_redirect!
	    assert_select "a[href=?]", login_path
	    assert_select "a[href=?]", logout_path,      count: 0
	    assert_select "a[href=?]", user_account_path(@user_account), count: 0
		end


end
