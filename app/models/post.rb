class Post < ActiveRecord::Base
	has_one :book
	has_many :availabilitys, dependent: :destroy
	has_many :messages, dependent: :destroy
	belongs_to :user_accounts
	accepts_nested_attributes_for :book
end