class AddIpToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ip_address, :string
    add_column :users, :device, :string
  end
end
