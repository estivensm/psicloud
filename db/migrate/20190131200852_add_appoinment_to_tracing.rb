class AddAppoinmentToTracing < ActiveRecord::Migration[5.1]
  def change
    add_column :tracings, :appointment_id, :integer
  end
end
