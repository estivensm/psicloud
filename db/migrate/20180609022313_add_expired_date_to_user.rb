class AddExpiredDateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :expires_ats, :string
  end
end
