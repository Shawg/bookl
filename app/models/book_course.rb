class BookCourse < ActiveRecord::Base
	belongs_to :book
	belongs_to :course
	accepts_nested_attributes_for :course
	self.table_name = 'books_courses'

	validates_presence_of :course, :book

	after_destroy do 
		Course.find(course.id).destroy
	end
end