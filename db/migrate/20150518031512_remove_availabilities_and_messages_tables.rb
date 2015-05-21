class RemoveAvailabilitiesAndMessagesTables < ActiveRecord::Migration
  def change
  	drop_table :availabilities
  	drop_table :messages
  end
end
