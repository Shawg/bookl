require 'test_helper'

class UserAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user_account = UserAccount.new( email: "example@email.com",
                      password: "password", password_confirmation: "password")
  end

  test "Should be valid" do
  	assert @user_account.valid?
	end

	test "Email should be present" do
		@user_account.email = "      "
		assert_not @user_account.valid?
	end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user_account.email = valid_address
      assert @user_account.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "Validation should reject improper emails" do
    valid_addresses = %w[user.example.com USER@foo A_b-c@foo+bar.eu
                          first.last@email_co.uk a+.eu]  
    valid_addresses.each do |valid_address|
      @user_account.email = valid_address
      assert_not @user_account.valid?, "#{valid_address.inspect} should be invalid"
    end
  end

  test "emails should be unique" do
    duplicate_user = @user_account.dup
    @user_account.save
    assert_not duplicate_user.valid?
  end

  test "Password must have minimum length" do
    @user_account.password = @user_account.password_confirmation = "a"*5
    assert_not @user_account.valid?
  end
end
