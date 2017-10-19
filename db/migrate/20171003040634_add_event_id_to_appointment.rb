class AddEventIdToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :google_event_id, :string
  end
end
