class AuthorBook < ActiveRecord::Base
	belongs_to :author
	belongs_to :book
	accepts_nested_attributes_for :author
	self.table_name = 'authors_books'

	# validates :author, :book, presence: { message: "must have author" }

	after_destroy do 
		Author.find(author.id).destroy
	end
end