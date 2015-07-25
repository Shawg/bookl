class Author < ActiveRecord::Base
	has_many :books, :through => :author_books
	has_many :author_books, inverse_of: :author

	validates :au_lname, presence: true
end