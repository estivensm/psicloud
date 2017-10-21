class AddStateToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :state, :string
  end
end
