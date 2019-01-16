class CreateClinicHistoryCouples < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_history_couples do |t|
      t.integer :patiend_id
      t.integer :couple_patient_id
      t.integer :previous_unions_patient
      t.integer :previous_unions_couple
      t.integer :previous_children_patient
      t.integer :previous_children_couple
      t.text :problematic_conduct_patient
      t.text :problematic_conduct_couple
      t.text :consultation_reason
      t.text :general_observations
      t.text :actual_situations

      t.timestamps
    end
  end
end
