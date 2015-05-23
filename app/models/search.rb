class Search < ActiveRecord::Base

	has_many :books
	has_many :posts
	has_many :authors
	has_many :courses
end

