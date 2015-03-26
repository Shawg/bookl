class Post < ActiveRecord::Base
	has_one :books
	has_many :availabilitys, dependent: :destroy
	has_many :messages, dependent: :destroy
	belongs_to :user_accounts
end