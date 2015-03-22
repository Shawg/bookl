class CreateJoinTablePostMessage < ActiveRecord::Migration
  def change
    create_join_table :posts, :messages do |t|
      # t.index [:post_id, :message_id]
      # t.index [:message_id, :post_id]
    end
  end
end
