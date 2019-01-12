class CreateJoinTableClinicHistoryCoupleOutcomeDiagnostic < ActiveRecord::Migration[5.1]
  def change
    create_join_table :clinic_history_couple_outcomes, :diagnostics do |t|
      # t.index [:clinic_history_couple_outcome_id, :diagnostic_id]
      # t.index [:diagnostic_id, :clinic_history_couple_outcome_id]
    end
  end
end
