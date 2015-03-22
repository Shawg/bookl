class CreateJoinTablePostBook < ActiveRecord::Migration
  def change
    create_join_table :posts, :books do |t|
      # t.index [:post_id, :book_id]
      # t.index [:book_id, :post_id]
    end
  end
end
