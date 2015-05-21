class AddColumnToBooksCoursesAuthorBooks < ActiveRecord::Migration
  def change
  	add_column :books_courses, :id, :primary_key
  	add_column :authors_books, :id, :primary_key
  end
end
