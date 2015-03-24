class AddForeignKeys < ActiveRecord::Migration
  def change
  	add_foreign_key "posts", "books", name: "book_id"
    add_foreign_key "messages", "posts", name: "post_id"
    add_foreign_key "messages", "user_accounts", name: "user_id"
    add_foreign_key "availabilities", "posts", name: "post_id"
  end
end
