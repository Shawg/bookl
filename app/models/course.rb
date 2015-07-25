class Course < ActiveRecord::Base
	has_many :books, :through => :book_courses
	has_many :book_courses, inverse_of: :course
	validates :course_number, :department, presence: true
end
