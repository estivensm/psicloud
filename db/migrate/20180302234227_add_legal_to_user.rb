class AddLegalToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :legal, :boolean
  end
end
