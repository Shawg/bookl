class Post < ActiveRecord::Base
	belongs_to :book
	validates :price, presence: true

	validate :post_description_length

	def post_description_length
		if description.length > 160
			errors.add(:description, "must be less than 160 characters")
		end
		if description.length < 15
			errors.add(:description, "must be greater than 15 characters")
		end
	end
end