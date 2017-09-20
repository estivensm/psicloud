class CreateClinicHistoriesAndDiagnosticsAssociations < ActiveRecord::Migration[5.1]
   def change
    create_table :clinic_histories_diagnostics , id: false do |t|
    	t.belongs_to :clinic_history, index: true
      t.belongs_to :diagnostic, index: true
    end
  end
  def down
    
    drop_table :clinic_histories_diagnostics
  end
end
