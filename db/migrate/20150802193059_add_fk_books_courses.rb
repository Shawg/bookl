class AddFkBooksCourses < ActiveRecord::Migration
  def change
  	drop_table :searches
  	add_column(:authors, :book_id, :integer)
  	add_column(:courses, :book_id, :integer)
  	add_foreign_key(:authors, :books)
  	add_foreign_key(:courses, :books)
  end
end
