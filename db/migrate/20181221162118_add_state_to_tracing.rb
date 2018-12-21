class AddStateToTracing < ActiveRecord::Migration[5.1]
  def change
    add_column :tracings, :state, :boolean
  end
end
