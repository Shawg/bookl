class AddNullFalseToBooks < ActiveRecord::Migration
  def change
  	change_column_null(:books, :user_account_id, false)
  end
end
