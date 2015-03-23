class Book < ActiveRecord::Base
	 belongs_to :post
	 has_and_belongs_to_many :authors
	 has_many :course
end
