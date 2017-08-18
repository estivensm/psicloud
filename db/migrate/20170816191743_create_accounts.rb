class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :logo
      t.integer :admin_user
      t.integer :users_quantity
      t.integer :file_size
      t.string :account_type
      t.boolean :state

      t.timestamps
    end
  end
end
