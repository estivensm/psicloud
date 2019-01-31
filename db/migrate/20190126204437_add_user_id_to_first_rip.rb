class AddUserIdToFirstRip < ActiveRecord::Migration[5.1]
  def change
    add_column :first_rips, :user_id, :integer
    add_column :first_rips, :admin_user, :integer
  end
end
