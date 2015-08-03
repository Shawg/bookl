class DropJoinTables < ActiveRecord::Migration
	def change
		drop_table :authors_books
		drop_table :books_courses
	end
end
