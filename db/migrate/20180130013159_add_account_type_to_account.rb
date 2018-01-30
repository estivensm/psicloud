class AddAccountTypeToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :account_type_id, :integer
  end
end
