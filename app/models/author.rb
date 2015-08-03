class Author < ActiveRecord::Base
	belongs_to :books

	validates :au_lname, presence: true
end