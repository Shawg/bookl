class CreateJoinTableMessageAccount < ActiveRecord::Migration
  def change
    create_join_table :messages, :user_accounts do |t|
      # t.index [:message_id, :user_account_id]
      # t.index [:user_account_id, :message_id]
    end
  end
end
