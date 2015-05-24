class AddColumnToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :active, :boolean, default: true, null: false
  end
end
