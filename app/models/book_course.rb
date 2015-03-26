class BookCourse < ActiveRecord::Base
	belongs_to :book
	belongs_to :course
	self.table_name = 'books_courses'
end