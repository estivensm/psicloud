class AddCampoToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :professional_card, :string
  end
end
