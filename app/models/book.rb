class Book < ActiveRecord::Base
	has_one :post
	has_many :authors, :through => :author_books
	has_many :author_books
	has_many :courses, :through => :book_courses
	has_many :book_courses

	accepts_nested_attributes_for :post
	accepts_nested_attributes_for :author_books
	accepts_nested_attributes_for :book_courses

end
