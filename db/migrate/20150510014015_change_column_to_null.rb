class ChangeColumnToNull < ActiveRecord::Migration
  def change
  	change_column :authors, :au_lname, :string, :null => false
  	change_column :authors, :au_fname, :string, :null => false
  	change_column :books, :title, :string, :null => false
  	change_column :posts, :price, :integer, :null => false
  	change_column :posts, :book_id, :integer, :null => false
  	change_column :posts, :user_account_id, :integer, :null => false
  	change_column :user_accounts, :email, :string, :null => false
  end
end
