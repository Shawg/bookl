class Book < ActiveRecord::Base
	belongs_to :user_account
	has_one :post, :dependent => :destroy
	has_many :authors, :dependent => :destroy
	has_many :courses, :dependent => :destroy

	accepts_nested_attributes_for :post
	accepts_nested_attributes_for :authors, :allow_destroy => true, :reject_if => :reject_author 
	accepts_nested_attributes_for :courses, :allow_destroy => true, :reject_if => :reject_course

	validates :user_account, :title, presence: true
	validate :has_author?, :has_course?, :has_too_many_course?, :has_too_many_author?

	def reject_author(attributes)
		return false if authors.length == 0
		exists = attributes['id'].present?
		empty = attributes[:au_fname].blank? and attributes[:au_lname].blank?
		attributes.merge!({:_destroy => 1}) if exists and empty
		return (!exists and empty)
	end

	def reject_course(attributes)
		return false if courses.length == 0
		exists = attributes['id'].present?
		empty = attributes[:department].blank? and attributes[:course_number].blank?
		attributes.merge!({:_destroy => 1}) if exists and empty
		return (!exists and empty)
	end

	def has_author?
		if authors.blank?
			errors.add(:authors, "must have at least one author")
		end
	end

	def has_course?
		if courses.blank?
			errors.add(:courses, "must have at least one course")
		end
	end

	def has_too_many_course?
		if courses.length > 3
			errors.add(:courses, "cannot have more than 3 courses")
		end
	end

	def has_too_many_author?
		if authors.length > 3
			errors.add(:courses, "cannot have more than 3 authors")
		end
	end
end
