class RemoveColumnUserAccountIdFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :user_account_id
  end
end
