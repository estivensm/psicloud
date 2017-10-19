class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.text :observations
      t.string :place
      t.integer :patient_id
      t.integer :admin_user
      t.integer :user_id
      t.string :attachment

      t.timestamps
    end
  end
end
