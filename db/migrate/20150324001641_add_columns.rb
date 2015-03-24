class AddColumns < ActiveRecord::Migration
  def change
  	add_column :availabilities, :post_id, :integer
  	add_column :messages, :post_id, :integer
  	add_column :messages, :user_account_id, :integer
  	add_column :posts, :book_id, :integer 
  end
end