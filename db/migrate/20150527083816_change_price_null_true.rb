class ChangePriceNullTrue < ActiveRecord::Migration
  def change
  	change_column_null :posts, :price, true
  end
end
