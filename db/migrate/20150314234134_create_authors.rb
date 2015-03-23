class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :au_lname
      t.string :au_fname

      t.timestamps null: false
    end
  end
end
