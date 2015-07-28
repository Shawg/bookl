class Post < ActiveRecord::Base
	belongs_to :book
	validates :price, presence: true

	validate :post_description_length

	def post_description_length
		if description.length > 160 or description.length < 50
			errors.add(:description_error, "Book must have description that is less than 160 characters")
		end
	end
end