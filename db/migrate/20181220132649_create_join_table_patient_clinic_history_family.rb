class CreateJoinTablePatientClinicHistoryFamily < ActiveRecord::Migration[5.1]
  def change
    create_join_table :patients, :clinic_history_families do |t|
      # t.index [:patient_id, :clinic_history_family_id]
      # t.index [:clinic_history_family_id, :patient_id]
    end
  end
end
