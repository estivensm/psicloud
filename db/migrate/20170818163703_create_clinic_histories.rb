class CreateClinicHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_histories do |t|
      t.integer :clinic_history_id
      t.integer :count
      t.text :consultation_reason
      t.text :actual_state
      t.text :diagnostic_hypothesis
      t.text :therapeutic_goal
      t.integer :quantity_appointment
      t.string :frequency_appointment
      t.integer :user_id
      t.integer :admin_user
      t.integer :patient_id
      t.text :type_of_treatment
      t.text :description_appointment

      t.timestamps
    end
  end
end
