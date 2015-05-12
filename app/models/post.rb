class Post < ActiveRecord::Base
	belongs_to :book
	has_many :availabilitys, dependent: :destroy
	has_many :messages, dependent: :destroy
	belongs_to :user_account
end