class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :ISBN
      t.integer :volume
      t.string :edition
      t.string :title

      t.timestamps null: false
    end
  end
end