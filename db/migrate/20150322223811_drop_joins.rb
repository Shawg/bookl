class DropJoins < ActiveRecord::Migration
  def change
  	drop_table :availabilities_posts
  	drop_table :books_posts
  	drop_table :messages_posts
  	drop_table :messages_user_accounts
  	drop_table :posts_user_accounts
  end
end
