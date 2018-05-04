class AddReasonCancelToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :reason_cancel, :text
  end
end
