class Book < ActiveRecord::Base
	belongs_to :user_account
	has_one :post, :dependent => :destroy
	has_many :authors, :through => :author_books, :dependent => :destroy
	has_many :author_books, :dependent => :destroy
	has_many :courses, :through => :book_courses, :dependent => :destroy
	has_many :book_courses, :dependent => :destroy

	accepts_nested_attributes_for :post
	accepts_nested_attributes_for :author_books, :allow_destroy => true, :reject_if => :reject_auth 
	accepts_nested_attributes_for :book_courses, :allow_destroy => true

	validates :user_account, :title, presence: true
	validate :has_author?, :has_course?, :has_too_many_course?, :has_too_many_author?

	def reject_auth(attributes)
	  exists = attributes['id'].present?
	  empty = attributes[:author_attributes][:au_fname].blank? and attributes[:author_attributes][:au_lname].blank?
	  attributes.merge!({:_destroy => 1}) if exists and empty
	  return (!exists and empty)
	end

	def has_author?
		if author_books.blank?
			errors.add(:authors, "must have at least one author")
		end
	end

	def has_course?
		if book_courses.blank?
			errors.add(:courses, "must have at least one course")
		end
	end

	def has_too_many_course?
		if book_courses.length > 3
			errors.add(:courses, "cannot have more than 3 courses")
		end
	end

	def has_too_many_author?
		if author_books.length > 3
			errors.add(:courses, "cannot have more than 3 authors")
		end
	end
end
