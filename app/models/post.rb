class Post < ActiveRecord::Base
	belongs_to :book
	validates :price, presence: true

	validate :post_description_length

	before_save :format_price

	def format_price
		if self.price < 0
			self.price = 0
		end
		if self.price > 999
			self.price = 999
		end
	end

	def post_description_length
		if description.length > 160
			errors.add(:description, "must be less than 160 characters")
		end
		if description.length < 15
			errors.add(:description, "must be greater than 15 characters")
		end
	end
end