class CreateJoinTableClinicHistoryCoupleOutcomeFirstDiagnostico < ActiveRecord::Migration[5.1]
  def change
    create_join_table :clinic_history_couple_outcomes, :first_diagnosticos do |t|
      # t.index [:clinic_history_couple_outcome_id, :first_diagnostico_id]
      # t.index [:first_diagnostico_id, :clinic_history_couple_outcome_id]
    end
  end
end
