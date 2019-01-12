class RemovePatiendIdFromClinicHistoryCouple < ActiveRecord::Migration[5.1]
  def change
    remove_column :clinic_history_couples, :patiend_id, :integer
    add_column :clinic_history_couples, :patient_id, :integer
  end
end
