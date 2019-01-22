class CreateJoinTableOutcomeFamilyFirstDiagnostico < ActiveRecord::Migration[5.1]
  def change
    create_join_table :outcome_families, :first_diagnosticos do |t|
      # t.index [:outcome_family_id, :first_diagnostico_id]
      # t.index [:first_diagnostico_id, :outcome_family_id]
    end
  end
end
