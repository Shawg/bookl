class AddKeysToJoinTable < ActiveRecord::Migration
  def change
    add_foreign_key "authors_books", "authors", name: "author_id"
    add_foreign_key "authors_books", "books", name: "book_id"
    add_foreign_key "books_courses", "books", name: "book_id"
    add_foreign_key "books_courses", "courses", name: "course_id"
  end
end
