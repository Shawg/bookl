class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :day
      t.time :startTime
      t.time :endTime
      t.string :location

      t.timestamps null: false
    end
  end
end
