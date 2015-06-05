class Book < ActiveRecord::Base
	belongs_to :user_account
	has_one :post, :dependent => :destroy
	has_many :authors, :through => :author_books, :dependent => :destroy
	has_many :author_books, :dependent => :destroy
	has_many :courses, :through => :book_courses, :dependent => :destroy
	has_many :book_courses, :dependent => :destroy

	accepts_nested_attributes_for :post
	accepts_nested_attributes_for :author_books, :allow_destroy => true
	accepts_nested_attributes_for :book_courses, :allow_destroy => true

	validates :user_account, :title, presence: true
	validate :has_author?, :has_course?

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
end
