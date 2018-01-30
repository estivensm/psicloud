class AddNitToAccount < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :nit, :string
  end
end
