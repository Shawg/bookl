class Course < ActiveRecord::Base
	has_many :books, :through => :book_courses
	has_many :book_courses, inverse_of: :course
	validates :course_number, :department, presence: true
	validate :department_format
	validate :course_number_format

	def department_format
		unless (department.nil?)
			unless (all_letters department)
				errors.add(:department, "must only contain letters")
			end
			if (department.length > 4)
				errors.add(:department, "must use code that is under 5 letters (ex. CPSC)")
			end
		end
	end

	def course_number_format
		unless course_number.nil?
			unless (all_digits course_number)
				errors.add(:course_number, "must only contain numbers")
			end
			if (course_number.to_s.length > 4)
				errors.add(:course_number, "must use code that is under 5 numbers (ex. 101)")
			end
		end
	end

	def all_digits(str)
	    str.to_s =~ /\A\d+\z/ ? true : false
	end

	def all_letters(str)
	    # Use 'str[/[a-zA-Z]*/] == str' to let all_letters
	    # yield true for the empty string
	    str[/[a-zA-Z]+/]  == str
	end
end
