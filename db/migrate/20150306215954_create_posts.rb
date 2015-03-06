class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.int :price
      t.text :description
      t.int :user_account_id
      t.int :book_id

      t.timestamps null: false
    end
  end
end
