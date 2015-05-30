class Post < ActiveRecord::Base
	belongs_to :book
	validates :price, presence: true

	# validate :post_has_price

	# def post_has_price
	# 	if price.blank? || nil
	# 		errors.add(:price_error, "Book must have price")
	# 	end
	# end
end