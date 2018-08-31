class AddCamposToTracings < ActiveRecord::Migration[5.1]
  def change
    add_column :tracings, :observation, :text
    add_column :tracings, :evolution, :text
  end
end
