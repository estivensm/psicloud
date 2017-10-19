class AddDurationToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :duration, :integer
    add_column :appointments, :name, :string
  end
end
