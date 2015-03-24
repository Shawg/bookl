class AddColumnToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :user_account_id, :integer 
  end
end
