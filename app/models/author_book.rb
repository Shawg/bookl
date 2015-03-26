class AuthorBook < ActiveRecord::Base
	belongs_to :author
	belongs_to :book
	self.table_name = 'authors_books'
end