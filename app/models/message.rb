class Message < ActiveRecord::Base
	belongs_to :post
	belongs_to :usser_account
end
