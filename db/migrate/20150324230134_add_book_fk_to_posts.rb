class AddBookFkToPosts < ActiveRecord::Migration
  def change
  	add_foreign_key "posts", "user_accounts", name: "user_account_id"
  end
end
