class AddUserAccountsToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :user_account_id, :integer
    add_foreign_key "books", "user_accounts"
  end
end
