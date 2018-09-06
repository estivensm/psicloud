class CreateClinicHistoriesAndFirstDiagnosticoAssociations < ActiveRecord::Migration[5.1]
  def change
    create_table :clinic_histories_first_diagnosticos do |t|
      t.belongs_to :clinic_history, index: { name: "clinic_history" }
      t.belongs_to :first_diagnostico, index: { name: "first_diagnostico" }
    end
  end
end
