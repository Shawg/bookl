class Author < ActiveRecord::Base
	has_many :books, :through => :author_books
	has_many :author_books, inverse_of: :author
end