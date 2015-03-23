class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :title
      t.string :isbn
      t.string :volume
      t.string :edition
      t.string :au_first
      t.string :au_last
      t.string :course
      t.string :department

      t.timestamps null: false
    end
  end
end
