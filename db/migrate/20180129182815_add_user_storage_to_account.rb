class AddUserStorageToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :file_size_add, :integer
    add_column :accounts, :users_quantity_add, :integer
    add_column :accounts, :file_size_now, :integer
    add_column :accounts, :users_quantity_now, :integer
  end
end




