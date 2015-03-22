class CreateJoinTablePostAvailability < ActiveRecord::Migration
  def change
    create_join_table :posts, :availabilities do |t|
      # t.index [:post_id, :availability_id]
      # t.index [:availability_id, :post_id]
    end
  end
end
