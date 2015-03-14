class Remove < ActiveRecord::Migration
  def change
  	remove_column :user_accounts, :password
  end
end
