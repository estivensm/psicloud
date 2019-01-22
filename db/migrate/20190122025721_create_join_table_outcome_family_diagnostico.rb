class CreateJoinTableOutcomeFamilyDiagnostico < ActiveRecord::Migration[5.1]
  def change
    create_join_table :outcome_families, :diagnostics do |t|
      # t.index [:outcome_family_id, :diagnostic_id]
      # t.index [:diagnostic_id, :outcome_family_id]
    end
  end
end
