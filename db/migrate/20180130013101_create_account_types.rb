class CreateAccountTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :account_types do |t|
      t.string :name
      t.integer :users
      t.integer :file_size

      t.timestamps
    end
  end
end
