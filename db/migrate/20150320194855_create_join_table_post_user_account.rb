class CreateJoinTablePostUserAccount < ActiveRecord::Migration
  def change
    create_join_table :posts, :user_accounts do |t|
      # t.index [:post_id, :user_account_id]
      # t.index [:user_account_id, :post_id]
    end
  end
end
