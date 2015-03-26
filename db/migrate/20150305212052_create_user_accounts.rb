class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts do |t|
      t.string :email
      t.string :password
      t.boolean :isAdmin?, :default => false

      t.timestamps null: false
    end
  end
end
