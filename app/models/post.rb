class Post < ActiveRecord::Base
	has_many :books
	has_many :availabilitys
	has_many :messages
end
