class AddIdToTracing < ActiveRecord::Migration[5.1]
  def change
    add_column :tracings, :clinic_history_couple_id, :integer
  end
end
