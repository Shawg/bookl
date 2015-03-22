class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :ISBN
      t.integer :volume
      t.string :edition
      t.string :title

      t.timestamps null: false
    end
    add_index :books, :post_id
  end
end
