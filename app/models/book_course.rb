class BookCourse < ActiveRecord::Base
	belongs_to :book
	belongs_to :course
end