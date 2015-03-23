class Post < ActiveRecord::Base
	has_one :books
	has_many :availabilitys
	has_many :messages
	belongs_to :user_accounts
end
